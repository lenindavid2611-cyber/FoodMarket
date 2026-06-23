import 'package:go_router/go_router.dart';

import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/product_detail_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        return ProductDetailScreen(
          productId: state.pathParameters['id']!,
        );
      },
    ),
  ],
);