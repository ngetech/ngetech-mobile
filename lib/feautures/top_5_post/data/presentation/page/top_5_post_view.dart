import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/authentication/presentation/pages/login_page.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';
import 'package:ngetech/feautures/top_5_post/data/data_source/top5_remote_data_source.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';

import '../../../../post_detail/presentation/page/post_tech_detail.dart';

class Top5PostPage extends StatefulWidget {
  const Top5PostPage({super.key});

  @override
  State<Top5PostPage> createState() => _Top5PostPageState();
}

class _Top5PostPageState extends State<Top5PostPage> {
  @override
  Widget build(BuildContext context) {
    final request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );
    Top5RemoteDataSource dataSource = Top5RemoteDataSource(
      request: request,
    );

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Center(
                    child: LineIcon(
                      LineIcons.trophy,
                      color: BaseColors.blue,
                      size: 48,
                    ),
                  ),
                  const Text(
                    "TOP 5 POST",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: BaseColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text.rich(
                    TextSpan(
                      text:
                          "Kami menawarkan anda 5 informasi terhangat mengenai teknologi yang sedang ",
                      style: TextStyle(
                        color: BaseColors.charcoal.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: "demanding ",
                          style: TextStyle(
                            color: BaseColors.charcoal.shade600,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: "di masa kini",
                          style: TextStyle(
                            color: BaseColors.charcoal.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: FutureBuilder(
                  future: dataSource.fetchTop5Post(),
                  builder: (context, AsyncSnapshot<List<PostTech>> snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text('Loading...'),
                      );
                    } else if (snapshot.data!.isEmpty) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/post_tech.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const Text(
                                'Yuk Bagikan Pengalamanmu !',
                                style: TextStyle(
                                  color: BaseColors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.only(bottom: 8),
                        itemCount: snapshot.data!.length < 5
                            ? snapshot.data!.length
                            : 5,
                        itemBuilder: (context, index) {
                          snapshot.data!.sort();
                          PostTech post = snapshot.data![index];
                          return Card(
                            color: BaseColors.charcoal.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(22),
                              child: ListTile(
                                title: Text(
                                  post.title!,
                                  style: const TextStyle(
                                      color: BaseColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                leading: Text(
                                  "#${index + 1}",
                                  style: TextStyle(
                                      color: BaseColors.charcoal.shade600,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                trailing: GestureDetector(
                                  child: LineIcon(LineIcons.angleRight),
                                  onTap: () {
                                    if (request.isLoggedIn()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PostTechDetail(post: post),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(TextSpan(
                                        text: "Published by ",
                                        style: TextStyle(
                                            color: BaseColors.charcoal.shade600,
                                            fontSize: 13),
                                        children: <InlineSpan>[
                                          TextSpan(
                                              text: "@${post.username!}",
                                              style: const TextStyle(
                                                color: BaseColors.blue,
                                                fontSize: 13,
                                              ))
                                        ])),
                                    const Padding(padding: EdgeInsets.all(3)),
                                    Text.rich(
                                      TextSpan(
                                        text: post.likes!.length.toString(),
                                        style: const TextStyle(
                                          color: BaseColors.blue,
                                          fontSize: 12,
                                        ),
                                        children: const <InlineSpan>[
                                          TextSpan(
                                            text: " people like this post !",
                                            style: TextStyle(
                                              color: BaseColors.blue,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          )),
      backgroundColor: BaseColors.charcoal,
    );
  }
}
