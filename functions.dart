void main() {
  // Example item prices
  List<double> itemPrices = [5.99, 20.49, 15.00, 8.75, 12.30];
  
  // Calculate total price with optional tax
  double totalPrice = calculateTotal(itemPrices, taxRate: 0.07); // 7% tax
  
  // Apply a discount of 10% to all items
  double discountPercentage = 10.0;
  List<double> discountedPrices = applyDiscount(itemPrices, (price) {
    return price * (1 - discountPercentage / 100);
  });

  // Calculate total price after discount
  double discountedTotalPrice = calculateTotal(discountedPrices, taxRate: 0.07); // 7% tax
  
  // Calculate factorial discount based on number of items
  double factorialDiscountPercentage = calculateFactorialDiscount(itemPrices.length);
  
  // Apply factorial discount
  double finalPrice = discountedTotalPrice * (1 - factorialDiscountPercentage / 100);
  
  // Print results
  print('Original Total Price: \$${calculateTotal(itemPrices).toStringAsFixed(2)}');
  print('Total Price after Discount and Tax: \$${discountedTotalPrice.toStringAsFixed(2)}');
  print('Factorial Discount Percentage: ${factorialDiscountPercentage.toStringAsFixed(2)}%');
  print('Final Price after Factorial Discount: \$${finalPrice.toStringAsFixed(2)}');
}

// Function to calculate total price with optional tax
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double total = prices.fold(0.0, (sum, price) => sum + price);
  return total * (1 + taxRate);
}

// Function to apply a discount to a list of prices
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map((price) => discountFunction(price)).toList();
}

// function to calculate factorial discount percentage
double calculateFactorialDiscount(int n) {
  if (n <= 1) return 1.0;
  return n * calculateFactorialDiscount(n - 1);
}


