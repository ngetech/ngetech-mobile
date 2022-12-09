import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/forum/data/models/forum_discussion.dart';
import 'package:ngetech/feautures/homepage/presentation/page/main_page.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';

class CreateDiscussionPage extends StatefulWidget {
  const CreateDiscussionPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateDiscussionPageState();
}

class _CreateDiscussionPageState extends State<CreateDiscussionPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? _title;
  String? _content;

  @override
  Widget build(BuildContext context) {
    final request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );

    return Scaffold(
      backgroundColor: BaseColors.charcoal,
      appBar: AppBar(
        backgroundColor: BaseColors.charcoal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (() {
            Navigator.pop(context);
          }),
        ),
        title: const Text(
          'Create Discussion',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _title = value;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _title = value;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Title can not be empty!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: TextFormField(
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Content',
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _content = value;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _content = value;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Username can not be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      final response = await request.postJson(
                        EndPoints.addForumDiscussion,
                        convert.jsonEncode(
                          {
                            'title': _title,
                            'content': _content,
                          },
                        ),
                      );
                      if (!response['error']) {
                        if (!mounted) return;
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(
                              setPageAtIndex: 4,
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Insert a title & content!',
                          style: TextStyle(
                            color: BaseColors.white,
                          ),
                        ),
                        backgroundColor: BaseColors.warning,
                      ));
                    }
                  },
                  child: const Text('Create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
