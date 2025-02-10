import 'package:challenge_moteis_go/core/ui/theme_extensions.dart';
import 'package:flutter/material.dart';

class PeriodComponent extends StatelessWidget {
  final String formattedTime;
  final double price;
  final VoidCallback onPressed;

  const PeriodComponent({
    super.key,
    required this.formattedTime,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
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
                formattedTime,
                style: context.titleStyle,
              ),
              Text(
                'R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}',
                style: context.titleStyle,
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: suite?.periods?.map(
                                        (period) {
                                          return Container(
                                            width: MediaQuery.of(context).size.width,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  spacing: 5,
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
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.chevron_right,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ).toList() ??
                                      [
                                        Text('Nenhum periodo disponivel'),
                                      ],
                                ),


*/
