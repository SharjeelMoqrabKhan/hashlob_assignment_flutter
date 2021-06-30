// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.data,
        this.code,
        this.message,
        this.imageUrl,
    });

    List<Datum> data;
    int code;
    String message;
    String imageUrl;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        code: json["code"],
        message: json["message"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
        "message": message,
        "image_url": imageUrl,
    };
}

class Datum {
    Datum({
        this.id,
        this.unitId,
        this.code,
        this.name,
        this.featuredImage,
        this.price,
        this.weight,
        this.description,
        this.isFeatured,
        this.customizeBox,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    dynamic unitId;
    String code;
    String name;
    dynamic featuredImage;
    String price;
    dynamic weight;
    dynamic description;
    int isFeatured;
    int customizeBox;
    int status;
    int createdBy;
    int updatedBy;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        unitId: json["unit_id"],
        code: json["code"],
        name: json["name"],
        featuredImage: json["featured_image"],
        price: json["price"],
        weight: json["weight"],
        description: json["description"],
        isFeatured: json["is_featured"],
        customizeBox: json["customize_box"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "unit_id": unitId,
        "code": code,
        "name": name,
        "featured_image": featuredImage,
        "price": price,
        "weight": weight,
        "description": description,
        "is_featured": isFeatured,
        "customize_box": customizeBox,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
