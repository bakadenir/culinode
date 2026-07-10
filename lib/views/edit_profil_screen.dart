import 'package:flutter/material.dart';
import '../core/theme/colors.dart';
import '../core/theme/typography.dart';
import '../core/theme/shadows.dart';
import '../core/user_profile.dart';
import '../core/widgets/form_field.dart';
import '../core/widgets/primary_button.dart';

class EditProfilScreen extends StatefulWidget {
  final String nama;
  final String email;

  const EditProfilScreen({
    super.key,
    required this.nama,
    required this.email,
  });

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  late TextEditingController _namaController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.nama);
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────────────
            _buildHeader(),

            // ── Scrollable content ────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 36),

                    // ── Avatar dengan overlay edit ─────────────────────────────
                    _buildAvatar(),

                    const SizedBox(height: 36),

                    // ── Form: Nama ────────────────────────────────────────────
                    Center(
                      child: AppFormField(
                        label: 'Nama',
                        controller: _namaController,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ── Form: Email ───────────────────────────────────────────
                    Center(
                      child: AppFormField(
                        label: 'Email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),

                    const SizedBox(height: 36),

                    // ── Tombol Simpan ─────────────────────────────────────────
                    PrimaryButton(
                      text: 'Simpan Perubahan',
                      onPressed: () {
                        // Simpan perubahan data
                        Navigator.pop(context);
                      },
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Header: back arrow + judul tengah ────────────────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          // Tombol back
          GestureDetector(
            onTap: () => Navigator.pop(context),
            behavior: HitTestBehavior.opaque,
            child: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
                color: AppColors.text1,
              ),
            ),
          ),
          // Judul tengah
          Expanded(
            child: Text(
              'Edit Profil',
              textAlign: TextAlign.center,
              style: AppTextStyles.h4.copyWith(color: AppColors.text1),
            ),
          ),
          // Spacer untuk balance back button
          const SizedBox(width: 28),
        ],
      ),
    );
  }

  // ── Avatar lingkaran + tombol edit kecil ─────────────────────────────────
  Widget _buildAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 56,
          backgroundColor: AppColors.lightGrey1,
          backgroundImage: UserProfile.instance.foto != null
              ? AssetImage(UserProfile.instance.foto!)
              : null,
          child: UserProfile.instance.foto == null
              ? const Icon(Icons.person_rounded, size: 60, color: AppColors.text2)
              : null,
        ),
        // Tombol edit kecil di pojok kanan bawah
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: AppShadows.card,
            ),
            child: const Icon(
              Icons.edit_rounded,
              size: 18,
              color: AppColors.text2,
            ),
          ),
        ),
      ],
    );
  }
}
