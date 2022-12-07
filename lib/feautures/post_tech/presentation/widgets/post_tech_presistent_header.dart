import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/homepage/presentation/page/main_page.dart';
import 'package:ngetech/feautures/post_tech/presentation/widgets/sliver_post_tech_delegate.dart';

class PostTechPersistentHeader extends StatelessWidget {
  const PostTechPersistentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    return SliverPersistentHeader(
      delegate: SliverPostTechDelegate(
        child: Container(
          color: BaseColors.charcoal,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 12),
            child: ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: BaseColors.charcoal,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  content: Builder(
                    builder: (context) {
                      return SizedBox(
                        height: screenSize.height * 0.75,
                        width: screenSize.width,
                        child: Column(
                          children: [
                            Expanded(
                              child: Form(
                                key: _key,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(0, 24, 0, 8),
                                        child: Text('Title'),
                                      ),
                                      TextFormField(),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(0, 12, 0, 8),
                                        child: Text('Description'),
                                      ),
                                      TextFormField(
                                        maxLines: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MainPage(setPageAtIndex: 3),
                                      ),
                                    );
                                  },
                                  child: const Text('Go Public'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              child: const Text('Bagikan pengalaman anda'),
            ),
          ),
        ),
      ),
      pinned: true,
    );
  }
}
