import 'package:bartech_app/presentation/bloc/product_customize_bloc/product_customize_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccompanimentList extends StatelessWidget {
  const AccompanimentList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCustomizeBloc, ProductCustomizeState>(
      builder: (context, state) {
        return SizedBox(
          height: 240, // O ajusta a cuantos items quieras mostrar a la vez
          child: ListView.separated(
            itemCount: state.accompaniments.length,
            separatorBuilder: (_, __) => const SizedBox(height: 6),
            itemBuilder: (context, index) {
              final acc = state.accompaniments[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(acc["icon"], color: Colors.orange[700]),
                ),
                title: Text(acc["name"]),
                subtitle: Text(
                  "\$${(acc["price"] as double).toStringAsFixed(2)}",
                ),
                trailing: SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, size: 18),
                        onPressed: () {
                          if (acc["quantity"] > 0) {
                            context.read<ProductCustomizeBloc>().add(
                              SetAccompanimentQuantity(
                                index: index,
                                quantity: acc["quantity"] - 1,
                              ),
                            );
                          }
                        },
                      ),
                      Text(
                        acc["quantity"].toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, size: 18),
                        onPressed: () {
                          context.read<ProductCustomizeBloc>().add(
                            SetAccompanimentQuantity(
                              index: index,
                              quantity: acc["quantity"] + 1,
                            ),
                          );
                        },
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
}
