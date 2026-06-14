import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

/// Reusable text input field — pill-shaped container (346x49)
/// Kosong → placeholder di tengah | Terisi/focus → label jadi legend di atas border
/// Dengan animasi smooth transition
class AppFormField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;

  const AppFormField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField>
    with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _animController;
  late Animation<double> _legendOpacity;
  late Animation<Offset> _legendSlide;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    _hasText = widget.controller?.text.isNotEmpty ?? false;
    widget.controller?.addListener(_onTextChange);

    _animController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _legendOpacity = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );

    _legendSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));

    if (_hasText || _focusNode.hasFocus) {
      _animController.value = 1.0;
    }
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus || _hasText) {
      _animController.forward();
    } else {
      _animController.reverse();
    }
    setState(() {});
  }

  void _onTextChange() {
    final hasText = widget.controller?.text.isNotEmpty ?? false;
    if (hasText != _hasText) {
      _hasText = hasText;
      if (_hasText) {
        _animController.forward();
      } else if (!_focusNode.hasFocus) {
        _animController.reverse();
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    widget.controller?.removeListener(_onTextChange);
    _focusNode.dispose();
    _animController.dispose();
    super.dispose();
  }

  bool get _showLegend => _focusNode.hasFocus || _hasText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 49,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Field container
          Container(
            width: double.infinity,
            height: 49,
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 24,
              right: widget.suffixIcon != null ? 8 : 24,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.lightGrey1, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: TextField(
                      controller: widget.controller,
                      focusNode: _focusNode,
                      obscureText: widget.obscureText,
                      keyboardType: widget.keyboardType,
                      textCapitalization: widget.textCapitalization,
                      inputFormatters: widget.inputFormatters,
                      onChanged: widget.onChanged,
                      style: AppTextStyles.body16,
                      decoration: InputDecoration(
                        hintText: _showLegend ? null : widget.label,
                        hintStyle: AppTextStyles.body16.copyWith(
                          color: AppColors.text2,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
                if (widget.suffixIcon != null) ...[
                  const SizedBox(width: 4),
                  widget.suffixIcon!,
                ],
              ],
            ),
          ),
          // Legend dengan animasi fade + slide
          if (_showLegend)
            Positioned(
              top: -6,
              left: 24,
              child: FadeTransition(
                opacity: _legendOpacity,
                child: SlideTransition(
                  position: _legendSlide,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    color: AppColors.white,
                    child: Text(
                      widget.label,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        height: 1.0,
                        color: AppColors.text2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
