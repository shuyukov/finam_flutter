import 'package:finam_flutter/bloc/posts_bloc.dart';
import 'package:finam_flutter/pages/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Timeline extends StatelessWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: const Text(
          "Timeline",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: Colors.grey,
        onRefresh: () async {
          BlocProvider.of<PostsBloc>(context).add(LoadingPostsEvent());
        },
        child: SafeArea(
          child: BlocBuilder<PostsBloc, PostsState>(
            bloc: context.read<PostsBloc>()..add(LoadingPostsEvent()),
            builder: (context, state) {
              if (state is LoadingPostsState) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                  ),
                );
              }
              if (state is LoadedPostsState) {
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(20),
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Post(state.data, index))),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(223, 223, 223, 1),
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            (state.data[index].image != "self" &&
                                    state.data[index].image != "default")
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child:
                                        Image.network(state.data[index].image!),
                                  )
                                : const SizedBox(),
                            Text(state.data[index].title),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 10),
                );
              }
              return const Text("some text");
            },
          ),
        ),
      ),
    );
  }
}
