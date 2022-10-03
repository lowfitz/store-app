class ProductsModel {
  bool? status;
  List<Products>? products;

  ProductsModel({this.status, this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  get productsmodel => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? barcode;
  String? name;
  String? description;
  Null? categoryId;
  int? cost;
  int? price;
  int? salePrice;
  bool? onsale;
  bool? active;
  bool? hasAttribute;
  List<Variations>? variations;
  String? unit;
  int? stock;
  String? image;

  Products(
      {this.id,
      this.barcode,
      this.name,
      this.description,
      this.categoryId,
      this.cost,
      this.price,
      this.salePrice,
      this.onsale,
      this.active,
      this.hasAttribute,
      this.variations,
      this.unit,
      this.stock,
      this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barcode = json['barcode'];
    name = json['name'];
    description = json['description'];
    categoryId = json['category_id'];
    cost = json['cost'];
    price = json['price'];
    salePrice = json['sale_price'];
    onsale = json['onsale'];
    active = json['active'];
    hasAttribute = json['has_attribute'];
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    unit = json['unit'];
    stock = json['stock'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['barcode'] = this.barcode;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['cost'] = this.cost;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['onsale'] = this.onsale;
    data['active'] = this.active;
    data['has_attribute'] = this.hasAttribute;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    data['unit'] = this.unit;
    data['stock'] = this.stock;
    data['image'] = this.image;
    return data;
  }
}

class Variations {
  int? id;
  int? productId;
  String? barcode;
  String? name;
  int? stock;
  int? price;
  String? createdAt;
  String? updatedAt;

  Variations(
      {this.id,
      this.productId,
      this.barcode,
      this.name,
      this.stock,
      this.price,
      this.createdAt,
      this.updatedAt});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    barcode = json['barcode'];
    name = json['name'];
    stock = json['stock'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['barcode'] = this.barcode;
    data['name'] = this.name;
    data['stock'] = this.stock;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}