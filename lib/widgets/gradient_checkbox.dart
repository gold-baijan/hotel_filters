import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: Center(child: MyCheckboxExample())),
    ),
  );
}

class MyCheckboxExample extends StatefulWidget {
  const MyCheckboxExample({super.key});

  @override
  State<MyCheckboxExample> createState() => _MyCheckboxExampleState();
}

class _MyCheckboxExampleState extends State<MyCheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GradientCheckbox(
      value: isChecked,
      onTap: () => setState(() => isChecked = !isChecked),
    );
  }
}

class GradientCheckbox extends StatelessWidget {
  final bool value;
  final VoidCallback onTap;

  const GradientCheckbox({super.key, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          gradient: value ? _myGradient : null,
          color: value ? null : Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: value ? Colors.transparent : Colors.grey.shade400,
            width: 2,
          ),
        ),
        child: value
            ? const Center(
                child: Icon(Icons.check, size: 18, color: Colors.white),
              )
            : null,
      ),
    );
  }
}

const LinearGradient _myGradient = LinearGradient(
  colors: [
    Color.fromRGBO(125, 158, 205, 1.0),
    Color.fromRGBO(115, 131, 163, 0.75),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
