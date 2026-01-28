class Shape {
  double calcArea(){
    return 0.0;
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  @override
  double calcArea() {
    return radius * 2;
  }
}

class Rectangle extends Shape {
  double r, l;
  Rectangle(this.l, this.r);
  @override
  double calcArea() {
    return l * r;
  }
}

void main() {
  List<Shape> arr = [Circle(2.2), Rectangle(1.1, 2.2)];
  arr.forEach((shape) => print(shape.calcArea()));
}
