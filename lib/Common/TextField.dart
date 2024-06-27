import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextInputType type;
  final TextEditingController? controller;

  const CustomTextField(
      {super.key,
        required this.title,
        required this.hint,
        required this.type,
        this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white60,
          child: TextField(
            controller: controller,
            keyboardType: type,
            cursorColor: Colors.blue.shade800,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade700)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade800))),
          ),
        )
      ],
    );
  }
}

class SmallTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextInputType type;
  const SmallTextField(
      {super.key, required this.title, required this.hint, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37,
      color: Colors.white60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          TextField(
            keyboardType: type,
            cursorColor: Colors.blue.shade800,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade700)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade800))),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback? onpressed;
  const CustomButton({super.key, required this.name, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff1877F2), // Background color
            shadowColor: Colors.black, // Shadow color
            elevation: 5, // Elevation
            // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
          ),
          onPressed: onpressed,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}

class AreaField extends StatefulWidget {
  final TextEditingController? controller;
  final String initialValue;
  final ValueChanged<String>? onUnitSelected;

  const AreaField(
      {Key? key,
        required this.controller,
        this.onUnitSelected,
        required this.initialValue})
      : super(key: key);

  @override
  State<AreaField> createState() => _AreaFieldState();
}

class _AreaFieldState extends State<AreaField> {
  late String selectedUnit;

  @override
  void initState() {
    selectedUnit =
    widget.initialValue == '' ? 'Select Unit' : widget.initialValue;
    super.initState();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Select Unit',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('Sq.ft'),
                onTap: () {
                  setState(() {
                    selectedUnit = 'Sq.ft';
                  });
                  Navigator.pop(context);
                  widget.onUnitSelected?.call('Sq.ft');
                },
              ),
              Divider(),
              ListTile(
                title: Text('Sq.m'),
                onTap: () {
                  setState(() {
                    selectedUnit = 'Sq.m';
                  });
                  Navigator.pop(context);
                  widget.onUnitSelected?.call('Sq.m');
                },
              ),
              Divider(),
              ListTile(
                title: Text('Acres'),
                onTap: () {
                  setState(() {
                    selectedUnit = 'Acres';
                  });
                  Navigator.pop(context);
                  widget.onUnitSelected?.call('Acres');
                },
              ),
              Divider(),
              ListTile(
                title: Text('Hectares'),
                onTap: () {
                  setState(() {
                    selectedUnit = 'Hectares';
                  });
                  Navigator.pop(context);
                  widget.onUnitSelected?.call('Hectares');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Area',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white60,
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.number,
            cursorColor: Colors.blue.shade800,
            decoration: InputDecoration(
              suffixIcon: Container(
                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        _showBottomSheet(context);
                      },
                      child: Text(
                        selectedUnit,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    )
                  ],
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: 'Enter Area',
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final String title;
  final String hint;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    Key? key,
    required this.options,
    this.initialValue,
    required this.title,
    required this.hint,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String? _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.initialValue ?? null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initialValue != null &&
        !widget.options.contains(widget.initialValue)) {
      throw Exception('Initial value is not in the options list');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade700),
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text(
                widget.hint,
                style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
              value: _selectedValue,
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              style: TextStyle(color: Colors.black54),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue ?? '';
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue);
                }
              },
              items:
              widget.options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}