class WalkthroughContent {
  String image;
  String text;
  String description;

  WalkthroughContent({
    required this.image,
    required this.text,
    required this.description,
  });
}

List<WalkthroughContent> contents = [
  WalkthroughContent(
    image: "assets/images/Illustration1.png",
    text: 'Create Your Own Plate',
    description:
    'Create unforgettable memories with our unique feature to curate your favorite cuisines and food, tailored to your special occasion.',
  ),
  WalkthroughContent(
    image: "assets/images/Illustration2.png",
    text: 'Exquisite Catering',
    description:
    'Experience culinary artistry like never before with our innovative and exquisite cuisine creations',
  ),
  WalkthroughContent(
    image: "assets/images/Illustration3.png",
    text: 'Personal Order\n Executive',
    description:
    'Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.',
  ),
];