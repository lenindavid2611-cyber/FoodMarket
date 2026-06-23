# 🛍️ Taller — App E-commerce en Flutter

**Programación para Dispositivos Móviles**  
Universidad Pontificia Bolivariana · Prof. Luis Castilla

---

## 🎯 Objetivo

Construir una **app de comercio electrónico completa** aplicando todos los conceptos del módulo: widgets de UI, navegación con Go_Router, estado, listas, animaciones, diálogos, formularios y diseño visual profesional.

Al terminar tendrás una app funcional con:

- Pantalla de Login con validación
- Home con lista de productos y búsqueda
- Detalle de producto
- Carrito de compras con estado
- Navegación completa con Go_Router

---

## 🏪 Elige tu tienda

Cada estudiante escoge **una tienda diferente**. Primero en escoger, primero en reservar. Comunica tu elección al profesor antes de empezar.

| #   | Tienda            | Categoría de productos               | Color sugerido        |
| --- | ----------------- | ------------------------------------ | --------------------- |
| 01  | 🌿 **GreenShop**  | Plantas de interior y exterior       | Verde `#2E7D32`       |
| 02  | 🚗 **AutoMarket** | Vehículos y repuestos                | Azul `#1565C0`        |
| 03  | 📱 **TechStore**  | Electrónicos y gadgets               | Negro `#212121`       |
| 04  | 👟 **SneakerHub** | Tenis y calzado deportivo            | Naranja `#E65100`     |
| 05  | 📚 **LibroClick** | Libros físicos y digitales           | Café `#5D4037`        |
| 06  | 🎮 **GameZone**   | Videojuegos y consolas               | Morado `#4A148C`      |
| 07  | 🍕 **FoodMarket** | Ingredientes y alimentos gourmet     | Rojo `#C62828`        |
| 08  | 💄 **GlowUp**     | Cosméticos y skincare                | Rosa `#AD1457`        |
| 09  | 🏋️ **FitGear**    | Equipos y ropa deportiva             | Gris `#37474F`        |
| 10  | 🐾 **PetShop**    | Accesorios y alimentos para mascotas | Amarillo `#F57F17`    |
| 11  | 🪑 **CasaIdeal**  | Muebles y decoración del hogar       | Beige `#795548`       |
| 12  | ☕ **CaféBeans**  | Café de especialidad y accesorios    | Café oscuro `#3E2723` |
| 13  | 🎨 **ArtSpace**   | Materiales de arte y manualidades    | Turquesa `#00695C`    |
| 14  | 🧸 **KidZone**    | Juguetes y juegos educativos         | Celeste `#0277BD`     |
| 15  | 💍 **LuxJewels**  | Joyería y accesorios de moda         | Dorado `#F9A825`      |
| 16  | 🌊 **SurfShop**   | Deportes acuáticos y playa           | Azul marino `#01579B` |
| 17  | 🎵 **SoundWave**  | Instrumentos y equipos de audio      | Índigo `#283593`      |
| 18  | 🌿 **OrganicBox** | Productos naturales y orgánicos      | Verde oliva `#558B2F` |

> **Regla:** dos estudiantes no pueden tener la misma tienda. El nombre, colores y productos son los que diferencian tu app de las demás — el código base es el mismo para todos.

---

## 📁 Estructura del proyecto

```
mi_tienda/
├── pubspec.yaml
└── lib/
    ├── main.dart
    ├── config/
    │   ├── router.dart          ← Go_Router con todas las rutas
    │   └── theme.dart           ← ThemeData personalizado de tu tienda
    ├── models/
    │   ├── product.dart         ← clase Product
    │   └── cart_item.dart       ← clase CartItem
    ├── data/
    │   └── products_data.dart   ← lista hardcodeada de 12 productos
    ├── providers/
    │   └── cart_provider.dart   ← estado del carrito (ChangeNotifier)
    └── screens/
        ├── login_screen.dart
        ├── home_screen.dart
        ├── product_detail_screen.dart
        └── cart_screen.dart
```

---

## ⚙️ Setup inicial

### `pubspec.yaml` — dependencias necesarias

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^13.0.0
  provider: ^6.1.0
```

---

## 🗓️ CLASE 1 — UI Completa (3 horas)

### Objetivo de la clase

Al terminar la Clase 1 debes tener corriendo:

- ✅ Login con validación de formulario
- ✅ Home con grid de productos y barra de búsqueda
- ✅ Pantalla de detalle de producto
- ✅ Navegación entre las tres pantallas con Go_Router

---

### FASE 1 · Tema + Modelos (20 min)

#### 1.1 — ThemeData personalizado (`lib/config/theme.dart`)

Define los colores de tu tienda. Usa el color sugerido de la tabla como `primaryColor`.

```dart
import 'package:flutter/material.dart';

class AppTheme {
  // TODO: cambia estos colores por los de tu tienda
  static const Color primaryColor   = Color(0xFF2E7D32);  // tu color
  static const Color secondaryColor = Color(0xFF81C784);  // versión clara
  static const Color bgColor        = Color(0xFFF9FBF9);
  static const Color cardColor      = Colors.white;
  static const Color textPrimary    = Color(0xFF1A1A1A);
  static const Color textSecondary  = Color(0xFF757575);

  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    scaffoldBackgroundColor: bgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardTheme(
      color: cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}
```

#### 1.2 — Modelo de Producto (`lib/models/product.dart`)

```dart
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;     // URL de imagen pública (unsplash, etc.)
  final String category;
  final double rating;
  final int reviewCount;
  final bool isFeatured;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.rating = 4.5,
    this.reviewCount = 0,
    this.isFeatured = false,
  });
}
```

#### 1.3 — Datos hardcodeados (`lib/data/products_data.dart`)

Crea **12 productos** de tu tienda. Usa imágenes de `https://picsum.photos/seed/[nombre]/400/400` como placeholder, o imágenes reales de Unsplash.

```dart
import '../models/product.dart';

// TODO: reemplaza con los productos de TU tienda
const List<Product> kProducts = [
  Product(
    id: '1',
    name: 'Nombre del producto 1',
    description: 'Descripción detallada del producto...',
    price: 49900,
    imageUrl: 'https://picsum.photos/seed/product1/400/400',
    category: 'Categoría A',
    rating: 4.8,
    reviewCount: 124,
    isFeatured: true,
  ),
  // ... 11 productos más
];

// Categorías únicas de tus productos
List<String> get kCategories =>
    ['Todos', ...{...kProducts.map((p) => p.category)}];
```

**💡 Pista para URLs de imágenes reales de tu tema:**

```
Plantas:     https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400
Electrónica: https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400
Zapatos:     https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400
```

---

### FASE 2 · Pantalla de Login (40 min)

**Widgets que practicas:** `Form`, `TextFormField`, `ElevatedButton`, `Padding`, `Column`, `Image`, `Validator`

#### Lo que debe tener:

```
+----------------------------------+
|                                  |
|     [Logo / Ícono de la tienda]  |
|     Nombre de tu tienda          |
|     "Inicia sesión para comprar" |
|                                  |
|  [ 📧 Correo electrónico      ]  |
|                                  |
|  [ 🔒 Contraseña              ]  |
|                                  |
|  [      Iniciar sesión         ] |
|                                  |
|  ¿No tienes cuenta? Regístrate   |
|                                  |
+----------------------------------+
```

#### Validaciones mínimas:

| Campo      | Validación                          |
| ---------- | ----------------------------------- |
| Correo     | No vacío + contiene `@`             |
| Contraseña | No vacío + mínimo 6 caracteres      |
| Al enviar  | Si pasa validación → navegar a Home |

```dart
// Credenciales hardcodeadas para la demo
const String kDemoEmail    = 'usuario@demo.com';
const String kDemoPassword = '123456';
```

#### Estructura del formulario:

```dart
final _formKey = GlobalKey<FormState>();
final _emailController    = TextEditingController();
final _passwordController = TextEditingController();
bool _obscurePassword = true;

// Al presionar el botón:
void _onLogin() {
  if (_formKey.currentState!.validate()) {
    // TODO: verificar credenciales hardcodeadas
    // Si coinciden → context.go('/home')
    // Si no → mostrar SnackBar con error
  }
}
```

**💡 Pistas:**

<details>
<summary>Pista — TextFormField con validación</summary>

```dart
TextFormField(
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
  decoration: const InputDecoration(
    labelText: 'Correo electrónico',
    prefixIcon: Icon(Icons.email_outlined),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) return 'Ingresa tu correo';
    if (!value.contains('@')) return 'Correo no válido';
    return null;  // null = sin error
  },
),
```

</details>

<details>
<summary>Pista — Botón de login con loading</summary>

```dart
bool _isLoading = false;

ElevatedButton(
  onPressed: _isLoading ? null : _onLogin,
  child: _isLoading
    ? const SizedBox(
        height: 20, width: 20,
        child: CircularProgressIndicator(
          color: Colors.white, strokeWidth: 2))
    : const Text('Iniciar sesión'),
),
```

</details>

---

### FASE 3 · Pantalla de Home (60 min)

**Widgets que practicas:** `AppBar`, `GridView.builder`, `Card`, `Image.network`, `TextField`, `SingleChildScrollView`, `Chip`, `PageView`

#### Lo que debe tener:

```
+----------------------------------+
| [≡]   Tu Tienda          [🛒 2] |  ← AppBar con badge del carrito
+----------------------------------+
| [🔍 Buscar productos...        ] |  ← TextField de búsqueda
+----------------------------------+
| [Banner/PageView de destacados]  |  ← PageView con 3 banners
+----------------------------------+
| [Todos] [Cat A] [Cat B] [Cat C]  |  ← filtro de categorías (chips)
+----------------------------------+
| ┌──────────┐  ┌──────────┐      |
| │  [img]   │  │  [img]   │      |  ← GridView de productos
| │  Nombre  │  │  Nombre  │      |
| │  $49.900 │  │  $89.900 │      |
| │  ⭐ 4.8  │  │  ⭐ 4.5  │      |
| └──────────┘  └──────────┘      |
+----------------------------------+
```

#### Lógica de búsqueda y filtro:

```dart
String _searchQuery = '';
String _selectedCategory = 'Todos';

List<Product> get _filteredProducts {
  return kProducts.where((p) {
    final matchesSearch = p.name
        .toLowerCase()
        .contains(_searchQuery.toLowerCase());
    final matchesCategory = _selectedCategory == 'Todos' ||
        p.category == _selectedCategory;
    return matchesSearch && matchesCategory;
  }).toList();
}
```

#### ProductCard — widget personalizado:

```dart
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: imagen con ClipRRect + borderRadius
            // TODO: nombre del producto
            // TODO: precio formateado
            // TODO: rating con Icon(Icons.star, color: Colors.amber)
          ],
        ),
      ),
    );
  }
}
```

**💡 Pistas:**

<details>
<summary>Pista — GridView.builder</summary>

```dart
GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.75,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
  ),
  itemCount: _filteredProducts.length,
  itemBuilder: (context, index) {
    final product = _filteredProducts[index];
    return ProductCard(
      product: product,
      onTap: () => context.go('/product/${product.id}'),
    );
  },
),
```

</details>

<details>
<summary>Pista — Chips de categorías</summary>

```dart
SizedBox(
  height: 40,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: kCategories.length,
    separatorBuilder: (_, __) => const SizedBox(width: 8),
    itemBuilder: (context, index) {
      final cat = kCategories[index];
      final isSelected = cat == _selectedCategory;
      return FilterChip(
        label: Text(cat),
        selected: isSelected,
        onSelected: (_) => setState(() => _selectedCategory = cat),
      );
    },
  ),
),
```

</details>

<details>
<summary>Pista — Badge del carrito en AppBar</summary>

```dart
actions: [
  Stack(
    children: [
      IconButton(
        icon: const Icon(Icons.shopping_cart_outlined),
        onPressed: () => context.go('/cart'),
      ),
      if (cartCount > 0)
        Positioned(
          right: 6, top: 6,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text('$cartCount',
              style: const TextStyle(
                color: Colors.white, fontSize: 10)),
          ),
        ),
    ],
  ),
],
```

</details>

---

### FASE 4 · Pantalla de Detalle (40 min)

**Widgets que practicas:** `SingleChildScrollView`, `Stack`, `Positioned`, `Hero`, `Chip`, `ElevatedButton`, `Divider`

#### Lo que debe tener:

```
+----------------------------------+
| [←]                     [♡]     |  ← AppBar transparente
+----------------------------------+
|                                  |
|      [Imagen grande del         |
|       producto - hero anim.]    |
|                                  |
| Nombre del Producto              |
| ⭐ 4.8  (124 reseñas)           |
|                                  |
| $49.900                          |
|                                  |
| [Cat A]                          |  ← Chip de categoría
|                                  |
| Descripción                      |
| Lorem ipsum detallado del        |
| producto...                      |
|                                  |
| ──────────────────────────────   |
|                                  |
| Cantidad:  [ - ]  1  [ + ]       |
|                                  |
| [    🛒 Agregar al carrito    ]  |
+----------------------------------+
```

#### Selector de cantidad:

```dart
int _quantity = 1;

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    IconButton(
      onPressed: _quantity > 1
          ? () => setState(() => _quantity--)
          : null,
      icon: const Icon(Icons.remove_circle_outline),
    ),
    Text('$_quantity',
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    IconButton(
      onPressed: () => setState(() => _quantity++),
      icon: const Icon(Icons.add_circle_outline),
    ),
  ],
),
```

---

### FASE 5 · Navegación con Go_Router (20 min)

**Widgets que practicas:** `Go_Router`, rutas con parámetros, redirección

#### `lib/config/router.dart`:

```dart
import 'package:go_router/go_router.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/cart_screen.dart';

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
      path: '/product/:id',          // parámetro dinámico
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ProductDetailScreen(productId: id);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
  ],
);
```

#### `lib/main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/router.dart';
import 'config/theme.dart';
import 'providers/cart_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp.router(
        title: 'Mi Tienda',           // TODO: nombre de tu tienda
        theme: AppTheme.theme,
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
```

### ✅ Checkpoint Clase 1

Antes de terminar la primera sesión verifica que:

- [ ] El login valida los campos y muestra errores
- [ ] Con credenciales correctas navega al Home
- [ ] El Home muestra la grilla de productos
- [ ] La búsqueda filtra en tiempo real
- [ ] Los chips de categoría filtran los productos
- [ ] Al tocar un producto navega al Detalle
- [ ] El Detalle muestra toda la info del producto
- [ ] El botón ← del detalle regresa al Home
- [ ] **Commit:** `git commit -m "feat: clase 1 — login, home y detalle"`

---

## 🗓️ CLASE 2 — Estado, Carrito y Navegación Avanzada (3 horas)

### Objetivo de la clase

Al terminar la Clase 2 debes tener:

- ✅ Estado global del carrito con Provider
- ✅ Pantalla de carrito funcional
- ✅ Snackbars y diálogos de confirmación
- ✅ RefreshIndicator en el Home
- ✅ Animaciones y transiciones
- ✅ Switches y opciones de usuario
- ✅ App completamente integrada

---

### FASE 6 · Estado del Carrito con Provider (45 min)

**Conceptos que practicas:** `ChangeNotifier`, `Provider`, `Consumer`, `context.watch`, `context.read`

#### `lib/models/cart_item.dart`:

```dart
import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get subtotal => product.price * quantity;
}
```

#### `lib/providers/cart_provider.dart`:

```dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  // Getters
  Map<String, CartItem> get items => {..._items};
  int    get itemCount   => _items.values.fold(0, (sum, i) => sum + i.quantity);
  double get totalPrice  => _items.values.fold(0, (sum, i) => sum + i.subtotal);

  // Agregar producto
  void addProduct(Product product, {int quantity = 1}) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  // Quitar una unidad
  void removeOne(String productId) {
    if (!_items.containsKey(productId)) return;
    if (_items[productId]!.quantity > 1) {
      _items[productId]!.quantity--;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  // Eliminar producto completo
  void removeProduct(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  // Vaciar carrito
  void clear() {
    _items.clear();
    notifyListeners();
  }

  // Verificar si un producto está en el carrito
  bool contains(String productId) => _items.containsKey(productId);
}
```

#### Cómo usar el Provider desde las pantallas:

```dart
// Leer el carrito (se re-dibuja cuando cambia):
final cart = context.watch<CartProvider>();

// Modificar el carrito (sin re-dibujar):
context.read<CartProvider>().addProduct(product, quantity: _quantity);

// En el AppBar — badge con cantidad:
final itemCount = context.watch<CartProvider>().itemCount;
```

---

### FASE 7 · Pantalla del Carrito (45 min)

**Widgets que practicas:** `ListView.builder`, `Dismissible`, `ListTile`, `Divider`, `AlertDialog`

#### Lo que debe tener:

```
+----------------------------------+
| [←]        Mi Carrito     [🗑️]  |
+----------------------------------+
|                                  |
|  ┌────────────────────────────┐  |
|  │[img] Producto 1            │  |
|  │      $49.900     [ - 2 + ] │  ←  Dismissible para eliminar
|  └────────────────────────────┘  |
|                                  |
|  ┌────────────────────────────┐  |
|  │[img] Producto 2            │  |
|  │      $89.900     [ - 1 + ] │  |
|  └────────────────────────────┘  |
|                                  |
|  ────────────────────────────    |
|  Subtotal                $49.900 |
|  Envío                   $5.000  |
|  ────────────────────────────    |
|  TOTAL                  $54.900  |
|                                  |
|  [       Finalizar compra      ] |
+----------------------------------+
```

#### Dismissible para eliminar con swipe:

```dart
Dismissible(
  key: Key(item.product.id),
  direction: DismissDirection.endToStart,
  background: Container(
    color: Colors.red,
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20),
    child: const Icon(Icons.delete, color: Colors.white),
  ),
  onDismissed: (_) {
    context.read<CartProvider>().removeProduct(item.product.id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.product.name} eliminado'),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () => context.read<CartProvider>()
              .addProduct(item.product),
        ),
      ),
    );
  },
  child: CartItemTile(item: item),
),
```

#### Diálogo de confirmación al finalizar:

```dart
void _onCheckout(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Confirmar pedido'),
      content: Text(
        '¿Confirmas tu pedido por '
        '\$${cart.totalPrice.toStringAsFixed(0)}?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<CartProvider>().clear();
            Navigator.pop(context);
            context.go('/home');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('¡Pedido confirmado! 🎉'),
                backgroundColor: Colors.green,
              ),
            );
          },
          child: const Text('Confirmar'),
        ),
      ],
    ),
  );
}
```

---

### FASE 8 · Mejoras de UX (30 min)

**Widgets que practicas:** `RefreshIndicator`, `AnimatedSwitcher`, `Hero`, `PageView`

#### 8.1 — RefreshIndicator en el Home

```dart
RefreshIndicator(
  onRefresh: () async {
    // Simular carga de datos
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      // Resetear filtros al refrescar
      _searchQuery = '';
      _selectedCategory = 'Todos';
    });
  },
  child: SingleChildScrollView(
    physics: const AlwaysScrollableScrollPhysics(),
    child: Column(/* ... */),
  ),
),
```

#### 8.2 — Animación Hero en la imagen del producto

En `ProductCard` (Home):

```dart
Hero(
  tag: 'product-${product.id}',
  child: ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
    child: Image.network(product.imageUrl, fit: BoxFit.cover),
  ),
),
```

En `ProductDetailScreen`:

```dart
Hero(
  tag: 'product-${widget.productId}',
  child: Image.network(product.imageUrl, fit: BoxFit.cover),
),
```

#### 8.3 — PageView de banners en el Home

```dart
class _BannerCarousel extends StatefulWidget { /* ... */ }

class _BannerCarouselState extends State<_BannerCarousel> {
  final PageController _controller = PageController();
  int _current = 0;

  final List<String> _banners = [
    'https://picsum.photos/seed/banner1/800/300',
    'https://picsum.photos/seed/banner2/800/300',
    'https://picsum.photos/seed/banner3/800/300',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _controller,
            itemCount: _banners.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (_, i) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(_banners[i], fit: BoxFit.cover),
            ),
          ),
        ),
        // Indicadores de página
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_banners.length, (i) =>
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              width: _current == i ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _current == i
                    ? AppTheme.primaryColor
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
```

---

### FASE 9 · Pantalla de Perfil con Switches (20 min)

**Widgets que practicas:** `SwitchListTile`, `CheckboxListTile`, `ListTile`, `Divider`, `CircleAvatar`

Agrega una ruta `/profile` y un ícono en el AppBar del Home:

```dart
class ProfileScreen extends StatefulWidget { /* ... */ }

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificaciones = true;
  bool _ofertas        = false;
  bool _modoOscuro     = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi perfil')),
      body: ListView(
        children: [
          // Avatar
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: CircleAvatar(
                radius: 48,
                child: Icon(Icons.person, size: 48),
              ),
            ),
          ),

          const ListTile(
            title: Text('usuario@demo.com'),
            leading: Icon(Icons.email_outlined),
          ),

          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
            child: Text('PREFERENCIAS',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),

          SwitchListTile(
            title: const Text('Notificaciones'),
            subtitle: const Text('Recibir alertas de pedidos'),
            value: _notificaciones,
            onChanged: (v) => setState(() => _notificaciones = v),
          ),
          SwitchListTile(
            title: const Text('Ofertas y promociones'),
            value: _ofertas,
            onChanged: (v) => setState(() => _ofertas = v),
          ),
          SwitchListTile(
            title: const Text('Modo oscuro'),
            value: _modoOscuro,
            onChanged: (v) => setState(() => _modoOscuro = v),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Cerrar sesión',
              style: TextStyle(color: Colors.red)),
            onTap: () {
              context.read<CartProvider>().clear();
              context.go('/login');
            },
          ),
        ],
      ),
    );
  }
}
```

---

### FASE 10 · Integración final y pulido (40 min)

Usa este tiempo para:

1. **Verificar toda la navegación** — todos los botones llevan a donde deben
2. **Consistencia visual** — todos los colores usan `AppTheme`, nada hardcodeado
3. **Empty states** — qué muestra la app cuando el carrito está vacío o la búsqueda no tiene resultados
4. **Manejo de errores de imagen** — agregar `errorBuilder` en todos los `Image.network`
5. **Formato de precio** — usar siempre el mismo formato (`$49.900` o `$49,900`)

#### Empty states:

```dart
// Carrito vacío
if (cart.items.isEmpty)
  const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
        SizedBox(height: 16),
        Text('Tu carrito está vacío',
          style: TextStyle(fontSize: 18, color: Colors.grey)),
        SizedBox(height: 8),
        Text('¡Agrega productos para empezar!',
          style: TextStyle(color: Colors.grey)),
      ],
    ),
  ),

// Búsqueda sin resultados
if (_filteredProducts.isEmpty)
  const Center(
    child: Column(
      children: [
        Icon(Icons.search_off, size: 60, color: Colors.grey),
        Text('Sin resultados para tu búsqueda'),
      ],
    ),
  ),
```

### ✅ Checkpoint Clase 2

- [ ] El carrito agrega, resta y elimina productos
- [ ] El badge del AppBar muestra el conteo correcto
- [ ] El swipe en el carrito elimina con opción de deshacer
- [ ] El diálogo de compra vacía el carrito y navega al Home
- [ ] El RefreshIndicator funciona en el Home
- [ ] La animación Hero se ve al entrar y salir del detalle
- [ ] Los banners del PageView hacen scroll automáticamente
- [ ] La pantalla de perfil tiene los Switches funcionales
- [ ] Cerrar sesión limpia el carrito y va al Login
- [ ] **Commit:** `git commit -m "feat: clase 2 — carrito, estado y UX"`

---

## ✅ Criterios de entrega

| Criterio                | Descripción                                                    | Peso |
| ----------------------- | -------------------------------------------------------------- | ---- |
| **Pantallas completas** | Login, Home, Detalle, Carrito, Perfil funcionando              | 25%  |
| **Navegación**          | Go_Router con todas las rutas, parámetros y redirección        | 20%  |
| **Estado del carrito**  | Provider funciona: agregar, quitar, total, limpiar             | 20%  |
| **Diseño visual**       | ThemeData propio, colores consistentes, widgets personalizados | 15%  |
| **Calidad del código**  | Estructura de carpetas, modelos separados, sin código muerto   | 10%  |
| **UX**                  | Snackbars, diálogos, empty states, errores de imagen           | 10%  |

---

## 🚀 Retos extra (para quien termina antes)

**Reto 1 — Búsqueda en tiempo real con debounce**
Usa un `Timer` para no filtrar en cada tecla sino 500ms después de que el usuario pare de escribir.

**Reto 2 — Persistencia del carrito**
Guarda el carrito en `SharedPreferences` para que sobreviva al cerrar la app.

**Reto 3 — Modo oscuro funcional**
Conecta el Switch de modo oscuro del perfil con el `ThemeData` de la app usando un segundo `ChangeNotifier`.

**Reto 4 — Animaciones de lista**
Usa `AnimatedList` para que los productos aparezcan con animación al cargar el Home.

---

## 📚 Recursos

| Recurso           | URL                                                                  |
| ----------------- | -------------------------------------------------------------------- |
| Provider          | https://pub.dev/packages/provider                                    |
| Go_Router         | https://pub.dev/packages/go_router                                   |
| Dismissible       | https://api.flutter.dev/flutter/widgets/Dismissible-class.html       |
| Hero animations   | https://docs.flutter.dev/ui/animations/hero-animations               |
| PageView          | https://api.flutter.dev/flutter/widgets/PageView-class.html          |
| RefreshIndicator  | https://api.flutter.dev/flutter/material/RefreshIndicator-class.html |
| Imágenes Unsplash | https://unsplash.com/developers                                      |

---

_Programación para Dispositivos Móviles · UPB Bucaramanga · 2026_
