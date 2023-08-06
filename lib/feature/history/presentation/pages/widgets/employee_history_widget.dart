import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/feature/history/presentation/bloc/client_bloc/client_bloc.dart';
import 'package:c_space/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class EmployeeHistoryWidget extends StatelessWidget {
  const EmployeeHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,

          ),
          body: sl<LocalEmployeeSource>().box.isEmpty ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Lottie.asset(
                    'assets/animation/empty_animation.json',
                    repeat: false,
                    fit: BoxFit.cover,
                  ),
                ),
                Text('Нету сотрудников', style: TextStyle(fontSize: 26),)
              ],
            ),
          ) : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        String name = sl<LocalEmployeeSource>().box.getAt(index);
                        return Card(
                          child: ListTile(
                            title: Text(
                              name,
                            ),
                            onTap: () {
                              print(name);
                              context
                                  .read<ClientBloc>()
                                  .add(EmployeeGetTime(name: name));
                            },
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(
                            height: 5,
                          ),
                      itemCount: sl<LocalEmployeeSource>().box.length,),
                ),
        );
      },
    );
  }
}
