import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/forum/data/models/forum_discussion.dart';
import 'package:ngetech/feautures/forum/data/models/forum_reply.dart';
import 'package:ngetech/feautures/forum/presentation/pages/discussion_page.dart';
import 'package:provider/provider.dart';
import 'package:ngetech/services/cookies_request.dart';

class BottomNavbarForm extends StatefulWidget {
  final ForumDiscussion discussion;
  final ForumReply? replyingTo;
  final Function() cancelReplyingTo;

  const BottomNavbarForm({
    Key? key,
    required this.discussion,
    required this.replyingTo,
    required this.cancelReplyingTo,
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
      child: request.isLoggedIn()
          ? Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.replyingTo != null) ...[
                      Row(
                        children: [
                          Text(
                            'Replying to ',
                            style: TextStyle(
                              color: BaseColors.charcoal.shade600,
                            ),
                          ),
                          Text(
                            '@${widget.replyingTo!.user}',
                            style: const TextStyle(
                              color: BaseColors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            splashColor: Colors.transparent,
                            // highlightColor: Colors.transparent,
                            splashRadius: 12,
                            color: BaseColors.charcoal.shade600,
                            // alignment: AlignmentDirectional.centerEnd,
                            onPressed: () {
                              widget.cancelReplyingTo();
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                    Row(
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
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Join the discussion!'),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: (() {}),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
    );
  }
}
