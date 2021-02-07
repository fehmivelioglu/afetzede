class FormValidator {
  String validateRumuzMail(String value) {
    if (value.length < 2) {
      return 'Kullanıcı adınız veya email adresiniz 3 karakterden az olamaz.';
    }
    if (value.length > 50) {
      return 'Kullanıcı adınız veya email adresiniz 50 karakterden fazla olamaz.';
    }

    return null;
  }

  String validatePassword(String value) {
    if (value.length < 3) {
      return 'Şifre 4 karakterden az olamaz.';
    }
    if (value.length > 10) {
      return 'Şifre 10 karakterden fazla olamaz.';
    }

    return null;
  }

  String validateAciklama(String value) {
    if (value.length < 2) {
      return 'Aciklama en az 2 karakterden oluşmalıdır';
    }
    if (value.length > 50) {
      return 'Aciklama 50 karakterden az olmalidir';
    }
    return null;
  }

  String validateMiktar(int value) {
    if (value < 2) {
      return 'soyisim en az 2 karakterden oluşmalıdır';
    }
    return null;
  }

  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Geçerli mail adresi girmelisiniz';
    }
    return null;
  }
}
