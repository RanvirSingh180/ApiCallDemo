class ColorData{
  int  id;
  String name;
  int year;
  String color;
  String pantoneValue;
  ColorData({
    required this.name,required this.id,required this.color,required this.pantoneValue,required this.year});
  factory ColorData.fromJson(Map<String,dynamic>json){
    return ColorData(
      name: json['name'] as String,
      id: json['id'] as int ,
      color: json['color'] as String,
      year: json['year'] as int,
      pantoneValue: json['pantone_value'] as String
    );
  }
}