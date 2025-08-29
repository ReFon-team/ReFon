// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {
  /// Sign up
  public static let createAccount = Strings.tr("Localizable", "create_account", fallback: "Sign up")
  /// Or Register with
  public static let registerWith = Strings.tr("Localizable", "register_with", fallback: "Or Register with")
  /// Sign in
  public static let signIn = Strings.tr("Localizable", "sign_in", fallback: "Sign in")
  public enum Error {
    /// некорректный Email
    public static let email = Strings.tr("Localizable", "error.email", fallback: "некорректный Email")
    public enum Password {
      /// маленькой буквы
      public static let lowercase = Strings.tr("Localizable", "error.password.lowercase", fallback: "маленькой буквы")
      /// минимум 6 символов
      public static let minLenght = Strings.tr("Localizable", "error.password.min_lenght", fallback: "минимум 6 символов")
      /// Не хватает
      public static let notEnough = Strings.tr("Localizable", "error.password.not_enough", fallback: "Не хватает")
      /// цифры
      public static let number = Strings.tr("Localizable", "error.password.number", fallback: "цифры")
      /// специального символа
      public static let specialSymbol = Strings.tr("Localizable", "error.password.special_symbol", fallback: "специального символа")
      /// большой буквы
      public static let uppercase = Strings.tr("Localizable", "error.password.uppercase", fallback: "большой буквы")
    }
  }
  public enum Onboarding {
    /// Крупнейшая площадка
    /// для сделок с техникой
    public static let subtitle = Strings.tr("Localizable", "onboarding.subtitle", fallback: "Крупнейшая площадка\nдля сделок с техникой")
    /// ReFon
    public static let title = Strings.tr("Localizable", "onboarding.title", fallback: "ReFon")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
