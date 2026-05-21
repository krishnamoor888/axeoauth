import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _brandGreen = Color(0xFF2E9738);
  static const _headerGreen = Color(0xFF2D8C37);
  static const _purple = Color(0xFF7B4DFF);
  static const _orange = Color(0xFFF58220);

  int _navIndex = 0;

  static const _trendingProducts = <_TrendingProduct>[
    _TrendingProduct(
      imageAsset: 'assets/images/product1.png',
      name: 'Aavin Full Cream Milk',
      size: '500 ml',
      price: '30',
      originalPrice: '35',
      rating: '4.5/05',
    ),
    _TrendingProduct(
      imageAsset: 'assets/images/product2.png',
      name: 'Aashirvaad Multigrain Atta 10 kg',
      size: '10 kg',
      price: '701',
      originalPrice: '788',
      rating: '08/10',
    ),
    _TrendingProduct(
      imageAsset: 'assets/images/product1.png',
      name: 'Borges Oil 5 L',
      size: '5 L',
      price: '665',
      originalPrice: '699',
      rating: '4.2/05',
    ),
    _TrendingProduct(
      imageAsset: 'assets/images/product2.png',
      name: 'Tata Salt Vacuum Evaporated',
      size: '1 kg',
      price: '28',
      originalPrice: '32',
      rating: '4.8/05',
    ),
    _TrendingProduct(
      imageAsset: 'assets/images/product1.png',
      name: 'Britannia Whole Wheat Bread',
      size: '400 g',
      price: '45',
      originalPrice: '50',
      rating: '4.1/05',
    ),
  ];

  static const _shopImageAsset = 'assets/images/shop.png';

  static const _nearbyShops = <_NearbyShop>[
    _NearbyShop(
      name: 'Pandian Store',
      address: '61, Perambur Paper Mills Rd, near S2 Cinema Chennai 600011',
      rating: '4.5',
      delivery: '15-20mins | 1.5Km',
    ),
    _NearbyShop(
      name: 'ShopsyGo Mart',
      address: '12, Jaibim Nagar Main Rd, Perambur, Chennai 600011',
      rating: '4.3',
      delivery: '20-25mins | 2.1Km',
    ),
    _NearbyShop(
      name: 'Fresh Basket',
      address: '88, Paper Mills Colony, Perambur, Chennai 600082',
      rating: '4.6',
      delivery: '10-15mins | 0.9Km',
    ),
    _NearbyShop(
      name: 'Family Super Market',
      address: '5, Sembium High Rd, near Bus Stand, Chennai 600011',
      rating: '4.2',
      delivery: '18-22mins | 1.8Km',
    ),
    _NearbyShop(
      name: 'Daily Needs Store',
      address: '22, Vyasarpadi Market St, Chennai 600039',
      rating: '4.4',
      delivery: '12-18mins | 1.2Km',
    ),
  ];

  static const _categoryImages = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
    'assets/images/image6.png',
    'assets/images/image7.png',
    'assets/images/image8.png',
    'assets/images/image9.png',
    'assets/images/image10.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: _brandGreen,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _HomeBottomBar(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
        brandGreen: _brandGreen,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _HomeHeader(
              headerGreen: _headerGreen,
              purple: _purple,
              orange: _orange,
            ),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, -18),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _WelcomeBanner(brandGreen: _brandGreen),
                        _TopCategorySection(
                          images: _categoryImages,
                          purple: _purple,
                        ),
                        _TrendingsSection(
                          products: _trendingProducts,
                          brandGreen: _brandGreen,
                        ),
                        _NearbyShopSection(
                          shops: _nearbyShops,
                          imageAsset: _shopImageAsset,
                          orange: _orange,
                        ),
                        const SizedBox(height: 88),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    required this.headerGreen,
    required this.purple,
    required this.orange,
  });

  final Color headerGreen;
  final Color purple;
  final Color orange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: headerGreen,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: orange, size: 22),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                          Text(
                            'Perambur-Jaibim Nagar',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _HeaderActionCircle(
                color: purple,
                icon: Icons.account_balance_wallet_outlined,
                badge: true,
              ),
              const SizedBox(width: 10),
              _HeaderActionCircle(
                color: orange,
                icon: Icons.storefront_outlined,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Icon(Icons.search, color: purple, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  ),
                ),
                Icon(Icons.mic, color: Colors.grey.shade700, size: 22),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderActionCircle extends StatelessWidget {
  const _HeaderActionCircle({
    required this.color,
    required this.icon,
    this.badge = false,
  });

  final Color color;
  final IconData icon;
  final bool badge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 22),
        ),
        if (badge)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFFF58220),
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

class _WelcomeBanner extends StatelessWidget {
  const _WelcomeBanner({required this.brandGreen});

  final Color brandGreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFFFFF9C4), brandGreen.withValues(alpha: 0.15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    children: [
                      TextSpan(
                        text: 'Welcome to the our\n',
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                      TextSpan(
                        text: 'Basket Mart',
                        style: TextStyle(color: brandGreen),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Fresh groceries delivered fast',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 110,
            height: 90,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/basket.png',
                    width: 72,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 8,
                  child: Icon(
                    Icons.two_wheeler,
                    size: 40,
                    color: const Color(0xFF7B4DFF).withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopCategorySection extends StatelessWidget {
  const _TopCategorySection({required this.images, required this.purple});

  final List<String> images;
  final Color purple;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Top Category',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 6,
              childAspectRatio: 0.72,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              );
            },
          ),
          const SizedBox(height: 2),
          Center(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: purple,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
              ),
              child: const Text(
                'See all',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrendingProduct {
  const _TrendingProduct({
    required this.imageAsset,
    required this.name,
    required this.size,
    required this.price,
    required this.originalPrice,
    required this.rating,
  });

  final String imageAsset;
  final String name;
  final String size;
  final String price;
  final String originalPrice;
  final String rating;
}

class _TrendingsSection extends StatelessWidget {
  const _TrendingsSection({required this.products, required this.brandGreen});

  final List<_TrendingProduct> products;
  final Color brandGreen;

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width * 0.44;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
          child: Row(
            children: [
              const Text(
                'Trendings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '10+',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See more',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 268,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return _TrendingProductCard(
                product: products[index],
                width: cardWidth.clamp(150.0, 180.0),
                brandGreen: brandGreen,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TrendingProductCard extends StatefulWidget {
  const _TrendingProductCard({
    required this.product,
    required this.width,
    required this.brandGreen,
  });

  final _TrendingProduct product;
  final double width;
  final Color brandGreen;

  @override
  State<_TrendingProductCard> createState() => _TrendingProductCardState();
}

class _TrendingProductCardState extends State<_TrendingProductCard> {
  bool _wishlisted = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    return SizedBox(
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 104,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Image.asset(
                    p.imageAsset,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => setState(() => _wishlisted = !_wishlisted),
                    customBorder: const CircleBorder(),
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.22),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _wishlisted ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color:
                            _wishlisted
                                ? const Color(0xFF2E9738)
                                : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            p.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              height: 1.15,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            p.size,
            style: TextStyle(
              fontSize: 12,
              height: 1.2,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                '₹${p.price}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '₹${p.originalPrice}',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.grey.shade500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.brandGreen,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  p.rating,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NearbyShop {
  const _NearbyShop({
    required this.name,
    required this.address,
    required this.rating,
    required this.delivery,
  });

  final String name;
  final String address;
  final String rating;
  final String delivery;
}

class _NearbyShopSection extends StatelessWidget {
  const _NearbyShopSection({
    required this.shops,
    required this.imageAsset,
    required this.orange,
  });

  final List<_NearbyShop> shops;
  final String imageAsset;
  final Color orange;

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width * 0.72;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Row(
            children: [
              const Text(
                'Near by Shop',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 228,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            itemCount: shops.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return _NearbyShopCard(
                shop: shops[index],
                imageAsset: imageAsset,
                width: cardWidth.clamp(248.0, 290.0),
                orange: orange,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _NearbyShopCard extends StatelessWidget {
  const _NearbyShopCard({
    required this.shop,
    required this.imageAsset,
    required this.width,
    required this.orange,
  });

  final _NearbyShop shop;
  final String imageAsset;
  final double width;
  final Color orange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 128,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      imageAsset,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 16,
                              color: Colors.grey.shade900,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              shop.delivery,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 12,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _CarouselDot(active: true),
                          const SizedBox(width: 4),
                          _CarouselDot(active: false),
                          const SizedBox(width: 4),
                          _CarouselDot(active: false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            shop.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: orange, size: 18),
                            const SizedBox(width: 2),
                            Text(
                              shop.rating,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: orange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      shop.address,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.35,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CarouselDot extends StatelessWidget {
  const _CarouselDot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.white : Colors.white.withValues(alpha: 0.45),
      ),
    );
  }
}

class _HomeBottomBar extends StatelessWidget {
  const _HomeBottomBar({
    required this.currentIndex,
    required this.onTap,
    required this.brandGreen,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color brandGreen;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      elevation: 8,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.home,
              label: 'Home',
              selected: currentIndex == 0,
              activeColor: brandGreen,
              onTap: () => onTap(0),
            ),
            _NavItem(
              icon: Icons.grid_view,
              label: 'Category',
              selected: currentIndex == 1,
              activeColor: brandGreen,
              onTap: () => onTap(1),
            ),
            const SizedBox(width: 48),
            _NavItem(
              icon: Icons.shopping_bag_outlined,
              label: 'Notification',
              selected: currentIndex == 2,
              activeColor: brandGreen,
              onTap: () => onTap(2),
            ),
            _NavItem(
              icon: Icons.person_outline,
              label: 'Account',
              selected: currentIndex == 3,
              activeColor: brandGreen,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.activeColor,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final Color activeColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? activeColor : Colors.grey.shade500;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Clears the navigation stack and opens the home dashboard.
void navigateToHome(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (_) => const HomeScreen()),
    (route) => false,
  );
}
