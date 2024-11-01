part of template;

extension DateTimeExt on DateTime {
  String formatDateTimeToddMMyyyy({String? formatString}) {
    // Định dạng DateTime theo dd-MM-yyyy HH:mm
    DateFormat format = DateFormat(formatString ?? 'dd-MM-yyyy HH:mm');
    return format.format(this);
  }

  DateTime getStartOfDay({DateTime? date}) {
    var d = this;
    return DateTime(d.year, d.month, d.day);
  }
}

extension StringExt on String {
  String toDateTimeString({String? format}) {
    DateTime dateTime = DateTime.parse(this);
    final String formattedDate =
        DateFormat(format ?? 'dd/MM/yyyy HH:mm').format(dateTime);
    return formattedDate;
  }

  DateTime stringToDateTime() {
    try {
      // Sử dụng DateFormat để phân tích chuỗi với định dạng dd-MM-yyyy HH:mm
      DateFormat format = DateFormat('dd-MM-yyyy');
      return format.parse(this);
    } catch (e) {
      print("Lỗi khi phân tích chuỗi: $e");
      throw e;
    }
  }
}
