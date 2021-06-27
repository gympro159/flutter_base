import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:characters/characters.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/core/utils/validate/validate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/input_decorator_custom.dart';
import 'core/text_form_field_custom.dart';

class InputValidateCustomWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isRequired;
  final FocusNode focusNode;
  final Function(FocusNode) focusError;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool obscureText;
  final List<Validate> validates;
  final double scrollPadding;
  final bool readOnly;
  final String defaultValue;
  final Function focusAction;
  final TextInputAction textInputAction;
  final bool showCursor;
  final bool scrollPaddingForTop;
  final Function onEditingComplete;
  final int limitLength;
  final bool enabled;
  final Function onChanged;

  InputValidateCustomWidget({
    this.label,
    this.hintText,
    this.isRequired = true,
    required this.focusNode,
    required this.controller,
    this.scrollPadding = 200.0,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.validates,
    this.readOnly = false,
    this.defaultValue,
    this.scrollPaddingForTop = false,
    this.focusError,
    this.textInputAction = TextInputAction.next,
    this.showCursor,
    this.focusAction,
    this.limitLength,
    this.onEditingComplete,
    this.enabled,
    this.onChanged,
  });

  @override
  _InputValidateCustomWidgetState createState() =>
      _InputValidateCustomWidgetState();
}

class _InputValidateCustomWidgetState extends State<InputValidateCustomWidget> {
  bool _isVisible = false;
  bool _obscureText = false;
  bool _isFocus = false;

  @override
  void initState() {
    if (widget.controller.text.isEmpty) {
      widget.controller.text = widget.defaultValue ?? '';
    }
    _obscureText = widget.obscureText;
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        _isFocus = true;
      } else {
        _isFocus = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.text.isNotEmpty && !_isVisible) {
      setState(() {
        _isVisible = true;
      });
    }
    return TextFormFieldCustom(
      maxLength: widget.limitLength,
      enabled: widget.enabled ?? true,
      onEditingComplete: widget.onEditingComplete,
      obscureText: _obscureText,
      controller: widget.controller,
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      showCursor: widget.showCursor,
      style: GoogleFonts.inter(
        fontSize: fontExMiddle,
        color: PRIMARY_TEXT_COLOR,
      ),
      inputFormatters: [
        LengthLimitingTextFieldFormatterFixed(widget.limitLength),
        widget.textInputType == TextInputType.number
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter
      ],
      onFieldSubmitted: (String value) {
        widget.focusAction();
      },
      validator: (String value) {
        if (widget.validates != null) {
          for (var validate in widget.validates) {
            if (validate.validate(value) != null) {
              widget.focusError(widget.focusNode);
              return validate.validate(value);
            }
          }
        }
        return null;
      },
      keyboardType: widget.textInputType,
      cursorColor: PRIMARY_COLOR,
      cursorWidth: 0.8,
      scrollPadding: widget.scrollPaddingForTop
          ? EdgeInsets.only(top: widget.scrollPadding)
          : EdgeInsets.only(bottom: widget.scrollPadding),
      decoration: CInputDecoration(
        fillColor:
            widget.enabled == false ? FILTER_CONTAINER_COLOR : Colors.white,
        filled: true,
        errorMaxLines: 3,
        contentPadding: EdgeInsets.only(left: 15, bottom: 0),
        counter: Offstage(),
        isMandate: widget.isRequired,
        labelText: widget.label,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: fontSmall,
          color: SECONDARY_TEXT_COLOR,
          fontWeight: FontWeight.normal,
        ),
        helperText: '',
        labelStyle: GoogleFonts.inter(
          fontSize: fontSmall,
          color: _isFocus ? PRIMARY_TEXT_COLOR : SECONDARY_TEXT_COLOR,
          fontWeight: _isFocus ? FontWeight.bold : FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: BORDER_COLOR, width: 0.6),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: BORDER_COLOR, width: 0.6),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PRIMARY_COLOR, width: 0.6),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isVisible && widget.enabled != false
                // && widget.obscureText == true
                ? Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        widget.controller.clear();
                        _isVisible = false;
                        setState(() {});
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset(
                          SVG_ASSETS_PATH + 'icon_clear.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            widget.obscureText
                ? Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Icon(
                            !_obscureText
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_sharp,
                            color: Color(0xff617882),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
      onChanged: (String value) {
        if (widget.onChanged != null) widget.onChanged(value);
        if (value.trim().isEmpty) {
          _isVisible = false;
        } else {
          _isVisible = true;
        }
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    // widget.focusNode.dispose();
    super.dispose();
  }
}

/// TextInputFormatter that fixes the regression.
/// https://github.com/flutter/flutter/issues/67236
///
/// Remove it once the issue above is fixed.
class LengthLimitingTextFieldFormatterFixed
    extends LengthLimitingTextInputFormatter {
  LengthLimitingTextFieldFormatterFixed(int maxLength) : super(maxLength);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (maxLength != null &&
        maxLength > 0 &&
        newValue.text.characters.length > maxLength) {
      // If already at the maximum and tried to enter even more, keep the old
      // value.
      if (oldValue.text.characters.length == maxLength) {
        return oldValue;
      }
      // ignore: invalid_use_of_visible_for_testing_member
      return LengthLimitingTextInputFormatter.truncate(newValue, maxLength);
    }
    return newValue;
  }
}
