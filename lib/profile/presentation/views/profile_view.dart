import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop/profile/data/model/profile_model.dart';
import 'package:laptop/profile/presentation/manager/cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  // final ProfileModel profile;

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          ProfileModel profile = state.profileModel;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 100),
                // الصورة الشخصية
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(profile.image),
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(height: 16),

                // الاسم
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(profile.email, style: TextStyle(color: Colors.white)),
                const SizedBox(height: 20),

                // باقي البيانات
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      _buildInfoTile(
                        Icons.phone,
                        "Phone Number",
                        profile.phone,
                      ),
                      _buildInfoTile(Icons.badge, "ID", profile.id),
                      _buildInfoTile(Icons.person, "Gender", profile.gender),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProfileFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}
