class UserSelectionModel {
  final String title;
  final String image;

  UserSelectionModel({
    required this.title,
    required this.image,
  });
}

List<UserSelectionModel> userSelectionModel = [
  UserSelectionModel(
    title: 'Rock',
    image: 'assets/images/rock.gif',
  ),
  UserSelectionModel(
    title: 'Paper',
    image: 'assets/images/paper.gif',
  ),
  UserSelectionModel(
    title: 'Scissors',
    image: 'assets/images/scissor.gif',
  ),
];
