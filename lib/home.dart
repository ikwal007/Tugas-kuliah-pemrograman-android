import 'package:flutter/material.dart';
import 'anggota.dart';

//
enum CardType {
  standard,
  tappable,
  selectable,
}

class TravelDestination {
  const TravelDestination({
    required this.assetName,
    required this.assetPackage,
    required this.title,
    required this.description,
    required this.city,
    required this.location,
    this.cardType = CardType.standard,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String description;
  final String city;
  final String location;
  final CardType cardType;
}
//

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//

List<TravelDestination> destinations(BuildContext context) {
  return [
    TravelDestination(
      assetName: 'fto2.jpg',
      assetPackage: 'assets/images/',
      title: 'Foto Kota',
      description: 'Foto ini diambil di sebuah kota di indonesia',
      city: 'Aceh',
      location: 'Indonesia',
    ),
    TravelDestination(
      assetName: 'fto1.jpg',
      assetPackage: 'assets/images/',
      title: 'Foto Kota dimalam hari',
      description: 'Foto ini diambil di sebuah kota di indonesia',
      city: 'Aceh',
      location: 'Indonesia',
    ),
    TravelDestination(
      assetName: 'fto3.jpg',
      assetPackage: 'assets/images/',
      title: 'Foto Kota Yang Penting Ada Gambar',
      description: 'Foto ini diambil di sebuah kota di indonesia',
      city: 'Aceh',
      location: 'Indonesia',
    ),
  ];
}

class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem({Key? key, required this.destination, this.shape})
      : super(key: key);

  static const height = 360.0;
  final TravelDestination destination;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: TravelDestinationContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TappableTravelDestinationItem extends StatelessWidget {
  const TappableTravelDestinationItem({
    Key? key,
    required this.destination,
    this.shape,
  }) : super(key: key);

  static const height = 298.0;
  final TravelDestination destination;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onTap: () {},
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: TravelDestinationContent(destination: destination),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectableTravelDestinationItem extends StatelessWidget {
  const SelectableTravelDestinationItem({
    Key? key,
    required this.destination,
    required this.isSelected,
    required this.onSelected,
    this.shape,
  }) : super(key: key);

  final TravelDestination destination;
  final ShapeBorder? shape;
  final bool isSelected;
  final VoidCallback onSelected;

  static const height = 298.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onLongPress: () {
                    onSelected();
                  },
                  splashColor: colorScheme.onSurface.withOpacity(0.12),
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      Container(
                        color: isSelected
                            ? colorScheme.primary.withOpacity(0.08)
                            : Colors.transparent,
                      ),
                      TravelDestinationContent(destination: destination),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.check_circle,
                            color: isSelected
                                ? colorScheme.primary
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}

class TravelDestinationContent extends StatelessWidget {
  const TravelDestinationContent({Key? key, required this.destination})
      : super(key: key);

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline5!.copyWith(color: Colors.white);
    final descriptionStyle = theme.textTheme.subtitle1!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 184,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(
                destination.assetPackage + destination.assetName,
                fit: BoxFit.cover,
              )),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    destination.title,
                    style: titleStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    destination.description,
                    style: descriptionStyle.copyWith(color: Colors.black54),
                  ),
                ),
                Text(destination.city),
                Text(destination.location),
              ],
            ),
          ),
        ),
        if (destination.cardType == CardType.standard)
          Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              alignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                TextButton(
                  onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title:
                                const Text('Sudah Diperingati Jangan Ditekan'),
                            content: const Text('Fitur Ini Belum Saya Tambah'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: Text(
                                    'Kembali',
                                    style: TextStyle(color: Colors.orange[500]),
                                  ))
                            ],
                          )),
                  child: Text(
                    'Jangan Ditekan',
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                ),
                TextButton(
                  onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Fitur Ini Belum Selesai'),
                            content: const Text('Fitur Ini Belum Saya Tambah'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: Text(
                                    'Kembali',
                                    style: TextStyle(color: Colors.orange[500]),
                                  ))
                            ],
                          )),
                  child: Text(
                    'Baca lebih lanjut',
                    style: TextStyle(color: Colors.orange[500]),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

//

class _HomeState extends State<Home> with RestorationMixin {
  final RestorableBool _isSelected = RestorableBool(false);

  @override
  String get restorationId => 'home';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_isSelected, 'is_selected');
  }

  @override
  void dispose() {
    _isSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[500],
        title: Text('UAS APP MOBILE'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text('Fitur Suka Belum Dibuat'),
                      content: const Text('Fitur Suka Belum Dibuat'),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: Text(
                              'Kembali',
                              style: TextStyle(color: Colors.orange[500]),
                            ))
                      ],
                    )),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text('Fitur Pencarian Belum Dibuat'),
                      content: const Text('Fitur Pencaria Belum Dibuat'),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: Text(
                              'Kembali',
                              style: TextStyle(color: Colors.orange[500]),
                            ))
                      ],
                    )),
          ),
          PopupMenuButton<Text>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    await Future.delayed(Duration.zero);
                    navigator.push(
                        MaterialPageRoute(builder: (context) => Anggota()));
                  },
                  child: Text(
                    'Anggota Kelompok',
                    style: TextStyle(color: Colors.orange[500]),
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: Scrollbar(
        child: ListView(
          restorationId: 'cards_demo_list_view',
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            for (final destination in destinations(context))
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: (destination.cardType == CardType.standard)
                    ? TravelDestinationItem(destination: destination)
                    : destination.cardType == CardType.tappable
                        ? TappableTravelDestinationItem(
                            destination: destination)
                        : SelectableTravelDestinationItem(
                            destination: destination,
                            isSelected: _isSelected.value,
                            onSelected: () {
                              setState(() {
                                _isSelected.value = !_isSelected.value;
                              });
                            },
                          ),
              ),
          ],
        ),
      ),
    );
  }
}
