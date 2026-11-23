import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/app_providers.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersProvider);
    final parts = ref.watch(sparePartsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Tu Solution'), actions: const [
        Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.handyman)),
      ]),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Text('Resumen del taller', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        orders.when(
          data: (items) {
            int count(String status) => items.where((e) => e.status == status).length;
            return GridView.count(
              crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.7, crossAxisSpacing: 12, mainAxisSpacing: 12,
              children: [
                _MetricCard(title: 'Recibidas', value: '${count('Recibida')}', icon: Icons.inbox_outlined),
                _MetricCard(title: 'En reparación', value: '${count('En reparación')}', icon: Icons.build_circle_outlined),
                _MetricCard(title: 'Listas', value: '${count('Lista')}', icon: Icons.check_circle_outline),
                _MetricCard(title: 'Abiertas', value: '${items.where((e) => !{'Entregada','Cancelada'}.contains(e.status)).length}', icon: Icons.pending_actions),
              ],
            );
          },
          loading: () => const SizedBox(
            height: 140,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Card(
            color: Colors.red.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Error al cargar órdenes: $e', style: TextStyle(color: Colors.red.shade900)),
            ),
          ),
        ),
        const SizedBox(height: 22),
        Text('Repuestos por debajo del mínimo', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        parts.when(
          data: (items) {
            final low = items.where((p) => p.quantity <= p.minimumStock).toList();
            if (low.isEmpty) return const Card(child: ListTile(title: Text('No hay alertas de stock.')));
            return Column(children: low.map((p) => Card(child: ListTile(
              leading: const Icon(Icons.warning_amber_rounded, color: Colors.deepOrange),
              title: Text(p.name), subtitle: Text('Código: ${p.code}'),
              trailing: Text('${p.quantity} uds.'),
            ))).toList());
          },
          loading: () => const LinearProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
        ),
      ]),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.title, required this.value, required this.icon});
  final String title, value;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Row(children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 28),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          Text(title, style: Theme.of(context).textTheme.bodySmall),
        ])),
      ]),
    ),
  );
}
