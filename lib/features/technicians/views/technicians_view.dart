import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/validators.dart';
import '../../../providers/app_providers.dart';

class TechniciansView extends ConsumerWidget {
  const TechniciansView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final techAsync = ref.watch(techniciansProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Técnicos del Taller')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (_) => const _AddTechnicianDialog(),
        ),
        icon: const Icon(Icons.person_add_alt_1),
        label: const Text('Nuevo técnico'),
      ),
      body: techAsync.when(
        data: (items) => items.isEmpty
            ? const Center(child: Text('No hay técnicos registrados.'))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: items.length,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.engineering_outlined)),
                    title: Text(items[i].name),
                    subtitle: Text('ID Técnico: #${items[i].id}'),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Chip(label: Text('Activo'), backgroundColor: Color(0xFFE8F5E9), labelStyle: TextStyle(color: Colors.green)),
                      IconButton(
                        tooltip: 'Desactivar técnico',
                        icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
                        onPressed: () => _confirmDeleteTechnician(context, ref, items[i].id, items[i].name),
                      ),
                    ]),
                  ),
                ),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Future<void> _confirmDeleteTechnician(BuildContext context, WidgetRef ref, int id, String name) async {
    final confirmed = await showDialog<bool>(context: context, builder: (dialogContext) => AlertDialog(
      title: const Text('Desactivar técnico'),
      content: Text('¿Desactivar a $name? Se conservarán las órdenes históricas asociadas.'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancelar')),
        FilledButton.tonalIcon(style: FilledButton.styleFrom(foregroundColor: Colors.red), onPressed: () => Navigator.pop(dialogContext, true), icon: const Icon(Icons.person_off_outlined), label: const Text('Desactivar')),
      ],
    ));
    if (confirmed != true) return;
    try {
      await ref.read(workshopRepositoryProvider).deleteTechnician(id);
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Técnico desactivado.')));
    } catch (e) {
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No se pudo desactivar: $e')));
    }
  }
}

class _AddTechnicianDialog extends ConsumerStatefulWidget {
  const _AddTechnicianDialog();

  @override
  ConsumerState<_AddTechnicianDialog> createState() => _AddTechnicianDialogState();
}

class _AddTechnicianDialogState extends ConsumerState<_AddTechnicianDialog> {
  late final TextEditingController _nameController;
  final _formKey = GlobalKey<FormState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isSaving = true);
    try {
      await ref.read(workshopRepositoryProvider).createTechnician(_nameController.text);

      if (mounted) {
        final messenger = ScaffoldMessenger.of(context);
        Navigator.of(context).pop();
        messenger.showSnackBar(const SnackBar(content: Text('Técnico registrado correctamente.')));
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Registrar nuevo técnico'),
      content: SizedBox(
        width: 400,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZáéíóúÁÉÍÓÚñÑ\s\.-]")),
            ],
            decoration: const InputDecoration(
              labelText: 'Nombre del técnico',
              hintText: 'Ej: Carlos Ramírez',
              prefixIcon: Icon(Icons.person_outline),
            ),
            validator: FormValidators.validateName,
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
