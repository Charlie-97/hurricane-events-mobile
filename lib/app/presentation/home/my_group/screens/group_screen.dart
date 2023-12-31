import 'package:flutter/material.dart';
import 'package:hurricane_events/app/presentation/add_group/screens/add_group.dart';
import 'package:hurricane_events/app/presentation/home/my_group/provider/my_group_provider.dart';
import 'package:hurricane_events/app/presentation/home/my_group/widgets/group_card.dart';
import 'package:hurricane_events/app/router/base_navigator.dart';
import 'package:hurricane_events/component/constants/color.dart';
import 'package:hurricane_events/component/enums/enums.dart';
import 'package:hurricane_events/component/utils/extensions.dart';
import 'package:hurricane_events/component/widgets/shimmer/timeline_shimmer.dart';
import 'package:provider/provider.dart';

class GroupScreen extends StatefulWidget {
  static const String routeName = "my_group";
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyGroupProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  12.height,
                  Text(
                    "My Group",
                    textAlign: TextAlign.center,
                    style: context.headline3.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  24.height,
                  provider.state == AppState.loading
                      ? const Expanded(
                          child: Center(
                          child: TimelineShimmer(),
                        ))
                      : Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              return provider.getGroups();
                            },
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                final group = provider.allGroups[index]!;
                                return MyGroupCard(
                                  title: group.title!,
                                  numberOfEvent: 3,
                                  numberOfPeople: 20,
                                  groupDetail: group,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return 16.height;
                              },
                              itemCount: provider.allGroups.length,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              BaseNavigator.pushNamed(
                AddGroupScreen.routeName,
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            elevation: 0.0,
            backgroundColor: AppColors.darkBlue1,
            extendedPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            label: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                10.width,
                Text(
                  "Add Group",
                  style: context.button2.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
