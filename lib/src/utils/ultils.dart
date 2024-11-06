part of template;

class UtilsTemplate {
  static Color getColor(int index) {
    List<Color> defaultColor = const [
      Color(0xFFFF6F61), // Đỏ cam
      Color(0xFFEFC050), // Vàng nắng
      Color(0xFF92A8D1), // Xanh da trời nhạt
      Color(0xFF009B77), // Xanh lá cây đậm
      Color(0xFF5B5EA6), // Xanh chàm
      Color(0xFFD65076), // Hồng đậm
      Color(0xFF45B8AC), // Xanh ngọc
      Color(0xFFDFCFBE), // Be nhạt
      Color(0xFFBC243C), // Đỏ rượu
      Color(0xFF955251), // Nâu đỏ
      Color(0xFF88B04B), // Xanh lá cây nhạt
      Color(0xFF98B4D4), // Xanh dương pastel
      Color(0xFFB565A7), // Tím oải hương
      Color(0xFF6B5B95), // Tím đậm
      Color(0xFFF7CAC9), // Hồng nhạt
    ];
    if (index < defaultColor.length) {
      return defaultColor[index];
    } else {
      int r = (index * 50) % 256; // Đỏ
      int g = (index * 100) % 256; // Xanh lá
      int b = (index * 150) % 256; // Xanh dương
      // Tối ưu hóa màu sắc
      r = (r + 50) % 256; // Thêm 50 để làm cho màu sáng hơn
      g = (g + 50) % 256; // Thêm 50 để làm cho màu sáng hơn
      b = (b + 50) % 256; // Thêm 50 để làm cho màu sáng hơn
      return Color.fromARGB(255, r, g, b); // Màu RGBA
    }
  }
}
