import 'package:flutter/material.dart';
import 'package:flutter_template/domain/auth/info_model.dart';
import 'package:flutter_template/presentation/core/styles/app_colors.dart';
import 'package:flutter_template/presentation/core/widgets/bottom_sheet_panel.dart';
import 'package:flutter_template/presentation/core/widgets/custom/custom_sliver_appbar.dart';
import 'package:flutter_template/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:flutter_template/presentation/core/widgets/layout/sized_boxes.dart';
import 'package:flutter_template/presentation/drawer/custom_drawer.dart';

class BasePage extends StatelessWidget {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xFFF0F0F0),
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            isScrollControlled: true,
            context: context,
            builder: (builder) => BottomSheetPanel(),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: CustomSliverDelegate(
                  expandedHeight: 120,
                ),
              ),
            ];
          },
          body: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // BlocBuilder<AuthBloc, AuthState>(
              //   builder: (context, state) {
              //     return StreamBuilder<QuerySnapshot>(
              //       stream: FirebaseFirestore.instance.userInfoCollection
              //           .orderBy(state.orderBy, descending: false)
              //           .snapshots(),
              //       builder: (
              //         BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot,
              //       ) {
              //         if (snapshot.hasData) {
              //           final userInfoList = snapshot.data!.docs
              //               .map((e) => InfoModel.fromMap(
              //                   e.data() as Map<String, dynamic>))
              //               .toList();

              //           return ListView.builder(
              //             controller: _controller,
              //             // scrollDirection: Axis.vertical,
              //             shrinkWrap: true,
              //             itemCount: userInfoList.length,
              //             itemBuilder: (context, index) {
              //               return Container(
              //                 padding: const EdgeInsets.all(10),
              //                 margin: const EdgeInsets.symmetric(
              //                     horizontal: 20, vertical: 10),
              //                 decoration: const BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.all(
              //                     Radius.circular(15),
              //                   ),
              //                 ),
              //                 child: InfoTile(data: userInfoList[index]),
              //               );
              //             },
              //           );
              //         }
              //         return const SizedBox.shrink();
              //       },
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    Key? key,
    required this.data,
  }) : super(key: key);
  final InfoModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBoxH5(),
        Row(
          children: [
            const Text(
              "Name:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              data.name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBoxH10(),
        Row(
          children: [
            const Text(
              "City:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              data.city,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBoxH10(),
        Row(
          children: [
            const Text(
              "Age:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              data.age,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBoxH5(),
      ],
    );
  }
}
