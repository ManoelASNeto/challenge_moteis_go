import '../../../../core/routes/routes.dart';
import '../../../../core/ui/theme_extensions.dart';
import '../widgets/period_component.dart';
import '../widgets/suite_component.dart';
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
      body: BlocBuilder<GonowCubit, GonowState>(
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
                        spacing: 10,
                        children: [
                          ClipOval(
                            child: Image.network(
                              motel?.logo ?? 'Sem logotipo',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Text(
                            motel?.nameFantasy ?? '',
                            style: context.titleStyle.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
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
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  subtitle: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: motel?.suites?.length,
                        itemBuilder: (context, index) {
                          var suite = motel?.suites?[index];
                          return SingleChildScrollView(
                            child: Column(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SuiteComponent(
                                  stringImage: suite?.photos?.first ?? 'Sem foto',
                                  stringName: suite?.name ?? 'Suite sem nome',
                                  onTap: () {
                                    List<String>? morePhotos = suite?.photos;
                                    Navigator.of(context).pushNamed(
                                      Routes.morePhotos,
                                      arguments: {'photos': morePhotos},
                                    );
                                  },
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: suite?.categoryItens?.take(6).map((category) {
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: suite?.periods?.map(
                                        (period) {
                                          return PeriodComponent(
                                            formattedTime: period.formattedTime ?? 'Horário indisponível',
                                            price: period.price ?? 0.0,
                                            onPressed: () {},
                                          );
                                        },
                                      ).toList() ??
                                      [
                                        const Text('Nenhum período disponível'),
                                      ],
                                )
                              ],
                            ),
                          );
                        }),
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
    );
  }
}
