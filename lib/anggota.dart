import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';

class Anggota extends StatefulWidget {
  @override
  _AnggotaState createState() => _AnggotaState();
}

class _AnggotaState extends State<Anggota>
    with SingleTickerProviderStateMixin, RestorationMixin {
  TabController? _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController!.index = tabIndex.value;
  }

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 12,
      vsync: this,
    );
    _tabController!.addListener(() {
      // When the tab controller's value is updated, make sure to update the
      // tab index value, which is state restorable.
      setState(() {
        tabIndex.value = _tabController!.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Muhammad Ikwal Ramadhan',
      'Sahal Asshudaish',
    ];
    final fotos = [
      'images/model1.jpg',
      'images/model2.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            final navigator = Navigator.of(context);
            await Future.delayed(Duration.zero);
            navigator.push(MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        backgroundColor: Colors.orange[500],
        automaticallyImplyLeading: false,
        title: Text('Nama Anggota Kelompok'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final foto in fotos)
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(foto),
                radius: 150,
              ),
            ),
        ],
      ),
    );
  }
}
