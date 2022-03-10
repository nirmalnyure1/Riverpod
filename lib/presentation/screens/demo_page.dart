import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/application/states/demostate.dart';
import 'package:riverpod_example/provider.dart';
import 'package:riverpod_example/main.dart';

class DemoPage extends ConsumerWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("riverpod example"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("hello");
          reload(ref);
        },
        child: Icon(Icons.replay),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final provider = ref.watch(demoProvider);
            if (provider is DemoInitial) {
              return TextButton(
                onPressed: () {
                  ref.watch(demoProvider.notifier).getData();
                },
                child: const Text("Submit"),
              );
            } else if (provider is DemoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider is DemoLoaded) {
              return HomeContent(provider: provider);
            } else {
              return TextButton(
                onPressed: () {},
                child: const Text("Submit"),
              );
            }
          },
        ),
      ),
    );
  }

  reload(WidgetRef ref) {
    debugPrint("helo");
    ref.read(demoProvider.notifier).getData();
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final DemoLoaded provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Image.network(
          "${provider.demoObj.message}",
          fit: BoxFit.contain,
          height: 500,
          width: 500,
        )),
        Text(
          "${provider.demoObj.status}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
