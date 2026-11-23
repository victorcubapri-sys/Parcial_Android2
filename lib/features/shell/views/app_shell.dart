import 'package:flutter/material.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../orders/views/orders_view.dart';
import '../../inventory/views/inventory_view.dart';
import '../../clients/views/clients_view.dart';
import '../../technicians/views/technicians_view.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 0;
  final pages = const [DashboardView(), OrdersView(), InventoryView(), ClientsView(), TechniciansView()];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: IndexedStack(index: index, children: pages)),
    bottomNavigationBar: NavigationBar(
      height: 72,
      selectedIndex: index,
      onDestinationSelected: (value) => setState(() => index = value),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.space_dashboard_outlined), selectedIcon: Icon(Icons.space_dashboard_rounded), label: 'Inicio'),
        NavigationDestination(icon: Icon(Icons.handyman_outlined), selectedIcon: Icon(Icons.handyman_rounded), label: 'Órdenes'),
        NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2_rounded), label: 'Almacén'),
        NavigationDestination(icon: Icon(Icons.groups_outlined), selectedIcon: Icon(Icons.groups_rounded), label: 'Clientes'),
        NavigationDestination(icon: Icon(Icons.engineering_outlined), selectedIcon: Icon(Icons.engineering_rounded), label: 'Técnicos'),
      ],
    ),
  );
}
