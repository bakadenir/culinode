/// Satu sumber data profil user yang dipakai di semua screen.
/// Ganti dengan state management (Provider/Riverpod) saat integrasi backend.
class UserProfile {
  UserProfile._();
  static final UserProfile instance = UserProfile._();

  String nama  = 'Deni Romadhon';
  String email = 'bakadenir@gmail.com';
  String? foto = 'assets/photo.webp'; // null = tampilkan ikon default
}
