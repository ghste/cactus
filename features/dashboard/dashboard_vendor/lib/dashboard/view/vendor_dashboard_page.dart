import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/vendor_dashboard_view_model.dart';

class VendorDashboardPage extends StatelessWidget {
  const VendorDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<VendorDashboardViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Vendor Dashboard')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Semantics(
                        header: true,
                        child: const Text(
                          'Choose a cactus to promote',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        children: [
                          for (
                            var index = 0;
                            index < viewModel.cactusOptions.length;
                            index++
                          )
                            ChoiceChip(
                              label: Text(
                                '${viewModel.cactusOptions[index]} \$${viewModel.cactusPrices[index].toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              selected: viewModel.selectedIndex == index,
                              onSelected: (_) => viewModel.selectCactus(index),
                            ),
                        ],
                      ),
                      if (viewModel.selectedPrice != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          'Price: \$${viewModel.selectedPrice!.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed:
                            viewModel.selectedCactus == null
                                ? null
                                : viewModel.promoteSelectedCactus,
                        child: const Text('Promote a Cactus'),
                      ),
                      if (viewModel.promotedCactus != null) ...[
                        const SizedBox(height: 12),
                        Semantics(
                          liveRegion: true,
                          child: Text(
                            'Promoted: ${viewModel.promotedCactus}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed:
                    () => NavigationStack().push(
                      context,
                      AppRoutes.vendor.settings,
                    ),
                child: const Text('Go to Vendor Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
