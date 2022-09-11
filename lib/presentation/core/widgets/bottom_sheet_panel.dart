import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/auth/auth_bloc.dart';
import 'package:flutter_template/domain/restaurant/restaurant_model.dart';
import 'package:flutter_template/presentation/core/styles/app_colors.dart';
import 'package:flutter_template/presentation/core/widgets/layout/sized_boxes.dart';

class BottomSheetPanel extends StatefulWidget {
  BottomSheetPanel({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetPanel> createState() => _BottomSheetPanelState();
}

class _BottomSheetPanelState extends State<BottomSheetPanel> {
  final _key = GlobalKey<FormState>();
  late String name;

  late String city;

  late String age;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _key,
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          color: const Color(0xFFF0F0F0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBoxH10(),
              const Text(
                "add user info",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBoxH20(),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Name is required" : null,
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Name",
                  fillColor: Colors.white,
                ),
              ),
              const SizedBoxH10(),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Age is required" : null,
                onChanged: (value) {
                  age = value;
                },
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Age",
                  fillColor: Colors.white,
                ),
              ),
              const SizedBoxH10(),
              TextFormField(
                validator: (val) => val!.isEmpty ? "City is required" : null,
                onChanged: (value) {
                  city = value;
                },
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "City",
                  fillColor: Colors.white,
                ),
              ),
              const SizedBoxH10(),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      // context.read<AuthBloc>().add(
                      //       AuthEvent.addData(
                      //         data: RestaurantModel(
                      //           name: name,
                      //           age: age,
                      //           city: city,
                      //         ),
                      //       ),
                      //     );
                      Navigator.of(context).pop();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.primary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                  child: const Text("Add"),
                ),
              ),
              const SizedBoxH10(),
            ],
          ),
        ),
      ),
    );
  }
}
