import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/Core/di/injection_container.dart';
import 'package:petfinder_app/Core/theme/styles.dart';
import 'package:petfinder_app/Features/Home/data/repo/cat_repository.dart';
import 'package:petfinder_app/Features/Home/presentation/cubits/cat_cubit.dart';
import 'package:petfinder_app/Features/Home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:petfinder_app/Features/Home/presentation/widgets/categories_bar.dart';
import 'package:petfinder_app/Features/Home/presentation/widgets/pet_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatCubit(sl<CatRepository>())..getCats(),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text('Find Your Forever Pet',
                    style: AppTextStyles.font24Black700),
                SizedBox(height: 20.h),
                const CategoriesBar(),
                SizedBox(height: 20.h),
                Expanded(
                  child: BlocBuilder<CatCubit, CatState>(
                    builder: (context, state) {
                      if (state is CatLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CatSuccess) {
                        return ListView.separated(
                          itemCount: state.cats.length,
                          separatorBuilder: (_, __) => SizedBox(height: 10.h),
                          itemBuilder: (context, index) {
                            final cat = state.cats[index];
                            print('#############${cat.imageUrl}');
                            return PetCard(
                              image: cat.imageUrl,
                              name: cat.name,
                              gender: cat.origin,
                              age: '${cat.lifeSpan} years lifespan',
                              distance: 'Bengal breed',
                            );
                          },
                        );
                      } else if (state is CatError) {
                        return Center(
                            child: Text('Error: ${state.message}',
                                style: AppTextStyles.font16Description400));
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
