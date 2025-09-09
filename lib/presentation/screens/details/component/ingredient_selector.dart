import 'package:flutter/material.dart';

class IngredientSelector extends StatelessWidget {
  final String name;
  final IconData icon;
  final int amount; // 0 = none, 1 = normal, 2 = extra
  final ValueChanged<int> onChanged;
  final bool isCustomizable;

  const IngredientSelector({
    super.key,
    required this.name,
    required this.icon,
    required this.amount,
    required this.onChanged,
    this.isCustomizable = true,
  });

  @override
  Widget build(BuildContext context) {
    // Opciones
    final List<String> amountLabels = ["No", "Normal", "Extra"];
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey[100],
          child: Icon(
            icon, 
            color: isCustomizable ? Colors.orange[700] : Colors.grey[500], 
            size: 26
          ),
        ),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (i) {
            return GestureDetector(
              onTap: isCustomizable ? () => onChanged(i) : null,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: i == amount 
                    ? (isCustomizable ? Colors.orange[700] : Colors.grey[500]) 
                    : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  amountLabels[i],
                  style: TextStyle(
                    color: isCustomizable 
                      ? (i == amount ? Colors.white : Colors.black54)
                      : Colors.grey[400],
                    fontSize: 11,
                    fontWeight: i == amount
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
