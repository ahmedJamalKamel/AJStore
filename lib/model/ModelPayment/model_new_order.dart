class NewOrderModel {
 late int product_id;
 late int quantity;
 NewOrderModel({required this.quantity,required this.product_id});

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['product_id'] = this.product_id;
  //   data['quantity'] = this.quantity;
  //   return data;
  // }
 Map toJson() => {
   'product_id': this.product_id,
   'quantity': this.quantity,
 };
}