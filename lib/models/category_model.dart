// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
    Categories({
        this.categories,
    });

    List<Category> categories;

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.categoryId,
        this.categoryName,
        this.categoryDescription,
        this.categoryImages,
    });

    int categoryId;
    String categoryName;
    String categoryDescription;
    List<String> categoryImages;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryDescription: json["category_description"],
        categoryImages: List<String>.from(json["category_images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_description": categoryDescription,
        "category_images": List<dynamic>.from(categoryImages.map((x) => x)),
    };
}
