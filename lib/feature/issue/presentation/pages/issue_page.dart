import 'package:c_space/feature/problems/presentation/bloc/issue_get/issue_get_bloc.dart';
import 'package:c_space/feature/debt/presentation/pages/debt_widget.dart';
import 'package:c_space/feature/problems/presentation/pages/issue_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssuePage extends StatelessWidget {
  IssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueGetBloc, IssueGetState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text('Issue list'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade400,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: Colors.purple.shade200,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        tabs: [
                          Text(
                            'Issue',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Debtors',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    IssueWidget(),
                    DebtPage()
                  ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
