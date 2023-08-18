import 'package:flutter/material.dart';
import 'package:flutter_application_1/dio/api_provider.dart';

import '../models/Success_Stories.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  SuccsessStoriesModel? successStories;
  bool isLoading = true;
  getData() async {
    successStories = await ApiProvider().getSuccessStories();
    isLoading = false;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 31, 29, 29),
          // elevation: 0,
          // title: Row(
          //   children: [
          //     CircleAvatar(
          //       radius: 20,
          //       backgroundColor: const Color.fromARGB(255, 100, 100, 100),
          //       child: IconButton(
          //         onPressed: () {},
          //         icon: const Icon(Icons.menu),
          //         color: Colors.white,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     const Text(
          //       "Chats",
          //       style:
          //           TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //   ],
          // ),
          // actions: [
          //   CircleAvatar(
          //     radius: 18,
          //     backgroundColor: const Color.fromARGB(255, 100, 100, 100),
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.camera_alt,
          //         color: Colors.white,
          //         size: 20,
          //       ),
          //     ),
          //   ),
          //   const SizedBox(
          //     width: 10,
          //   ),
          //   CircleAvatar(
          //       radius: 18,
          //       backgroundColor: const Color.fromARGB(255, 100, 100, 100),
          //       child: IconButton(
          //           onPressed: () {},
          //           icon: const Icon(
          //             Icons.edit,
          //             color: Colors.white,
          //             size: 20,
          //           ))),
          //   const SizedBox(
          //     width: 10,
          //   ),
          // ],
        ),
        body: Container(
          color: const Color.fromARGB(255, 4, 4, 4),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) =>
                      buildChat(singleStory: successStories!.model![index]),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: successStories!.model!.length),
          // child: Padding(
          //   padding: const EdgeInsets.all(20),
          // child: Column(
          //   children: [
          // Container(`
          //   decoration: BoxDecoration(
          //       color: const Color.fromARGB(255, 100, 100, 100),
          //       borderRadius: BorderRadius.circular(25)),
          //   child: const Row(
          //     children: [
          //       Padding(
          //           padding: EdgeInsets.all(6),
          //           child: Icon(
          //             Icons.search,
          //             color: Colors.white,
          //             size: 16,
          //           )),
          //       SizedBox(
          //         width: 5,
          //       ),
          //       Text(
          //         "Search",
          //         style: TextStyle(color: Colors.white),
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // const SizedBox(
          //   height: 120,
          // child: ListView.separated(
          //   shrinkWrap: true,
          //   itemBuilder: (context, index) => buildOnline(),
          //   separatorBuilder: (context, indext) => const SizedBox(
          //     width: 10,
          //   ),
          //   itemCount: 10,
          //   scrollDirection: Axis.horizontal,
          //)
          // ),
          // isLoading
          //     ? const Center(child: CircularProgressIndicator())
          //     : ListView.separated(
          //         itemBuilder: (context, index) => buildChat(
          //             singleStory: successStories!.model![index]),
          //         separatorBuilder: (context, index) => const Divider(),
          //         itemCount: successStories!.model!.length)
          // ],
          //   ),
          // )
        ));
  }
}

Widget buildOnline() => const SizedBox(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/OIP.nXnr_1sGr2gchAm-Jn9KwQHaEK?pid=ImgDet&rs=1"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2, right: 3),
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Ziad Nabil",
          style: TextStyle(color: Colors.white, fontSize: 14),
          maxLines: 2,
        )
      ],
    ));

Widget buildChat({required Model singleStory}) => Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 28,
              child: Text(singleStory.id.toString()),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 2, right: 3),
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                singleStory.title.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Row(
              children: [
                Text(
                  singleStory.createdAt.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                // const Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 10),
                //     child: CircleAvatar(
                //       radius: 1,
                //       backgroundColor: Colors.white,
                //     )),
                // Text(
                //   "5:30 PM",
                //   style: TextStyle(color: Colors.white),
                // )
              ],
            )
          ],
        )
      ],
    );
