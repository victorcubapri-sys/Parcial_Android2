import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/validators.dart';
import '../../../providers/app_providers.dart';

class OrdersView extends ConsumerWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Órdenes de reparación')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (_) => const _CreateOrderDialog(),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Nueva orden'),
      ),
      body: orders.when(
        data: (items) => items.isEmpty
            ? const Center(child: Text('Todavía no hay órdenes registradas.'))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final order = items[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text('#${order.id}')),
                      title: Text(order.code),
                      subtitle: Text('${order.reportedIssue}\nEstado: ${order.status}'),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PopupMenuButton<String>(
                            tooltip: 'Cambiar estado',
                            onSelected: (status) async {
                              try {
                                await ref.read(workshopRepositoryProvider).updateOrderStatus(order.id, status);
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
                                }
                              }
                            },
                            itemBuilder: (_) => const [
                              PopupMenuItem(value: 'Recibida', child: Text('Recibida')),
                              PopupMenuItem(value: 'En reparación', child: Text('En reparación')),
                              PopupMenuItem(value: 'Lista', child: Text('Lista')),
                              PopupMenuItem(value: 'Entregada', child: Text('Entregada')),
                              PopupMenuItem(value: 'Cancelada', child: Text('Cancelada')),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
                            tooltip: 'Eliminar orden',
                            onPressed: () => _confirmDeleteOrder(context, ref, order.id, order.code),
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

  Future<void> _confirmDeleteOrder(BuildContext context, WidgetRef ref, int id, String code) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar Orden'),
        content: Text('¿Estás seguro de eliminar la orden $code? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await ref.read(workshopRepositoryProvider).deleteOrder(id);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Orden eliminada correctamente.')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al eliminar: $e')),
          );
        }
      }
    }
  }
}

class _CreateOrderDialog extends ConsumerStatefulWidget {
  const _CreateOrderDialog();

  @override
  ConsumerState<_CreateOrderDialog> createState() => _CreateOrderDialogState();
}

class _CreateOrderDialogState extends ConsumerState<_CreateOrderDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _brandController;
  late final TextEditingController _modelController;
  late final TextEditingController _issueController;
  final _formKey = GlobalKey<FormState>();
  String _selectedType = 'Celular';
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _brandController = TextEditingController();
    _modelController = TextEditingController();
    _issueController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _brandController.dispose();
    _modelController.dispose();
    _issueController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    setState(() => _isSaving = true);
    try {
      final repo = ref.read(workshopRepositoryProvider);
      final clientId = await repo.createClient(_nameController.text, _phoneController.text);
      final deviceId = await repo.createDevice(
        clientId: clientId,
        type: _selectedType,
        brand: _brandController.text,
        model: _modelController.text,
      );
      await repo.createOrder(clientId: clientId, deviceId: deviceId, issue: _issueController.text);

      if (mounted) {
        navigator.pop();
        messenger.showSnackBar(
          const SnackBar(content: Text('Orden creada correctamente.')),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSaving = false);
        messenger.showSnackBar(
          SnackBar(content: Text('No se pudo crear la orden: $e')),
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
      title: const Text('Registrar orden de reparación'),
      content: SizedBox(
        width: 440,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZáéíóúÁÉÍÓÚñÑ\s\.-]")),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Nombre del cliente',
                    hintText: 'Ej: Juan Pérez',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: FormValidators.validateName,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Teléfono',
                    hintText: 'Ej: 3001234567',
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  validator: FormValidators.validatePhone,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de equipo',
                    prefixIcon: Icon(Icons.devices_outlined),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Celular', child: Text('Celular')),
                    DropdownMenuItem(value: 'Tablet', child: Text('Tablet')),
                    DropdownMenuItem(value: 'Laptop', child: Text('Laptop')),
                    DropdownMenuItem(value: 'Smartwatch', child: Text('Smartwatch')),
                    DropdownMenuItem(value: 'Consola', child: Text('Consola')),
                    DropdownMenuItem(value: 'Otro', child: Text('Otro')),
                  ],
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedType = val);
                  },
                  validator: (val) => FormValidators.required(val, 'El tipo de equipo'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _brandController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Marca',
                    hintText: 'Ej: Samsung, Apple, Xiaomi',
                    prefixIcon: Icon(Icons.branding_watermark_outlined),
                  ),
                  validator: (v) => FormValidators.validateMinLength(v, 2, 'La marca'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _modelController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Modelo',
                    hintText: 'Ej: Galaxy S21, iPhone 13',
                    prefixIcon: Icon(Icons.smartphone_outlined),
                  ),
                  validator: (v) => FormValidators.validateMinLength(v, 1, 'El modelo'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _issueController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Falla reportada',
                    hintText: 'Describa la falla del equipo...',
                    prefixIcon: Icon(Icons.report_problem_outlined),
                  ),
                  validator: (v) => FormValidators.validateMinLength(v, 5, 'La falla reportada'),
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
