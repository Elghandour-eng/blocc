class Product
{
  String? name;
  String? price;
  String? fat;
  String? category;
  String? cal;
  String? id;

  Product({this.id,this.name,this.category,this.price,this.cal,this.fat});


  toJson()
  {
    return
        {
          'Name':name,
          'id':id,
          'Fat':fat,
          'Cal':cal,
          'Category':category,
          'Price':price,

        };


  }

  Product.fromJson(Map<String,dynamic> json)
  {
     id =json['id'];
     name =json['Name'];
     category =json['Category'];
     cal =json['Cal'];
     fat =json['Fat'];
     price =json['Price'];
  }

}