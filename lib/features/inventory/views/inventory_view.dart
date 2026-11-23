import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/validators.dart';
import '../../../providers/app_providers.dart';

class InventoryView extends ConsumerWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parts = ref.watch(sparePartsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Inventario de Repuestos')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (_) => const _CreateSparePartDialog(),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Nuevo repuesto'),
      ),
      body: parts.when(
        data: (items) => items.isEmpty
            ? const Center(child: Text('No hay repuestos registrados.'))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final p = items[index];
                  final low = p.quantity <= p.minimumStock;
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.memory, color: low ? Colors.deepOrange : Colors.blue),
                      title: Text(p.name),
                      subtitle: Text('${p.code} • Precio: ${_money(p.unitPriceCents)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('${p.quantity} uds.', style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(low ? 'Stock bajo' : 'Disponible', style: TextStyle(fontSize: 11, color: low ? Colors.deepOrange : Colors.green)),
                            ],
                          ),
                          PopupMenuButton<String>(
                            tooltip: 'Opciones del repuesto',
                            onSelected: (value) { if (value == 'delete') _confirmDeletePart(context, ref, p.id, p.name); },
                            itemBuilder: (_) => const [PopupMenuItem(value: 'delete', child: Row(children: [Icon(Icons.delete_outline, color: Colors.red), SizedBox(width: 8), Text('Eliminar')]))],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }


  Future<void> _confirmDeletePart(BuildContext context, WidgetRef ref, int id, String name) async {
    final confirmed = await showDialog<bool>(context: context, builder: (dialogContext) => AlertDialog(
      title: const Text('Retirar repuesto'),
      content: Text('¿Quieres retirar "$name" del inventario? Se ocultará de la lista, pero se conservará su registro histórico.'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancelar')),
        FilledButton.tonalIcon(style: FilledButton.styleFrom(foregroundColor: Colors.red), onPressed: () => Navigator.pop(dialogContext, true), icon: const Icon(Icons.delete_outline), label: const Text('Retirar')),
      ],
    ));
    if (confirmed != true) return;
    try {
      await ref.read(workshopRepositoryProvider).deleteSparePart(id);
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Repuesto retirado del inventario.')));
    } catch (e) {
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No se pudo retirar: $e')));
    }
  }

  String _money(int cents) => '\$${(cents / 100).toStringAsFixed(2)}';
}

class _CreateSparePartDialog extends ConsumerStatefulWidget {
  const _CreateSparePartDialog();

  @override
  ConsumerState<_CreateSparePartDialog> createState() => _CreateSparePartDialogState();
}

class _CreateSparePartDialogState extends ConsumerState<_CreateSparePartDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _codeController;
  late final TextEditingController _priceController;
  late final TextEditingController _quantityController;
  late final TextEditingController _minStockController;
  final _formKey = GlobalKey<FormState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _codeController = TextEditingController();
    _priceController = TextEditingController();
    _quantityController = TextEditingController(text: '1');
    _minStockController = TextEditingController(text: '1');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _minStockController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    setState(() => _isSaving = true);
    try {
      final priceDouble = double.parse(_priceController.text.trim().replaceAll(',', '.'));
      final priceCents = (priceDouble * 100).round();
      await ref.read(workshopRepositoryProvider).createSparePart(
        name: _nameController.text,
        code: _codeController.text,
        unitPriceCents: priceCents,
        quantity: int.parse(_quantityController.text.trim()),
        minimumStock: int.parse(_minStockController.text.trim()),
      );

      if (mounted) {
        navigator.pop();
        messenger.showSnackBar(
          const SnackBar(content: Text('Repuesto agregado correctamente.')),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSaving = false);
        final errText = e.toString().contains('UNIQUE')
            ? 'Ya existe un repuesto con ese código.'
            : 'Error al guardar: $e';
        messenger.showSnackBar(
          SnackBar(content: Text(errText)),
        );
      }
    }
  }

  void _onCancel() {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar Repuesto'),
      content: SizedBox(
        width: 420,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del repuesto',
                    hintText: 'Ej: Pantalla OLED, Batería',
                    prefixIcon: Icon(Icons.build_outlined),
                  ),
                  validator: (v) => FormValidators.validateMinLength(v, 3, 'El nombre'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _codeController,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9\-]")),
                    LengthLimitingTextInputFormatter(20),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Código del repuesto',
                    hintText: 'Ej: REP-PAT-01',
                    prefixIcon: Icon(Icons.qr_code),
                  ),
                  validator: (v) => FormValidators.validateMinLength(v, 3, 'El código'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _priceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Precio unitario (\$)',
                    hintText: 'Ej: 45.00',
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  validator: (v) => FormValidators.validateAmount(v, 'El precio'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Cantidad inicial (unidades)',
                    prefixIcon: Icon(Icons.numbers),
                  ),
                  validator: (v) => FormValidators.validatePositiveInteger(v, 'La cantidad'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _minStockController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Stock mínimo para alertas',
                    prefixIcon: Icon(Icons.warning_amber_outlined),
                  ),
                  validator: (v) => FormValidators.validatePositiveInteger(v, 'El stock mínimo'),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : _onCancel,
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: _isSaving ? null : _submit,
          child: _isSaving
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
              : const Text('Guardar'),
        ),
      ],
    );
  }
}
