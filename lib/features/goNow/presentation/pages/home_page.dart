import 'package:challenge_moteis_go/core/ui/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/gonow_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<GonowCubit>().getGoNow();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xffD50000),
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(30),
            fillColor: Colors.white,
            selectedColor: Colors.white,
            constraints: BoxConstraints(
              minHeight: 30,
              minWidth: 110,
            ),
            isSelected: [_selectedIndex == 0, _selectedIndex == 1],
            onPressed: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              Text('Ir agora', style: TextStyle(color: _selectedIndex == 0 ? Colors.black : Colors.white)),
              Text(
                'Ir outro dia',
                style: TextStyle(color: _selectedIndex == 1 ? Colors.black : Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 16,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(
              20,
            ),
          ),
        ),
        child: BlocBuilder<GonowCubit, GonowState>(
          builder: (context, state) {
            if (state is GonowLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GonowLoaded) {
              return ListView.builder(
                itemCount: state.resultEntity.data?.motels?.length,
                itemBuilder: (context, index) {
                  final motel = state.resultEntity.data?.motels?[index];
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                motel?.logo ?? 'Sem logotipo',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Text(motel?.nameFantasy ?? '',
                                style: context.titleStyle.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        Text(
                          '${motel?.distance}km - ${motel?.neighborhood}',
                          style: context.titleStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '${motel?.quantityReviews} avaliações',
                          style: context.titleStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    subtitle: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height,
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: motel?.suites?.map(
                              (suite) {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 5,
                                        ),
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image.network(
                                                suite.photos?.first ?? 'Sem foto',
                                                height: 200,
                                                width: 320,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              suite.name ?? 'Suite sem nome',
                                              style: context.titleStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 320,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          children: suite.categoryItens?.take(6).map((category) {
                                                return Image.network(
                                                  '${category.icon}',
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.contain,
                                                );
                                              }).toList() ??
                                              [],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: suite.periods?.map(
                                                (period) {
                                                  return Container(
                                                    constraints: BoxConstraints(maxWidth: 300),
                                                    margin: const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 5,
                                                    ),
                                                    padding: EdgeInsets.all(20),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              '${period.formattedTime}',
                                                              style: context.titleStyle,
                                                            ),
                                                            Text(
                                                              'R\$ ${period.price?.toStringAsFixed(2).replaceAll('.', ',')}',
                                                              style: context.titleStyle,
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                            alignment: AlignmentDirectional.centerEnd,
                                                            child: IconButton(
                                                                onPressed: () {}, icon: Icon(Icons.chevron_right)))
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList() ??
                                              [
                                                Text('Nenhum periodo disponivel'),
                                              ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).toList() ??
                            [],
                      ),
                    ),
                  );
                },
              );
            } else if (state is GonowError) {
              return Center(child: Text('Erro: ${state.msgError}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
