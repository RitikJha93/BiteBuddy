import 'package:bitebuddy/features/authentication/screens/login/login.dart';
import 'package:bitebuddy/features/authentication/screens/signup/signup.dart';
import 'package:bitebuddy/features/shop/screens/cart/cart_screen.dart';
import 'package:bitebuddy/features/shop/screens/favourite/favourite_screen.dart';
import 'package:bitebuddy/features/shop/screens/navigation_menu.dart';
import 'package:bitebuddy/features/shop/screens/order-summary/order-summary.dart';
import 'package:bitebuddy/features/shop/screens/orders/order_screen.dart';
import 'package:bitebuddy/features/shop/screens/profile/profile_screen.dart';
import 'package:bitebuddy/features/shop/screens/restaurant-detail/restaurant-detail.dart';
import 'package:bitebuddy/features/shop/screens/search/search_screen.dart';
import 'package:bitebuddy/features/shop/screens/shipping-details/shipping-details.dart';
import 'package:bitebuddy/utils/routes/routes.dart';
import 'package:get/get.dart';

class AppRouter {
  static final pages = [
    GetPage(name: Routes.home, page: () => const BottomNavigationMenu()),
    GetPage(name: Routes.login, page: () => const LoginScreen()),
    GetPage(name: Routes.register, page: () => const Signup()),
    GetPage(
        name: Routes.restaurantDetail, page: () => const RestaurantDetail()),
    GetPage(name: Routes.cart, page: () => const CartScreen()),
    GetPage(name: Routes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: Routes.profile, page: () => const ProfileScreen()),
    GetPage(name: Routes.orders, page: () => const OrderScreen()),
    GetPage(name: Routes.search, page: () => const SearchScreen()),
    GetPage(name: Routes.shippingDetails, page: () => const ShippingDetails()),
    GetPage(name: Routes.orderSummary, page: () => const OrderSummary()),
  ];
}
