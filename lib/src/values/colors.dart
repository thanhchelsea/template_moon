part of template;

/// ThemeColorExtension template for custom theme color app
/// For purposes, we can use all required fields from the default Material `ColorScheme`
/// But we can add, rename and delete any fields
/// With this template, we have two type theme color
///
/// ### Theme color system
///
/// Theme color system are color fields that any application uses
/// It can have different values in different applications
/// It is required
///
/// ### Theme color product
///
/// Are color fields that can appear in products
/// They may or may not appear in products
/// And they may not need to be initialized when the product does not use these fields
/// They can have different values in different applications
/// The names of these fields begin with `product`

class ThemeColorExtension extends ThemeExtension<ThemeColorExtension> {
  /// ### Theme color system

  /// Main color of the application
  ///
  /// --primary-color-main
  final Color ksPrimary;

  /// Application secondary color
  ///
  /// --secondary-color-main
  final Color ksSecondary;

  /// Tertiary color of the application
  ///
  /// --tertiary-color-main
  final Color ksTertiary;

  /// Color for description content
  ///
  /// --body-color-main
  final Color ksBody;

  /// Color of borders and dividers
  ///
  /// --border-color-main
  final Color ksBorder;

  /// Color represents positive information, a state of success
  ///
  /// --success-color-default
  final Color ksSuccess;

  /// Color indicate necessary warnings
  ///
  /// --warning-color-default
  final Color ksWarning;

  /// Color is for links and useful information
  ///
  /// --info-color-default
  final Color ksInfo;

  /// Color indicates error, dangerous action
  ///
  /// --error-color-default
  final Color ksError;

  /// Color represents darkness
  ///
  /// --black-color-default
  final Color ksBlack;

  /// Color represents light hue
  ///
  /// --white-color-default
  final Color ksWhite;

  /// Color represents neutral hue
  ///
  /// --grey-color-default
  final Color ksGrey;

  /// Main background color
  ///
  /// --background-color-main
  final List<Color> ksBackground1;

  /// Custom colors (additional colors) for each product
  ///
  /// --background-color-2
  final Color ksBackground2;

  ///--background-color-3
  ///
  final Color ksBackground3;

  /// ### Theme color product

  /// Colors of main buttons
  ///
  /// --product-specific-color-btn1
  final List<Color>? ksProductCustomColors1;

  /// Colors of progess has value 1 - 30%
  ///
  /// --product-specific-color-progess-1-30-percent
  final List<Color>? ksProductCustomColors2;

  /// Colors of progess has value 31 - 69%
  ///
  /// --product-specific-color-progess-31-69-percent
  final List<Color>? ksProductCustomColors3;

  /// Colors of progess has value 70 - 100%
  ///
  /// --product-specific-color-progess-70-100-percent
  final List<Color>? ksProductCustomColors4;

  /// Progress colors has a value of 0%
  ///
  /// --product-specific-color-progess-0-percent
  final List<Color>? ksProductCustomColors5;

  /// Color of text with progress has value of 1 - 30%
  ///
  /// --product-specific-color-text-1-30-percent
  final Color? ksProductCustomColors6;

  /// Color of text with progress has value of 31 - 69%
  ///
  /// --product-specific-color-text-31-69-percent
  final Color? ksProductCustomColors7;

  /// Color of text with progress has value of 70 - 100%
  ///
  /// --product-specific-color-text-70-100-percent
  final Color? ksProductCustomColors8;

  /// Color of text with progress has value of 0%
  ///
  /// --product-specific-color-text-0-percent
  final Color? ksProductCustomColors9;

  /// Color statistics of new questions
  ///
  /// --product-specific-color-result-new-questions
  final Color? ksProductCustomColors10;

  /// Color statistics of new questions
  ///
  /// --product-specific-color-result-marked-questions
  final Color? ksProductCustomColors11;
//
  ThemeColorExtension({
    required this.ksPrimary,
    required this.ksSecondary,
    required this.ksTertiary,
    required this.ksBody,
    required this.ksBorder,
    required this.ksSuccess,
    required this.ksWarning,
    required this.ksInfo,
    required this.ksError,
    required this.ksBlack,
    required this.ksWhite,
    required this.ksGrey,
    required this.ksBackground1,
    required this.ksBackground2,
    required this.ksBackground3,
    this.ksProductCustomColors1,
    this.ksProductCustomColors2,
    this.ksProductCustomColors3,
    this.ksProductCustomColors4,
    this.ksProductCustomColors5,
    this.ksProductCustomColors6,
    this.ksProductCustomColors7,
    this.ksProductCustomColors8,
    this.ksProductCustomColors9,
    this.ksProductCustomColors10,
    this.ksProductCustomColors11,
  });

  @override
  ThemeExtension<ThemeColorExtension> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? body,
    Color? border,
    Color? success,
    Color? warning,
    Color? info,
    Color? error,
    Color? black,
    Color? white,
    Color? grey,
    List<Color>? background1,
    Color? background2,
    Color? background3,
    List<Color>? productCustomColors1,
    List<Color>? productCustomColors2,
    List<Color>? productCustomColors3,
    List<Color>? productCustomColors4,
    List<Color>? productCustomColors5,
    Color? productCustomColors6,
    Color? productCustomColors7,
    Color? productCustomColors8,
    Color? productCustomColors9,
    Color? productCustomColors10,
    Color? productCustomColors11,
  }) {
    return ThemeColorExtension(
      ksPrimary: primary ?? this.ksPrimary,
      ksSecondary: secondary ?? this.ksSecondary,
      ksTertiary: tertiary ?? this.ksTertiary,
      ksBody: body ?? this.ksBody,
      ksBorder: border ?? this.ksBody,
      ksSuccess: success ?? this.ksSuccess,
      ksWarning: warning ?? this.ksWarning,
      ksInfo: info ?? this.ksInfo,
      ksError: error ?? this.ksError,
      ksBlack: black ?? this.ksBlack,
      ksWhite: white ?? this.ksWhite,
      ksGrey: grey ?? this.ksGrey,
      ksBackground1: background1 ?? this.ksBackground1,
      ksBackground2: background2 ?? this.ksBackground2,
      ksBackground3: background3 ?? this.ksBackground3,
      ksProductCustomColors1:
          productCustomColors1 ?? this.ksProductCustomColors1,
      ksProductCustomColors2:
          productCustomColors2 ?? this.ksProductCustomColors2,
      ksProductCustomColors3:
          productCustomColors3 ?? this.ksProductCustomColors3,
      ksProductCustomColors4:
          productCustomColors4 ?? this.ksProductCustomColors4,
      ksProductCustomColors5:
          productCustomColors5 ?? this.ksProductCustomColors5,
      ksProductCustomColors6:
          productCustomColors6 ?? this.ksProductCustomColors6,
      ksProductCustomColors7:
          productCustomColors7 ?? this.ksProductCustomColors7,
      ksProductCustomColors8:
          productCustomColors8 ?? this.ksProductCustomColors8,
      ksProductCustomColors9:
          productCustomColors9 ?? this.ksProductCustomColors9,
      ksProductCustomColors10:
          productCustomColors10 ?? this.ksProductCustomColors10,
      ksProductCustomColors11:
          productCustomColors11 ?? this.ksProductCustomColors11,
    );
  }

  @override
  ThemeExtension<ThemeColorExtension> lerp(
      covariant ThemeExtension<ThemeColorExtension>? other, double t) {
    if (other is! ThemeColorExtension) {
      return this;
    }

    return ThemeColorExtension(
      ksPrimary: Color.lerp(ksPrimary, other.ksPrimary, t)!,
      ksSecondary: Color.lerp(ksSecondary, other.ksSecondary, t)!,
      ksTertiary: Color.lerp(ksTertiary, other.ksTertiary, t)!,
      ksBody: Color.lerp(ksBody, other.ksBody, t)!,
      ksBorder: Color.lerp(ksBorder, other.ksBorder, t)!,
      ksSuccess: Color.lerp(ksSuccess, other.ksSuccess, t)!,
      ksWarning: Color.lerp(ksWarning, other.ksWarning, t)!,
      ksInfo: Color.lerp(ksInfo, other.ksInfo, t)!,
      ksError: Color.lerp(ksError, other.ksError, t)!,
      ksBlack: Color.lerp(ksBlack, other.ksBlack, t)!,
      ksWhite: Color.lerp(ksWhite, other.ksWhite, t)!,
      ksGrey: Color.lerp(ksGrey, other.ksGrey, t)!,
      ksBackground1: ksBackground1,
      ksBackground2: Color.lerp(ksBackground2, other.ksBackground2, t)!,
      ksBackground3: Color.lerp(ksBackground3, other.ksBackground3, t)!,
      ksProductCustomColors6:
          Color.lerp(ksProductCustomColors6, other.ksProductCustomColors6, t),
      ksProductCustomColors7:
          Color.lerp(ksProductCustomColors7, other.ksProductCustomColors7, t),
      ksProductCustomColors8:
          Color.lerp(ksProductCustomColors8, other.ksProductCustomColors8, t),
      ksProductCustomColors10:
          Color.lerp(ksProductCustomColors10, other.ksProductCustomColors10, t),
      ksProductCustomColors11:
          Color.lerp(ksProductCustomColors11, other.ksProductCustomColors11, t),
    );
  }
}
