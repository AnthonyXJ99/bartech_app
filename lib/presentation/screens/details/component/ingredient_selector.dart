import 'package:flutter/material.dart';

class IngredientSelector extends StatelessWidget {
  final String name;
  final IconData icon;
  final int amount; // 0 = none, 1 = normal, 2 = extra
  final ValueChanged<int> onChanged;

  const IngredientSelector({
    super.key,
    required this.name,
    required this.icon,
    required this.amount,
    required this.onChanged,
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
          child: Icon(icon, color: Colors.orange[700], size: 26),
        ),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (i) {
            return GestureDetector(
              onTap: () => onChanged(i),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: i == amount ? Colors.orange[700] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  amountLabels[i],
                  style: TextStyle(
                    color: i == amount ? Colors.white : Colors.black54,
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
