// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ecommerce_app/model/product_model.dart';

class AllProducts {
  List<Product> products;
  num total;
  num skip;
  num limit;
  AllProducts({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  AllProducts copyWith({
    List<Product>? products,
    num? total,
    num? skip,
    num? limit,
  }) {
    return AllProducts(
      products: products ?? this.products,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  factory AllProducts.fromMap(Map<String, dynamic> map) {
    return AllProducts(
      products: List<Product>.from(
        (map['products'] as List<Product>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total: map['total'] as num,
      skip: map['skip'] as num,
      limit: map['limit'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllProducts.fromJson(String source) =>
      AllProducts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(products: $products, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(covariant AllProducts other) {
    if (identical(this, other)) return true;

    return listEquals(other.products, products) &&
        other.total == total &&
        other.skip == skip &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    return products.hashCode ^ total.hashCode ^ skip.hashCode ^ limit.hashCode;
  }
}
