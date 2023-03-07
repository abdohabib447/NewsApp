import 'package:flutter/material.dart';
import 'package:news_app/ui/tabs_items/tabs_item.dart';

import 'news_item_content.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory = null;

  List<Category> item = [
    Category(
        id: 'sports',
        imageLogo: 'assets/images/ball.png',
        imageTitle: 'sport',
        backColor: Color(0xffC91C22)),
    Category(
        id: 'general',
        imageLogo: 'assets/images/Politics.png',
        imageTitle: 'General',
        backColor: Color(0xff003E90)),
    Category(
        id: 'health',
        imageLogo: 'assets/images/health.png',
        imageTitle: "Health",
        backColor: Color(0xffED1E79)),
    Category(
        id: 'business',
        imageLogo: 'assets/images/bussines.png',
        imageTitle: 'Business',
        backColor: Color(0xfffCF7E48)),
    Category(
        id: 'technology',
        imageLogo: 'assets/images/environment.png',
        imageTitle: 'Technology',
        backColor: Color(0xff4882CF)),
    Category(
        id: 'science',
        imageLogo: 'assets/images/science.png',
        imageTitle: 'Science',
        backColor: Color(0xffF2D352)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.13,
        title: Text(
          selectedCategory == null ? "News App" : selectedCategory!.imageTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedCategory = null;
                  });
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 26,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Setting',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: selectedCategory == null
          ? Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(12),
                    child: const Text('Pick your category of insert ')),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (_, index) {
                      return NewsItem(
                        index: index,
                        category: item[index],
                        function: viewItemNews,
                      );
                    },
                    itemCount: item.length,
                  ),
                ),
              ],
            )
          : NewsItemContent(category: selectedCategory!),
    );
  }

  viewItemNews(Category _selectedCategory) {
    setState(() {
      selectedCategory = _selectedCategory;
    });
  }
}
