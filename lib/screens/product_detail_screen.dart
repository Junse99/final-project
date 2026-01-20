import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                ),
                child: Center(
                  child: Text(product['emoji'], style: const TextStyle(fontSize: 120)),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Text('👈', style: TextStyle(fontSize: 20)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.x6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['name'], style: AppTextStyles.h1),
                  const SizedBox(height: AppSpacing.x2),
                  Text('\$${product['price']}', style: AppTextStyles.price),
                  const SizedBox(height: AppSpacing.x6),
                  const Text('Sobre este platillo', style: AppTextStyles.h2),
                  const SizedBox(height: AppSpacing.x2),
                  const Text(
                    'Una deliciosa preparación artesanal con los mejores ingredientes de la temporada. ¡Pídela ahora y recíbela en menos de 20 minutos! ⚡',
                    style: AppTextStyles.bodyRegular,
                  ),
                ],
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(AppSpacing.x6),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 0,
              ),
              child: const Text(
                'Añadir al carrito 🛒',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}