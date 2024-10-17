class TFormatException implements Exception {
  final String message;
  const TFormatException([this.message = 'Đã xảy ra lỗi định dạng không mong muốn. Vui lòng kiểm tra lại thông tin nhập.']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formattedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException('Định dạng địa chỉ email không hợp lệ. Vui lòng nhập địa chỉ email hợp lệ.');
      case 'invalid-phone-number-format':
        return const TFormatException('Định dạng số điện thoại không hợp lệ. Vui lòng nhập số điện thoại hợp lệ.');
      case 'invalid-date-format':
        return const TFormatException('Định dạng ngày tháng không hợp lệ. Vui lòng nhập ngày tháng hợp lệ.');
      case 'invalid-url-format':
        return const TFormatException('Định dạng URL không hợp lệ. Vui lòng nhập URL hợp lệ.');
      case 'invalid-credit-card-format':
        return const TFormatException('Định dạng thẻ tín dụng không hợp lệ. Vui lòng nhập số thẻ tín dụng hợp lệ.');
      case 'invalid-numeric-format':
        return const TFormatException('Đầu vào phải có định dạng số hợp lệ.');
      default:
        return const TFormatException();
    }
  }
}
