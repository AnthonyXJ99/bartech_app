import 'package:bartech_app/presentation/bloc/product_customize_bloc/product_customize_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccompanimentList extends StatelessWidget {
  const AccompanimentList({super.key});

  double _getListHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) return screenHeight * 0.35; // Desktop
    if (screenWidth > 800) return screenHeight * 0.30;  // Tablet
    return 240; // Mobile
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCustomizeBloc, ProductCustomizeState>(
      builder: (context, state) {
        return SizedBox(
          height: _getListHeight(context),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: state.accompaniments.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final acc = state.accompaniments[index];
              final isSelected = (acc["quantity"] as int) > 0;
              final canEnlarge = acc["enlargementItemCode"] != null && 
                                acc["enlargementItemCode"] != '';
              final isEnlarged = acc["isEnlarged"] as bool? ?? false;
              
              return Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.orange.withOpacity(0.05) : Colors.grey[50],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? Colors.orange.withOpacity(0.3) : Colors.grey.withOpacity(0.15),
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Icon
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.orange.withOpacity(0.15) : Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          acc["icon"],
                          color: isSelected ? Colors.orange[600] : Colors.grey[600],
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      
                      // Name and Price
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              acc["name"],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                // Precio
                                Text(
                                  _calculatePrice(acc).startsWith("CLP") 
                                    ? _calculatePrice(acc)
                                    : "CLP \$${_calculatePrice(acc)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.orange[600],
                                  ),
                                ),
                                // Indicador de agrandado
                                if (canEnlarge && isEnlarged) ...[
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.green.withOpacity(0.3)),
                                    ),
                                    child: const Text(
                                      "Agrandado",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            // Botón de agrandar
                            if (canEnlarge) ...[
                              const SizedBox(height: 6),
                              GestureDetector(
                                onTap: () {
                                  context.read<ProductCustomizeBloc>().add(
                                    ToggleAccompanimentEnlargement(index: index),
                                  );
                                },
                                child: Text(
                                  isEnlarged ? "Quitar agrandado" : "Agrandar (+descuento)",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isEnlarged ? Colors.red[600] : Colors.blue[600],
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      
                      // Quantity Controls
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildQuantityButton(
                              context,
                              Icons.remove,
                              () {
                                if (acc["quantity"] > 0) {
                                  context.read<ProductCustomizeBloc>().add(
                                    SetAccompanimentQuantity(
                                      index: index,
                                      quantity: acc["quantity"] - 1,
                                    ),
                                  );
                                }
                              },
                              isEnabled: acc["quantity"] > 0,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                acc["quantity"].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            _buildQuantityButton(
                              context,
                              Icons.add,
                              () {
                                context.read<ProductCustomizeBloc>().add(
                                  SetAccompanimentQuantity(
                                    index: index,
                                    quantity: acc["quantity"] + 1,
                                  ),
                                );
                              },
                              isEnabled: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildQuantityButton(
    BuildContext context,
    IconData icon,
    VoidCallback onPressed,
    {required bool isEnabled}
  ) {
    return InkWell(
      onTap: isEnabled ? onPressed : null,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isEnabled 
            ? (icon == Icons.add ? Colors.orange[600] : Colors.grey[700])
            : Colors.grey[400],
        ),
      ),
    );
  }

  String _calculatePrice(Map<String, dynamic> acc) {
    double basePrice = acc["price"] as double;
    bool isEnlarged = acc["isEnlarged"] as bool? ?? false;
    
    if (isEnlarged && acc["enlargementItemCode"] != null && acc["enlargementItemCode"] != '') {
      double enlargementDiscount = acc["enlargementDiscount"] as double;
      double finalPrice = basePrice - enlargementDiscount;
      
      // Mostrar precio original y precio con descuento
      return "CLP \$${basePrice.toStringAsFixed(0)} → \$${finalPrice.toStringAsFixed(0)}";
    }
    
    return basePrice.toStringAsFixed(0);
  }
}
