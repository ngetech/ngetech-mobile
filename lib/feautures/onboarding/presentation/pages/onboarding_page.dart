part of '_pages.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  bool onLastPage = false;
  final PageController _controller = PageController();

  final List<OnBoardingItem> items = const [
    OnBoardingItem(
      title: 'Siapa Kami?',
      imageUrl: 'assets/images/ngetech_banner.png',
      description:
          'Kami adalah segenap hal yang berakitan dengan teknologi yang akan membantu anda melewati transformasi digital di masa kini',
    ),
    OnBoardingItem(
      title: 'Memecahkan Gaps',
      imageUrl: 'assets/images/breaking_tech_gaps.png',
      description:
          'Kami hadir di dalam dunia yang terdistraksi dengan teknologi untuk memecahkan gap pada skill digital',
    ),
    OnBoardingItem(
      title: 'Sumber Daya\nBerkualitas',
      imageUrl: 'assets/images/providing_reseources.png',
      description:
          'Kami akan menyediakan anda sumber daya yang memadai berupa informasi terkini dan forum diskusi yang berkualitas',
    ),
    OnBoardingItem(
      title: 'Transformasi Digital',
      imageUrl: 'assets/images/help_through_transformation.png',
      description:
          'Kami sadar akan tangkasnya permigrasian teknologi di masa kini, untuk itu kami hadir membantu Anda untuk melewatinya',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              alignment: const Alignment(0, -.9),
              child: Image.asset(
                'assets/images/ngetech_text_logo.png',
                scale: 5.5,
              ),
            ),
            PageView(
              onPageChanged: (pageIndex) {
                setState(() {
                  onLastPage = (pageIndex == items.length - 1);
                });
              },
              controller: _controller,
              children: items,
            ),
            Container(
              alignment: const Alignment(0, .8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: BaseColors.blue,
                      ),
                    ),
                    onTap: () {
                      _controller.jumpToPage(items.length - 1);
                    },
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: items.length,
                  ),
                  onLastPage
                      ? GestureDetector(
                          child: const Text(
                            'Done',
                            style: TextStyle(
                              color: BaseColors.blue,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          },
                        )
                      : GestureDetector(
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              color: BaseColors.blue,
                            ),
                          ),
                          onTap: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        )
                ],
              ),
            )
          ],
        ),
        backgroundColor: BaseColors.charcoal,
      ),
    );
  }
}
