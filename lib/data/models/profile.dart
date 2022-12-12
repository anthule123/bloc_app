// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  String id = '';
  String name = 'Unknown';
  double weight = 0;
  Profile({
    this.id = 'Unknown',
    this.name = 'Unknown',
    this.weight = 0,
  });

  Profile clone() {
    return Profile(
      id: id,
      name: name,
      weight: weight,
    );
  }
}
