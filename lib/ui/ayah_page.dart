import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/contants.dart';
import 'package:flutter_ahlul_quran_app/cubit/ayah/ayah_cubit.dart';
import 'package:flutter_ahlul_quran_app/data/model/surah_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AyahPage extends StatefulWidget {
  const AyahPage({Key? key, required this.surah}) : super(key: key);

  final SurahModel surah;

  @override
  State<AyahPage> createState() => _AyahPageState();
}

class _AyahPageState extends State<AyahPage> {
  @override
  void initState() {
    context.read<AyahCubit>().getDetailSurah(widget.surah.nomor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ' Surah ${widget.surah.namaLatin}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.primary,
          centerTitle: true,
        ),
        body: BlocBuilder<AyahCubit, AyahState>(builder: (context, state) {
          if (state is AyahLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AyahLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final ayah = state.detail.ayat[index];

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Text(
                        '${ayah.nomor}',
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                    title: Text(
                      '${ayah.ar}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('${ayah.idn}'),
                  ),
                );
              },
              itemCount: state.detail.ayat.length,
            );
          }

          if (state is AyahError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Center(
            child: Text('No Data'),
          );
        }));
  }
}
