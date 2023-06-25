class Validator {

  static String? validateEmail(String? email) {
    if(email != null){
      email = email.trim();
      RegExp emailValidationRex = RegExp(
          r"^[a-zA-Z0-9._+]+@[a-zA-Z](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
      if (email.isEmpty) {
        return 'Enter Email';
      } else {
        bool validEmail = emailValidationRex.hasMatch(email);
        if (!validEmail || email.length > 255) {
          return "Please enter a valid Email id.";
        } else if (email.contains('++') ||
            email.contains('..') ||
            email.contains('__')) {
          return "Please enter a valid Email id.";
        }
      }
      return null;
    }
  }

  static String? validatePassword(String? password) {
    if(password != null){
      password = password.trim();
      bool validPassword = password.length >= 4 && password.length <= 32;
      if (!validPassword) {
        if(password.isEmpty){
          return "Enter Password";
        } else if (password.length < 4) {
          return "Enter minimum 4 characters";
        } else if (password.length > 32) {
          return "Enter maximum 32 characters.";
        }
      }
      return null;
    }
  }

  static String? validateConfirmPassword(String? password) {
    if(password != null){
      password = password.trim();
      bool validPassword = password.length >= 4 && password.length <= 32;
      if (!validPassword) {
        if(password.isEmpty){
          return "Enter Password";
        } else if (password.length < 4) {
          return "Enter minimum 4 characters";
        } else if (password.length > 32) {
          return "Enter maximum 32 characters.";
        }
      }
      return null;
    }
  }

  static String? validateName(String? name) {
    if (name != null) {
      name = name.trim();
      if (name.isEmpty) {
        return 'Enter Name';
      }
    }
    return null;
  }

}