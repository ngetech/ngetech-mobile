import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/authentication/presentation/pages/login_page.dart';
import 'package:ngetech/feautures/homepage/presentation/page/main_page.dart';
import 'package:ngetech/feautures/post_tech/presentation/widgets/sliver_post_tech_delegate.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';

import '../../data/models/post_tech.dart';

class PostTechPersistentHeader extends StatefulWidget {
  const PostTechPersistentHeader({Key? key}) : super(key: key);

  @override
  State<PostTechPersistentHeader> createState() =>
      _PostTechPersistentHeaderState();
}

class _PostTechPersistentHeaderState extends State<PostTechPersistentHeader> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );
    final GlobalKey<FormState> key = GlobalKey<FormState>();

    String? title;
    String? description;

    return SliverPersistentHeader(
      delegate: SliverPostTechDelegate(
        child: Container(
          color: BaseColors.charcoal,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 12),
            child: ElevatedButton(
              onPressed: () => request.isLoggedIn()
                  ? _showPostDialog(
                      context,
                      screenSize,
                      key,
                      title,
                      description,
                      request,
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
              child: Text(request.isLoggedIn()
                  ? 'Bagikan pengalaman anda'
                  : 'Sign In dulu yuk'),
            ),
          ),
        ),
      ),
      pinned: true,
    );
  }

  _showPostDialog(
      BuildContext context,
      Size screenSize,
      GlobalKey<FormState> key,
      String? title,
      String? description,
      CookieRequest request) async {
    showDialog(
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
                      key: key,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 24, 0, 8),
                              child: Text('Title'),
                            ),
                            TextFormField(
                              onChanged: (String? value) {
                                setState(() {
                                  title = value;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  title = value;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Title can not be empty!';
                                }
                                return null;
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 12, 0, 8),
                              child: Text('Description'),
                            ),
                            TextFormField(
                              maxLines: 16,
                              onChanged: (String? value) {
                                setState(() {
                                  description = value;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  description = value;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Description can not be empty!';
                                }
                                return null;
                              },
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
                        onPressed: () async {
                          if (key.currentState!.validate()) {
                            PostTech post = PostTech(
                              title: title,
                              description: description,
                            );
                            final response = await request.postJson(
                              EndPoints.addPostTech,
                              convert.jsonEncode(
                                  {'title': title, 'description': description}),
                            );
                            if (!response['error']) {
                              if (!mounted) return;
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MainPage(setPageAtIndex: 3),
                                ),
                              );
                            }
                          }
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
    );
  }
}
