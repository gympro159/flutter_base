import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/font_sizes.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/common/widgets/date_picker/button_date_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateRangePickerWidget extends StatefulWidget {
  final TextEditingController rangeDateController;
  final FocusNode rangeDateFocusNode;
  final Function setValue;

  const DateRangePickerWidget(
      {Key? key,
      required this.rangeDateController,
      required this.rangeDateFocusNode,
      required this.setValue})
      : super(key: key);

  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTimeRange? dateRange;
  bool _isFocus = false;

  String getFrom() {
    if (dateRange == null) {
      return 'From';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange!.start);
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return 'Until';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange!.end);
    }
  }

  @override
  Widget build(BuildContext context) => HeaderWidget(
        title: 'Date Range',
        child: TextFormField(
          controller: widget.rangeDateController,
          readOnly: true,
          focusNode: widget.rangeDateFocusNode,
          onTap: () {
            pickDateRange(context);
          },
          style: GoogleFonts.inter(
            fontSize: fontExMiddle,
            color: PRIMARY_TEXT_COLOR,
            fontWeight: FontWeight.normal,
          ),
          decoration: InputDecoration(
            helperText: '',
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
            labelText: 'Khoảng thời gian tạo',
            labelStyle: GoogleFonts.inter(
              fontSize: fontSmall,
              color: _isFocus ? PRIMARY_TEXT_COLOR : SECONDARY_TEXT_COLOR,
              fontWeight: _isFocus ? FontWeight.bold : FontWeight.normal,
            ),
            suffixIcon: Material(
              color: Colors.transparent,
              child: InkWell(
                // onTap: () {
                //   _selectDate(context);
                // },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(
                    SVG_ASSETS_PATH + 'icon_date_picker.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       child: ButtonWidget(
        //         text: getFrom(),
        //         onClicked: () => pickDateRange(context),
        //       ),
        //     ),
        //     const SizedBox(width: 8),
        //     Icon(Icons.arrow_forward, color: Colors.white),
        //     const SizedBox(width: 8),
        //     Expanded(
        //       child: ButtonWidget(
        //         text: getUntil(),
        //         onClicked: () => pickDateRange(context),
        //       ),
        //     ),
        //   ],
        // ),
      );

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
    widget.setValue(
        from: '${DateFormat('yyyy-MM-dd').format(newDateRange.start)}T00:00:00',
        until: '${DateFormat('yyyy-MM-dd').format(newDateRange.end)}T00:00:00',
        text:
            '${DateFormat('dd/MM/yyyy').format(newDateRange.start)} - ${DateFormat('dd/MM/yyyy').format(newDateRange.end)}');
  }
}
