class Category {
  List<CategoryData>? categoryData;
  String? status;
  String? message;

  Category({this.categoryData, this.status, this.message});

  Category.fromJson(Map<String, dynamic> json) {
    if (json['category_data'] != null) {
      categoryData = <CategoryData>[];
      json['category_data'].forEach((v) {
        categoryData!.add(new CategoryData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryData != null) {
      data['category_data'] =
          this.categoryData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class CategoryData {
  int? clothCategoryId;
  String? clothCategoryName;
  String? clothCategoryDesc;
  String? clothCategoryImg;

  CategoryData(
      {this.clothCategoryId,
      this.clothCategoryName,
      this.clothCategoryDesc,
      this.clothCategoryImg});

  CategoryData.fromJson(Map<String, dynamic> json) {
    clothCategoryId = json['cloth_category_id'];
    clothCategoryName = json['cloth_category_name'];
    clothCategoryDesc = json['cloth_category_desc'];
    clothCategoryImg = json['cloth_category_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cloth_category_id'] = this.clothCategoryId;
    data['cloth_category_name'] = this.clothCategoryName;
    data['cloth_category_desc'] = this.clothCategoryDesc;
    data['cloth_category_img'] = this.clothCategoryImg;
    return data;
  }
}
