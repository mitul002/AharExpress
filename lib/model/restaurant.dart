import 'package:collection/collection.dart';
import 'package:first_app/model/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Jhinku Burger",
      description:
          "A Juicy beef patty with melted cheddar, lettuce, tomato, and  a hint of onion and pickle.",
      imagePath: "lib/images/burgers/cheese_burger.jpeg",
      price: 150.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 15.99),
        Addon(name: "Bacon", price: 14.99),
        Addon(name: "Avocado", price: 12.99),
      ],
    ),
    Food(
      name: "Osthir Burger",
      description:
          "Plump and juicy beef patties, grilled pineapples and a special creamy burger sauce, these Aloha Burgers are extra special and delicious!",
      imagePath: "lib/images/burgers/aloha_burger.jpg",
      price: 221.52,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 16.99),
        Addon(name: "Oninon", price: 13.99),
        Addon(name: "Avocado", price: 12.99),
      ],
    ),
    Food(
      name: "Jhakanaka Burger",
      description:
          "These BBQ Burgers are an amazingly juicy explosion of sweet, tangy, spicy, smokey, crispy deliciousness all at the same time.",
      imagePath: "lib/images/burgers/bbq_burger.jpg",
      price: 209.52,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 14.99),
        Addon(name: "Oninon", price: 13.99),
        Addon(name: "Avocado", price: 12.99),
      ],
    ),
    Food(
      name: "Faltu Burger",
      description:
          "Blue Moon Burgers uses premium PNW sourced beef to deliver the best tasting burger around.",
      imagePath: "lib/images/burgers/bluemoon_burger.jpeg",
      price: 253.52,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 14.99),
        Addon(name: "Oninon", price: 13.99),
        Addon(name: "Avocado", price: 12.99),
      ],
    ),
    Food(
      name: "Shei Burger",
      description:
          "A veggie burger or meatless burger is a hamburger made with a patty that does not contain meat, or the patty of such a hamburger. ",
      imagePath: "lib/images/burgers/vege_burger.jpg",
      price: 120.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 14.99),
        Addon(name: "Oninon", price: 13.99),
        Addon(name: "Avocado", price: 12.99),
      ],
    ),

    //salad
    Food(
      name: "Valo Salad",
      description:
          "This quinoa salad recipe is the best! Everyone loves this healthy quinoa salad made with quinoa, chickpeas, red bell pepper, cucumber, parsley and lemon.",
      imagePath: "lib/images/salads/quinoa_salad.jpeg",
      price: 99.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Yougart", price: 15.99),
        Addon(name: "Avocado", price: 13.99),
      ],
    ),
    Food(
      name: "Aro valo Salad",
      description:
          "This Asian Sesame Chicken Salad is a great way to secretly pack your family’s diet with a ton of vegetables. Hearty cabbage and greens are topped off with cooked chicken and crunchy almonds, then tossed in an Asian sesame ginger dressing.",
      imagePath: "lib/images/salads/asiansesame_salad.jpeg",
      price: 120.50,
      category: FoodCategory.Salads,
      availableAddons: [],
    ),
    Food(
      name: "Onk Valo Salad",
      description:
          "This classic Caesar salad recipe features crisp romaine, crunchy croutons, and Parmesan cheese. A creamy, tangy homemade dressing ties it together.",
      imagePath: "lib/images/salads/ceasar_salad.jpeg",
      price: 130.20,
      category: FoodCategory.Salads,
      availableAddons: [],
    ),
    Food(
      name: "Shei Salad",
      description:
          "This easy Greek salad recipe is our new favorite summer side dish! Just 7 ingredients + a simple Greek salad dressing make it refreshing & delicious.",
      imagePath: "lib/images/salads/greek_salad.jpeg",
      price: 140.20,
      category: FoodCategory.Salads,
      availableAddons: [],
    ),
    Food(
      name: "Matha Nosto Salad",
      description:
          "This Southwest Salad recipe has quickly become one of my most popular and most pinned recipes of all time.  It’s fresh, filling, flavorful, gluten-free and will have you actually CRAVING salad!",
      imagePath: "lib/images/salads/southwest_salad.jpg",
      price: 149.20,
      category: FoodCategory.Salads,
      availableAddons: [],
    ),

    // sides
    Food(
      name: "Garlic Bread",
      description:
      "This is the BEST  garlic bread you'll ever make. It has fresh herbs, tons of flavorful roasted garlic, and is perfectly toasted.",
      imagePath: "lib/images/sides/garlic_bread_side.jpeg",
      price: 130.20,
      category: FoodCategory.Sides,
      availableAddons: [],
    ),
    Food(
      name: "Loaded Fries",
      description:
      "A big pile of crispy french fries smothered in melty cheese and bacon and topped with green onion and your fave toppings!",
      imagePath: "lib/images/sides/loadedfries_side.jpg",
      price: 130.20,
      category: FoodCategory.Sides,
      availableAddons: [],
    ),
    Food(
      name: "Mac ann Cheese",
      description:
      "It uses a combination of cheeses, layered in the dish as well as melted into a rich and creamy cheese sauce, for the ultimate in cheesy deliciousness!  Perfect for a comforting dinner or as a holiday side dish!",
      imagePath: "lib/images/sides/mac_side.jpeg",
      price: 120.20,
      category: FoodCategory.Sides,
      availableAddons: [],
    ),
    Food(
      name: "Crispy Onion Rings",
      description:
      "Sweet and tender on the inside, crispy and crunchy on the outside — just like the pros make!",
      imagePath: "lib/images/sides/onion_rings_side.jpg",
      price: 100.20,
      category: FoodCategory.Sides,
      availableAddons: [],
    ),
    Food(
      name: "Sweeet Potatoes",
      description:
      "With streusel and a little hot honey kick, these are the perfect autumn side dish!",
      imagePath: "lib/images/sides/sweet_potatoes_side.jpeg",
      price: 50.20,
      category: FoodCategory.Sides,
      availableAddons: [],
    ),

    //deserts
    Food(
      name: "Chocolate Cake",
      description:
      "This is the best chocolate cake recipe ever! It’s moist, rich, and decadent with a velvety smooth chocolate frosting.",
      imagePath: "lib/images/desserts/easy-chocolate-molten-cakes-37a25eb.jpg",
      price: 130,
      category: FoodCategory.Deserts,
      availableAddons: [],
    ),
    Food(
      name: "Cheesecake",
      description:
      "This is the best cheesecake recipe ever! It’s creamy, rich, and decadent with a buttery graham cracker crust.",
      imagePath: "lib/images/desserts/easy-chocolate-molten-cakes-37a25eb.jpg",
      price: 120.20,
      category: FoodCategory.Deserts,
      availableAddons: [],
    ),
    Food(
      name: "Ice Cream",
      description:
      "This is the best vanilla ice cream recipe ever! It’s creamy, rich, and decadent with a buttery graham cracker crust.",
      imagePath: "lib/images/desserts/easy-chocolate-molten-cakes-37a25eb.jpg",
      price: 150.20,
      category: FoodCategory.Deserts,
      availableAddons: [],
    ),
    Food(
      name: "Brownies",
      description:
      "These brownies are fudgy, chewy, and rich with a crackly top. They are the perfect dessert for chocolate lovers!",
      imagePath: "lib/images/desserts/easy-chocolate-molten-cakes-37a25eb.jpg",
      price: 120.20,
      category: FoodCategory.Deserts,
      availableAddons: [],
    ),
    Food(
      name: "Pudding",
      description:
      "This is the best vanilla pudding recipe ever! It’s creamy, rich, and decadent with a buttery graham cracker crust.",
      imagePath: "lib/images/desserts/easy-chocolate-molten-cakes-37a25eb.jpg",
      
      price: 150.20,
      category: FoodCategory.Deserts,
      availableAddons: [],
    ),

    //drinks
    Food(
      name: "Coke",
      description:
      "Coca-Cola is a carbonated soft drink manufactured by The Coca-Cola Company.",
      imagePath: "lib/images/drinks/Tamayo_brunch_cheers_2.jpg",
      price: 50.20,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
    Food(
      name: "Pepsi",
      description:
      "Pepsi is a carbonated soft drink manufactured by PepsiCo.",
      imagePath: "lib/images/drinks/Tamayo_brunch_cheers_2.jpg",
      price: 50.20,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
    Food(
      name: "Sprite",
      description:
      "Sprite is a colorless, lemon-lime flavored soft drink created by The Coca-Cola Company.",
      imagePath: "lib/images/drinks/Tamayo_brunch_cheers_2.jpg",
      price: 50.20,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
    Food(
      name: "Fanta",
      description:
      "Fanta is a fruit-flavored carbonated soft drink created by The Coca-Cola Company.",
      imagePath: "lib/images/drinks/Tamayo_brunch_cheers_2.jpg",
      price: 50.20,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
    Food(
      name: "7up",
      description:
      "7 Up is a colorless, lemon-lime flavored soft drink created by The Coca-Cola Company.",
      imagePath: "lib/images/drinks/Tamayo_brunch_cheers_2.jpg",
      price: 50.20,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
    Food(
      name: "Mountain Dew",
      description:
      "Mountain Dew is a carbonated soft drink brand produced and owned by PepsiCo.",
      imagePath: "lib/images/drinks/images (1).jpeg",
      price: 50.20,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
    Food(
      name: "Red Bull",
      description:
      "Red Bull is an energy drink sold by Austrian company Red Bull GmbH.",
      imagePath: "lib/images/drinks/Tamayo_brunch_cheers_2.jpg",
      price: 50.20,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address (user based)
  String _deliveryAddress = "khaner mor, monipur";


  /*
  G E T T E R S
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
  O P R E R A T I O N S
  */

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // cart item same naki
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //food item same naki
      bool isSameFood = item.food == food;

      // addon same naki
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // item already thakle increase
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // na thakle add hobe
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // total price of the cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //cart e total item
  int getTotalItamCount() {
    int totalItamCount = 0;

    for (CartItem cartItem in _cart) {
      totalItamCount += cartItem.quantity;
    }

    return totalItamCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*
  H E L P E R S
  */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    // Date format Second porjonto update dibe
    String formattedDate =
      DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(
              cartItem.food.price)}"
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("--------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItamCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering To: $deliveryAddress");


    return receipt.toString();
  }

  // money te convert
  String _formatPrice(double price) {
    return "Tk.${price.toStringAsFixed(2)}";
  }

  //addon string e convert
  String _formatAddons(List<Addon> addons) {
      return addons
          .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
          .join(", ");
  }
}
