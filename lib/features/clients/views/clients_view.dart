import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/validators.dart';
import '../../../providers/app_providers.dart';
import 'package:drift/drift.dart' show OrderingTerm;

final clientsListProvider = StreamProvider((ref) {
  final db = ref.watch(databaseProvider);
  return (db.select(db.clients)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();
});

class ClientsView extends ConsumerWidget {
  const ClientsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientsListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Clientes')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (_) => const _AddClientDialog(),
        ),
        icon: const Icon(Icons.person_add),
        label: const Text('Nuevo cliente'),
      ),
      body: clients.when(
        data: (items) => items.isEmpty
            ? const Center(child: Text('Los clientes aparecerán aquí al crear órdenes.'))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: items.length,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Icon(Icons.person_rounded, color: Theme.of(context).colorScheme.primary),
                    ),
                    title: Text(items[i].fullName, style: const TextStyle(fontWeight: FontWeight.w700)),
                    subtitle: Text(items[i].phone),
                    trailing: IconButton(
                      tooltip: 'Eliminar cliente',
                      icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
                      onPressed: () => _confirmDeleteClient(context, ref, items[i].id, items[i].fullName),
                    ),
                  ),
                ),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Future<void> _confirmDeleteClient(BuildContext context, WidgetRef ref, int id, String name) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Eliminar cliente'),
        content: Text('¿Eliminar a $name? También se eliminarán sus equipos y órdenes de reparación. Esta acción no se puede deshacer.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancelar')),
          FilledButton.tonalIcon(
            style: FilledButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () => Navigator.pop(dialogContext, true),
            icon: const Icon(Icons.delete_outline), label: const Text('Eliminar'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    try {
      await ref.read(workshopRepositoryProvider).deleteClient(id);
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cliente eliminado.')));
    } catch (e) {
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No se pudo eliminar: $e')));
    }
  }
}

class _AddClientDialog extends ConsumerStatefulWidget {
  const _AddClientDialog();

  @override
  ConsumerState<_AddClientDialog> createState() => _AddClientDialogState();
}

class _AddClientDialogState extends ConsumerState<_AddClientDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isSaving = true);
    try {
      await ref.read(workshopRepositoryProvider).createClient(
        _nameController.text,
        _phoneController.text,
      );

      if (mounted) {
        final messenger = ScaffoldMessenger.of(context);
        Navigator.of(context).pop();
        messenger.showSnackBar(const SnackBar(content: Text('Cliente registrado exitosamente.')));
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Registrar nuevo cliente'),
      content: SizedBox(
        width: 400,
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
                    labelText: 'Nombre completo',
                    hintText: 'Ej: María Gómez',
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
                    labelText: 'Número de teléfono',
                    hintText: 'Ej: 3109876543',
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  validator: FormValidators.validatePhone,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : () => Navigator.of(context).pop(),
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
