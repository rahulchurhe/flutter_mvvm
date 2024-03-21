import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/provider.dart';

class APIListScreen extends ConsumerWidget {
  const APIListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Demo"),
      ),
      body: ref.watch(userListDataProvider).when(data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final post = data[index];
            return ListTile(
              title: Text(post.id.toString()),
              subtitle: Text(post.body),
            );
          },
        );
      }, error: (error, stackTrace) {
        return Text(error.toString());
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
