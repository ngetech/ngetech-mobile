import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/feautures/forum/data/data_source/forum_reply_remote_data_source.dart';
import 'package:ngetech/feautures/forum/data/models/forum_discussion.dart';
import 'package:ngetech/feautures/forum/presentation/pages/discussion_page.dart';
import 'package:provider/provider.dart';
import 'package:ngetech/services/cookies_request.dart';

class BottomNavbarForm extends StatefulWidget {
  final ForumDiscussion discussion;

  const BottomNavbarForm({
    Key? key,
    required this.discussion,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavbarFormState();
}

class _BottomNavbarFormState extends State<BottomNavbarForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? _content;

  @override
  Widget build(BuildContext context) {
    final CookieRequest request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Reply',
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
                      return 'Reply content can not be empty!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    final response = await request.postJson(
                      EndPoints.addForumReply(widget.discussion.id!),
                      convert.jsonEncode(
                        {
                          'content': _content,
                        },
                      ),
                    );
                    if (!response['error']) {
                      if (!mounted) return;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiscussionPage(
                            discussion: widget.discussion,
                          ),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Reply'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
