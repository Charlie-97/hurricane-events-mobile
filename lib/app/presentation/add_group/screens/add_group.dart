import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hurricane_events/app/presentation/add_group/widgets/add_people_button.dart';
import 'package:hurricane_events/app/presentation/add_group/widgets/add_people_chip.dart';
import 'package:hurricane_events/app/router/base_navigator.dart';
import 'package:hurricane_events/component/constants/color.dart';
import 'package:hurricane_events/component/constants/images.dart';
import 'package:hurricane_events/component/utils/extensions.dart';
import 'package:hurricane_events/component/widgets/click_button.dart';
import 'package:hurricane_events/component/widgets/custom_button.dart';
import 'package:hurricane_events/component/widgets/custom_textfield.dart';
import 'package:hurricane_events/component/widgets/svg_picture.dart';

class AddGroupScreen extends StatefulWidget {
  static const routeName = "add_group";
  const AddGroupScreen({super.key});

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  final TextEditingController _nameOfGroupController = TextEditingController();

  String? nameError;

  final nameFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: AppColors.backgroundColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: ClickWidget(
          onTap: () {
            BaseNavigator.pop();
          },
          child: const SizedBox(
            height: 30,
            width: 30,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
          ),
        ),
      ),
      title: Text(
        "Add Group",
        style: context.headline3.copyWith(
          fontSize: 16,
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              (appBar.preferredSize.height + 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                32.height,
                Text(
                  'Name of Group',
                  style: context.body2.copyWith(
                    fontSize: 12,
                  ),
                ),
                8.height,
                CustomTextField(
                  focus: nameFocus,
                  filled: true,
                  controller: _nameOfGroupController,
                  errorText: nameError,
                  hintText: "Enter name of event",
                  validator: (p0) {
                    if (p0 == null || p0.trim().isEmpty) {
                      nameError = "Please enter your event name";
                      setState(() {});
                      return nameError;
                    }

                    nameError = null;
                    setState(() {});
                    return nameError;
                  },
                ),
                const Gap(24),

                //Choose an icon
                Text(
                  'Choose an icon',
                  style: context.body2.copyWith(
                    fontSize: 12,
                  ),
                ),
                8.height,

                Row(children: [
                  Container(
                    height: 76.0,
                    width: 76.0,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: AppColors.darkGrey2,
                    ),
                    child: const Svg(
                      image: AppImages.techiesIcon,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Container(
                    height: 76.0,
                    width: 76.0,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: AppColors.darkGrey2,
                    ),
                    child: const Svg(
                      image: AppImages.techiesIcon,
                    ),
                  ),
                  12.width,
                  ClickWidget(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: AppColors.designOrange,
                        ),
                        7.width,
                        Text(
                          "Add from\nGallery",
                          style: context.body1.copyWith(
                            fontSize: 12,
                            color: AppColors.designOrange,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
                const Gap(24),
                Text(
                  'Add people',
                  style: context.body2.copyWith(
                    fontSize: 12,
                  ),
                ),
                8.height,
                Container(
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF2F2F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ...List.generate(
                          2,
                          (index) => const AddPeopleChip(),
                        ),
                        const AddPeopleButton(),
                      ],
                    )),
                const Spacer(),
                CustomButton(
                  radius: 32,
                  backgroundColor: AppColors.darkBlue1,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {}
                  },
                  buttonWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      7.width,
                      Text(
                        "Add Group",
                        style: context.button2.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                48.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}