import 'package:bartech_app/data/models/model_products.dart';

class ProductsData {
  static List<Products> getProductsByGroup(String groupItemName) {
    if (groupItemName == 'Hamburguesas') {
      return [
        Products(
          itemCode: 'P001',
          itemName: 'Big Mac',
          price: 5.99,
          image: 'assets/products/100.png',
          description: 'Una deliciosa hamburguesa con carne, lechuga y tomate.',
          groupItemCode: '1',
          discount: 1.00,
        ),
        Products(
          itemCode: 'P002',
          itemName: 'Cuarto de Libra con Queso',
          price: 7.99,
          image: 'assets/products/101.png',
          description: 'Hamburguesa con dos carnes, queso y salsa especial.',
          groupItemCode: '1',
        ),
        Products(
          itemCode: 'P003',
          itemName: 'Doble Cuarto de Libra con Queso',
          price: 7.99,
          image: 'assets/products/102.png',
          description: 'Hamburguesa con dos carnes, queso y salsa especial.',
          groupItemCode: '1',
          discount: 0.5,
        ),
        Products(
          itemCode: 'P004',
          itemName: 'Doble cuarto con Bacon',
          price: 8.99,
          image: 'assets/products/103.png',
          description: 'Hamburguesa con dos carnes, queso y salsa especial.',
          groupItemCode: '1',
        ),
        Products(
          itemCode: 'P005',
          itemName: 'Sándwich McBacon',
          price: 12.50,
          image: 'assets/products/104.png',
          description: 'Hamburguesa con dos carnes, queso y salsa especial.',
          groupItemCode: '1',
          discount: 1.5,
        ),
        Products(
          itemCode: 'P006',
          itemName: 'Sándwich Triple Hamburguesa',
          price: 14.50,
          image: 'assets/products/105.png',
          description: 'Hamburguesa con dos carnes, queso y salsa especial.',
          groupItemCode: '1',
        ),
        Products(
          itemCode: 'P007',
          itemName: 'Sándwich Grand Triple McBacon',
          price: 14.50,
          image: 'assets/products/106.png',
          description: 'Hamburguesa con dos carnes, queso y salsa especial.',
          groupItemCode: '1',
        ),
        Products(
          itemCode: 'P008',
          itemName: 'Sándwich Grand Doble McBacon',
          price: 8.50,
          image: 'assets/products/107.png',
          description: 'Hamburguesa con dos carnes, queso y salsa especial.',
          groupItemCode: '1',
          discount: 1.20,
        ),
      ];
    } else if (groupItemName == 'Cajita Feliz') {
      return [
        Products(
          itemCode: 'P003',
          itemName: 'Pieza de Pollo',
          price: 4.99,
          image: 'assets/products/110.png',
          description: 'Cajita feliz con una hamburguesa, papas y un juguete.',
          groupItemCode: '2',
        ),
        Products(
          itemCode: 'P004',
          itemName: 'Hamburguesa',
          price: 5.49,
          image: 'assets/products/111.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
          discount: 0.8,
        ),
        Products(
          itemCode: 'P400',
          itemName: 'McFiesta Jr. (Cajita Feliz)',
          price: 5.49,
          image: 'assets/products/112.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
        ),
        Products(
          itemCode: 'P402',
          itemName: 'Papas Kids',
          price: 5.49,
          image: 'assets/products/41.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
        ),
        Products(
          itemCode: 'P403',
          itemName: 'Agua sin gas (625ml)',
          price: 5.49,
          image: 'assets/products/41.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
          discount: 0.50,
        ),
        Products(
          itemCode: 'P404',
          itemName: 'Yogurt x45g',
          price: 5.49,
          image: 'assets/products/61.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
        ),
      ];
    } else if (groupItemName == 'Postres') {
      return [
        Products(
          itemCode: 'P051',
          itemName: 'McFlurry Oreo®',
          price: 5.89,
          image: 'assets/products/51.png',
          description: 'Cajita feliz con una hamburguesa, papas y un juguete.',
          groupItemCode: '2',
        ),
        Products(
          itemCode: 'P059',
          itemName: 'McFlurry XXL Oreo',
          price: 5.89,
          image: 'assets/products/57.png',
          description: 'Cajita feliz con una hamburguesa, papas y un juguete.',
          groupItemCode: '2',
          discount: 0.5,
        ),
        Products(
          itemCode: 'P060',
          itemName: 'McFlurry XXL MM',
          price: 5.89,
          image: 'assets/products/58.png',
          description: 'Cajita feliz con una hamburguesa, papas y un juguete.',
          groupItemCode: '2',
        ),
        Products(
          itemCode: 'P052',
          itemName: 'Super Cono Combinado',
          price: 5.49,
          image: 'assets/products/52.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
        ),
        Products(
          itemCode: 'P054',
          itemName: 'Sundae Chocolate',
          price: 5.49,
          image: 'assets/products/54.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
          discount: 0.8,
        ),
        Products(
          itemCode: 'P055',
          itemName: 'Sundae Fresa',
          price: 5.49,
          image: 'assets/products/59.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
        ),
        Products(
          itemCode: 'P056',
          itemName: 'Cono Chocolate',
          price: 5.49,
          image: 'assets/products/55.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
          discount: 0.7,
        ),
        Products(
          itemCode: 'P057',
          itemName: 'Cono Vainilla',
          price: 5.49,
          image: 'assets/products/60.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
        ),
        Products(
          itemCode: 'P058',
          itemName: 'Yogurt x45g',
          price: 5.49,
          image: 'assets/products/61.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
          discount: 0.3,
        ),
      ];
    } else if (groupItemName == 'Bebidas') {
      return [
        Products(
          itemCode: 'P020',
          itemName: 'Coca-Cola',
          price: 3.49,
          image: 'assets/products/91.png',
          description: 'Bebida Coca-Cola de 600ml.',
          groupItemCode: '3',
        ),
        Products(
          itemCode: 'P021',
          itemName: 'Fanta',
          price: 3.49,
          image: 'assets/products/91.png',
          description: 'Bebida Fanta de 600ml.',
          groupItemCode: '3',
          discount: 0.25,
        ),
        Products(
          itemCode: 'P022',
          itemName: 'Sprite',
          price: 3.49,
          image: 'assets/products/91.png',
          description: 'Bebida Sprite de 600ml.',
          groupItemCode: '3',
        ),
      ];
    } else if (groupItemName == 'McNuggets®') {
      return [
        Products(
          itemCode: 'N001',
          itemName: 'McNuggets 4 unidades',
          price: 4.99,
          image: 'assets/products/80.png',
          description: 'Cajita feliz con una hamburguesa, papas y un juguete.',
          groupItemCode: '2',
          discount: 0.3,
        ),
        Products(
          itemCode: 'N002',
          itemName: 'McNuggets 6 unidades',
          price: 5.49,
          image: 'assets/products/81.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
        ),
      ];
    } else if (groupItemName == 'Pollo McCrispy') {
      return [
        Products(
          itemCode: 'N004',
          itemName: 'Pollo Crujiente 2 Piezas',
          price: 4.99,
          image: 'assets/products/70.png',
          description: 'Cajita feliz con una hamburguesa, papas y un juguete.',
          groupItemCode: '2',
        ),
        Products(
          itemCode: 'N005',
          itemName: 'Pollo Crujiente 3 Piezas',
          price: 5.49,
          image: 'assets/products/71.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
          discount: 0.7,
        ),
      ];
    } else if (groupItemName == 'Para acompañar') {
      return [
        Products(
          itemCode: 'N007',
          itemName: 'Papas Medianas',
          price: 4.99,
          image: 'assets/products/40.png',
          description: 'Cajita feliz con una hamburguesa, papas y un juguete.',
          groupItemCode: '2',
        ),
        Products(
          itemCode: 'N008',
          itemName: 'Papas Kids',
          price: 5.49,
          image: 'assets/products/41.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
          discount: 0.35,
        ),
      ];
    } else if (groupItemName == 'McCombo') {
      return [
        Products(
          itemCode: 'N007',
          itemName: 'Big Mac',
          price: 4.99,
          image: 'assets/products/100.png',
          description: 'Cajita feliz con una hamburguesa, papas y un juguete.',
          groupItemCode: '2',
          discount: 1.5,
        ),
        Products(
          itemCode: 'N008',
          itemName: 'Cuarto de Libra con Queso',
          price: 5.49,
          image: 'assets/products/101.png',
          description: 'Cajita feliz con una hamburguesa vegetariana y papas.',
          groupItemCode: '2',
        ),
      ];
    }

    return [];
  }
}
