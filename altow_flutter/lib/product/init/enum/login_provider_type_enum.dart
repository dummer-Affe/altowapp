enum ProviderType { facebook, google, apple, mobile }

extension LoginProviderTypeValue on ProviderType {
  String get rawValue {
    switch (this) {
      case ProviderType.facebook:
        return 'f';
      case ProviderType.google:
        return 'g';
      case ProviderType.apple:
        return 'a';
      case ProviderType.mobile:
        return 'm';
    }
  }

  ProviderType normalValue(String? val) {
    switch (val) {
      case 'f':
        return ProviderType.facebook;
      case 'g':
        return ProviderType.google;
      case 'a':
        return ProviderType.apple;
      case 'm':
        return ProviderType.mobile;

      default:
        throw Exception('$val not found in $this');
    }
  }

  String get convertString {
    switch (this) {
      case ProviderType.mobile:
        return "mobile";
      case ProviderType.google:
        return "google";
      case ProviderType.facebook:
        return "facebook";
      case ProviderType.apple:
        return "apple";
    }
  }
}
