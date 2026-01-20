import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Índice para controlar qué categoría está seleccionada
  int selectedCategoryIndex = 0;

  // Lista de categorías
  final List<Map<String, String>> categories = const [
    {'name': 'Todos', 'emoji': '🍱'},
    {'name': 'Burgers', 'emoji': '🍔'},
    {'name': 'Pizza', 'emoji': '🍕'},
    {'name': 'Sushi', 'emoji': '🍣'},
    {'name': 'Tacos', 'emoji': '🌮'},
  ];

  final List<Map<String, String>> products = const [
    {'name': 'Hamburguesa', 'price': '8.50', 'emoji': '🍔'},
    {'name': 'Pizza Pepperoni', 'price': '11.90', 'emoji': '🍕'},
    {'name': 'Sushi Roll', 'price': '14.20', 'emoji': '🍣'},
    {'name': 'Taco Supremo', 'price': '9.50', 'emoji': '🌮'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Quitamos el padding horizontal de aquí para que las listas lleguen al borde
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.x6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Texto de Bienvenida (con padding manual)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hola Fernando 👋', style: AppTextStyles.h1),
                    const SizedBox(height: AppSpacing.x1),
                    const Text('¿Qué quieres comer hoy?', style: AppTextStyles.bodyMedium),
                  ],
                ),
              ),
              
              const SizedBox(height: AppSpacing.x6),
              
              // Buscador (con padding manual)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x6),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: 'Buscar comida...',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('🔍', style: TextStyle(fontSize: 20)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.x4),

              // --- NUEVA SECCIÓN: LISTA DE CATEGORÍAS ---
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x6),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: AppSpacing.x2),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected ? [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            )
                          ] : [],
                        ),
                        child: Row(
                          children: [
                            Text(categories[index]['emoji']!, style: const TextStyle(fontSize: 18)),
                            const SizedBox(width: 8),
                            Text(
                              categories[index]['name']!,
                              style: TextStyle(
                                color: isSelected ? Colors.white : AppColors.textDark,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // ------------------------------------------

              const SizedBox(height: AppSpacing.x8),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x6),
                child: const Text('Populares 🔥', style: AppTextStyles.h2),
              ),
              const SizedBox(height: AppSpacing.x4),
              
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x6),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return _ProductCard(product: products[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/detail', arguments: product),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: AppSpacing.x4),
        padding: const EdgeInsets.all(AppSpacing.x4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.bgLight,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(product['emoji'] ?? '🍱', style: const TextStyle(fontSize: 50)),
              ),
            ),
            const SizedBox(height: AppSpacing.x4),
            Text(product['name'] ?? 'Producto', style: AppTextStyles.bodyMedium, maxLines: 1),
            const Spacer(),
            Text('\$${product['price']}', style: AppTextStyles.h2.copyWith(color: AppColors.primary)),
          ],
        ),
      ),
    );
  }
}