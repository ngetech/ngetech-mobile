part of '_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final CookieRequest request;
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      request = Provider.of<CookieRequest>(
        context,
        listen: false,
      );
    });
    Future.delayed(
      const Duration(
        seconds: 4,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => request.getIsNewInstallStatus() == false
                ? const MainPage()
                : const OnBoardingPage()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/ngetech_text_logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: BaseColors.charcoal,
      ),
    );
  }
}
