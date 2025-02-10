import 'package:challenge_moteis_go/core/ui/theme_extensions.dart';
import 'package:flutter/material.dart';

class SuiteComponent extends StatelessWidget {
  final String stringImage;
  final String stringName;
  final VoidCallback onTap;

  const SuiteComponent({
    super.key,
    required this.stringImage,
    required this.stringName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                stringImage,
                height: 200,
                width: 320,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              stringName,
              style: context.titleStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}


/*

Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: GestureDetector(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            suite?.photos?.first ?? 'Sem foto',
                                            height: 200,
                                            width: 320,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          suite?.name ?? 'Suite sem nome',
                                          style: context.titleStyle,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      List<String>? morePhotos = suite?.photos;
                                      Navigator.of(context)
                                          .pushNamed(Routes.morePhotos, arguments: {'photos': morePhotos});
                                    },
                                  ),
                                ),


*/