class TExceptions implements Exception {
  final String message;

  const TExceptions([this.message = 'Đã xảy ra lỗi không mong muốn. Vui lòng thử lại.']);

  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('Địa chỉ email đã được đăng ký. Vui lòng sử dụng email khác.');
      case 'invalid-email':
        return const TExceptions('Địa chỉ email không hợp lệ. Vui lòng nhập email hợp lệ.');
      case 'weak-password':
        return const TExceptions('Mật khẩu quá yếu. Vui lòng chọn mật khẩu mạnh hơn.');
      case 'user-disabled':
        return const TExceptions('Tài khoản này đã bị vô hiệu hóa. Vui lòng liên hệ hỗ trợ để được trợ giúp.');
      case 'user-not-found':
        return const TExceptions('Thông tin đăng nhập không hợp lệ. Không tìm thấy người dùng.');
      case 'wrong-password':
        return const TExceptions('Mật khẩu không chính xác. Vui lòng kiểm tra lại mật khẩu và thử lại.');
      case 'INVALID_LOGIN_CREDENTIALS':
        return const TExceptions('Thông tin đăng nhập không hợp lệ. Vui lòng kiểm tra lại thông tin của bạn.');
      case 'too-many-requests':
        return const TExceptions('Quá nhiều yêu cầu. Vui lòng thử lại sau.');
      case 'invalid-argument':
        return const TExceptions('Tham số không hợp lệ cho phương thức xác thực.');
      case 'invalid-password':
        return const TExceptions('Mật khẩu không hợp lệ. Vui lòng thử lại.');
      case 'invalid-phone-number':
        return const TExceptions('Số điện thoại cung cấp không hợp lệ.');
      case 'operation-not-allowed':
        return const TExceptions('Nhà cung cấp đăng nhập đã bị vô hiệu hóa cho dự án Firebase của bạn.');
      case 'session-cookie-expired':
        return const TExceptions('Cookie phiên của Firebase đã hết hạn. Vui lòng đăng nhập lại.');
      case 'uid-already-exists':
        return const TExceptions('ID người dùng đã được sử dụng bởi người dùng khác.');
      case 'sign_in_failed':
        return const TExceptions('Đăng nhập thất bại. Vui lòng thử lại.');
      case 'network-request-failed':
        return const TExceptions('Yêu cầu mạng không thành công. Vui lòng kiểm tra kết nối internet.');
      case 'internal-error':
        return const TExceptions('Lỗi nội bộ. Vui lòng thử lại sau.');
      case 'invalid-verification-code':
        return const TExceptions('Mã xác minh không hợp lệ. Vui lòng nhập mã hợp lệ.');
      case 'invalid-verification-id':
        return const TExceptions('ID xác minh không hợp lệ. Vui lòng yêu cầu mã xác minh mới.');
      case 'quota-exceeded':
        return const TExceptions('Đã vượt quá hạn mức. Vui lòng thử lại sau.');
      default:
        return const TExceptions();
    }
  }
}
