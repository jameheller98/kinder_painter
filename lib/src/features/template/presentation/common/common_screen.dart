import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:master_source_flutter/src/features/template/domain/common.dart';
import 'package:master_source_flutter/src/features/template/presentation/common_controller.dart';

class CommonScreen extends ConsumerStatefulWidget {
  const CommonScreen({super.key});

  @override
  ConsumerState<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends ConsumerState<CommonScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Common>> state = ref.watch(commonControllerProvider);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  ref.read(commonControllerProvider.notifier).addCommon(),
              child: const Text('Add common'),
            ),
            state.when(
              data: (data) => Column(
                children: data
                    .map(
                      (common) => TextButton(
                          onPressed: () => ref
                              .read(commonControllerProvider.notifier)
                              .deleteCommon(common),
                          child: Text(common.id)),
                    )
                    .toList(),
              ),
              error: (error, stack) => Text(error.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
