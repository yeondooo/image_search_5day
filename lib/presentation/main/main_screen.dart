import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_5day/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색 앱'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: '검색어를 입력하세요',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      viewModel.fetchImages(controller.text);
                    },
                  ),
                ),
              ),
              if (state.photos.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('검색 결과는 조회수 순으로 10개가 정렬됩니다.'),
                ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final photo = state.photos[index];
                    return Hero(
                      tag: photo.id,
                      child: GestureDetector(
                        onTap: () {
                          context.push('/detail', extra: photo);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            photo.webformatURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
