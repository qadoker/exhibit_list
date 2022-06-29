import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal_task/foundation/models/remote_models/exhibit_model.dart';
import 'package:techincal_task/foundation/state_logic/cubits/exhibit_list/exhibit_list_cubit.dart';
import 'package:techincal_task/presentation/widgets/common/exhibit_item.dart';

class ExhibitListScreen extends StatefulWidget {
  const ExhibitListScreen({Key? key}) : super(key: key);

  @override
  State<ExhibitListScreen> createState() => _ExhibitListScreenState();
}

class _ExhibitListScreenState extends State<ExhibitListScreen> {
  final _exhibitCubit = ExhibitListCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _exhibitCubit..getExhibits(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<ExhibitListCubit, ExhibitListState>(
      listener: (context, state) {
        if (state is ExhibitListAlert) {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("Dialog"),
                content: Text("There was a problem"),
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state is ExhibitListLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue.shade900,
            ),
          );
        }
        if (state is ExhibitListLoaded) {
          return _buildExhibitList(state.exhibits);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildExhibitList(List<Exhibit> exhibits) {
    return RefreshIndicator(
      color: Colors.blue.shade900,
      onRefresh: () async {
        await _exhibitCubit.getExhibits();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: exhibits.length,
        itemBuilder: (context, index) {
          final exhibit = exhibits[index];

          return ExhibitItem(exhibit: exhibit);
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        "Exhibit List",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
