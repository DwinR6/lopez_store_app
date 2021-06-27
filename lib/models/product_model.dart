// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    Products({
        this.products,
    });

    List<Product> products;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.catergoryName,
        this.subcategoryName,
        this.productId,
        this.productName,
        this.productDescription,
        this.productPrice,
        this.productSizes,
        this.productInformation,
        this.productSelectProperties,
        this.productImages,
    });

    String catergoryName;
    String subcategoryName;
    int productId;
    String productName;
    String productDescription;
    double productPrice;
    List<dynamic> productSizes;
    ProductInformation productInformation;
    ProductSelectProperties productSelectProperties;
    List<dynamic> productImages;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        catergoryName: json["catergory_name"] == null ? null : json["catergory_name"],
        subcategoryName: json["subcategory_name"] == null ? null : json["subcategory_name"],
        productId: json["product_id"] == null ? null : json["product_id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        productDescription: json["product_description"] == null ? null : json["product_description"],
        productPrice: json["product_price"] == null ? null : json["product_price"],
        productSizes: json["product_sizes"] == null ? null : List<dynamic>.from(json["product_sizes"].map((x) => x)),
        productInformation: json["product_information"] == null ? null : ProductInformation.fromJson(json["product_information"]),
        productSelectProperties: json["product_select_properties"] == null ? null : ProductSelectProperties.fromJson(json["product_select_properties"]),
        productImages: json["product_images"] == null ? null : List<dynamic>.from(json["product_images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "catergory_name": catergoryName == null ? null : catergoryName,
        "subcategory_name": subcategoryName == null ? null : subcategoryName,
        "product_id": productId == null ? null : productId,
        "product_name": productName == null ? null : productName,
        "product_description": productDescription == null ? null : productDescription,
        "product_price": productPrice == null ? null : productPrice,
        "product_sizes": productSizes == null ? null : List<dynamic>.from(productSizes.map((x) => x)),
        "product_information": productInformation == null ? null : productInformation.toJson(),
        "product_select_properties": productSelectProperties == null ? null : productSelectProperties.toJson(),
        "product_images": productImages == null ? null : List<dynamic>.from(productImages.map((x) => x)),
    };
}

class ProductInformation {
    ProductInformation({
        this.informations,
    });

    List<Information> informations;

    factory ProductInformation.fromJson(Map<String, dynamic> json) => ProductInformation(
        informations: json["informations"] == null ? null : List<Information>.from(json["informations"].map((x) => Information.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "informations": informations == null ? null : List<dynamic>.from(informations.map((x) => x.toJson())),
    };
}

class Information {
    Information({
        this.procesador,
        this.pantalla,
    });

    String procesador;
    String pantalla;

    factory Information.fromJson(Map<String, dynamic> json) => Information(
        procesador: json["procesador"] == null ? null : json["procesador"],
        pantalla: json["pantalla"] == null ? null : json["pantalla"],
    );

    Map<String, dynamic> toJson() => {
        "procesador": procesador == null ? null : procesador,
        "pantalla": pantalla == null ? null : pantalla,
    };
}

class ProductSelectProperties {
    ProductSelectProperties({
        this.properties,
    });

    List<Property> properties;

    factory ProductSelectProperties.fromJson(Map<String, dynamic> json) => ProductSelectProperties(
        properties: json["properties"] == null ? null : List<Property>.from(json["properties"].map((x) => Property.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "properties": properties == null ? null : List<dynamic>.from(properties.map((x) => x.toJson())),
    };
}

class Property {
    Property({
        this.tallas,
        this.color,
    });

    List<String> tallas;
    List<String> color;

    factory Property.fromJson(Map<String, dynamic> json) => Property(
        tallas: json["tallas"] == null ? null : List<String>.from(json["tallas"].map((x) => x)),
        color: json["color"] == null ? null : List<String>.from(json["color"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "tallas": tallas == null ? null : List<dynamic>.from(tallas.map((x) => x)),
        "color": color == null ? null : List<dynamic>.from(color.map((x) => x)),
    };
}
