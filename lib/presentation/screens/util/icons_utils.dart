import 'package:flutter/material.dart';

IconData getIconForName(String name) {
  final lower = name.toLowerCase();
  if (lower.contains('papa') || lower.contains('frita'))
    return Icons.restaurant;
  if (lower.contains('gaseosa') ||
      lower.contains('refresco') ||
      lower.contains('bebida'))
    return Icons.local_drink;
  if (lower.contains('ensalada')) return Icons.eco;
  if (lower.contains('carne')) return Icons.set_meal;
  if (lower.contains('pollo')) return Icons.fastfood;
  if (lower.contains('queso')) return Icons.egg_alt;
  if (lower.contains('huevo')) return Icons.egg;
  if (lower.contains('sundae') || lower.contains('helado'))
    return Icons.icecream;
  if (lower.contains('tomate')) return Icons.local_pizza;
  if (lower.contains('cebolla')) return Icons.ramen_dining;
  if (lower.contains('lechuga')) return Icons.grass;
  if (lower.contains('pepinillo')) return Icons.eco;
  if (lower.contains('tocino')) return Icons.lunch_dining;
  if (lower.contains('kétchup') || lower.contains('ketchup'))
    return Icons.water_drop;
  if (lower.contains('mayonesa')) return Icons.icecream;
  if (lower.contains('mostaza')) return Icons.local_fire_department;
  if (lower.contains('champiñón')) return Icons.restaurant;
  if (lower.contains('jalapeño')) return Icons.whatshot;
  if (lower.contains('aguacate')) return Icons.emoji_nature;
  if (lower.contains('sésamo')) return Icons.spa;
  // Agrega más reglas según tus necesidades
  return Icons.fastfood;
}
