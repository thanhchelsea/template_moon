part of template;

/// Class defining various BoxShadow configurations to apply consistent shadow effects.
///
/// This class provides predefined BoxShadow configurations for small, medium, and large shadows,
/// as well as customizable BoxShadow properties.
///
/// Example usage:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     boxShadow: [
///       PuBoxShadow.ksSmallShadow(), // Apply small shadow
///       PuBoxShadow.ksMediumShadow(color: Colors.black), // Custom with property
///       PuBoxShadow.largeShadow, // Apply large shadow
///     ],
///   ),
/// )
/// ```
class AppBoxShadow {
  // Predefined BoxShadow configurations for small, medium, and large shadows
  /// Small shadow configuration
  /// Custom with [color]
  static BoxShadow ksSmallShadow({
    Color? color,
    double? blurRadius,
    double? spreadRadius,
    Offset? offset,
  }) =>
      BoxShadow(
        color: color ?? Colors.black12.withOpacity(0.12),
        blurRadius: blurRadius ?? 4,
        offset: offset ?? const Offset(0, 3),
        spreadRadius: spreadRadius ?? 1,
      );

  /// Medium shadow configuration
  /// Custom with [color]
  static BoxShadow ksMediumShadow({Color? color}) => BoxShadow(
        color: color ?? Colors.black12.withOpacity(0.6),
        blurRadius: 16,
        offset: const Offset(0, 16),
        spreadRadius: 0,
      );

  /// Large shadow configuration
  /// Custom with [color]
  static BoxShadow ksLargeShadow({Color? color}) => BoxShadow(
        color: color ?? Colors.black12.withOpacity(0.6),
        blurRadius: 48,
        offset: const Offset(0, 16),
        spreadRadius: 0,
      );

  /// Customer shadow 1 configuration
  /// Custom with [color]
  BoxShadow ksShadowCustom1({Color? color}) {
    if (shadowCustom1 != null) {
      return BoxShadow(
        blurRadius: shadowCustom1?.blurRadius ?? 0,
        spreadRadius: shadowCustom1?.spreadRadius ?? 0,
        offset: shadowCustom1?.offset ?? const Offset(0, 0),
        color: color ?? shadowCustom1?.color ?? Colors.black12.withOpacity(0.6),
      );
    }
    return const BoxShadow();
  }

  /// Customer shadow 1 configuration
  /// Custom with [color]
  BoxShadow ksShadowCustom2({Color? color}) {
    if (shadowCustom1 != null) {
      return BoxShadow(
        blurRadius: shadowCustom2?.blurRadius ?? 0,
        spreadRadius: shadowCustom2?.spreadRadius ?? 0,
        offset: shadowCustom2?.offset ?? const Offset(0, 0),
        color: color ?? shadowCustom2?.color ?? Colors.black12.withOpacity(0.6),
      );
    }
    return const BoxShadow();
  }

  ///shadow inset
  static BoxShadow ksInsetShadow({Color? color}) => BoxShadow(
        color: color ?? const Color(0xff000000).withOpacity(0.2),
        // blurRadius: 2,
        offset: const Offset(0, -2),
        spreadRadius: 0,
      );

  // Customizable BoxShadow properties
  BoxShadow? shadowCustom1; //Property to store the first custom BoxShadow
  BoxShadow? shadowCustom2; // Property to store the second custom BoxShadow

  /// Constructor to initialize the PuBoxShadow class with custom shadow values.
  ///
  /// @param shadowCustom1 The first custom BoxShadow.
  /// @param shadowCustom2 The second custom BoxShadow.
  AppBoxShadow({
    this.shadowCustom1,
    this.shadowCustom2,
  });
}
