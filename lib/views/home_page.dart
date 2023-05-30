import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moniepointtest/views/product_detail.dart';

import '../constants/text_sty.dart';
import '../models/carosel_data.dart';
import '../models/product_model.dart';
import '../widgets/action_icons.dart';
import '../widgets/carousel_w.dart';
import '../widgets/product_widget.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();

  List<CarouselData> carouselData = [
    CarouselData(
      title: "#FASHION DAY",
      title2: "80% OFF",
      subtitle: "Discover fashion that suits to your style",
      btnText: "Check this out",
      imgUrl: "https://i.ibb.co/n3QWSkG/IMG-9824.jpg",
    ),
    CarouselData(
      title: "#BEAUTYSALE",
      title2: "DISCOVER OUR BEAUTY SELECTION",
      subtitle: "",
      btnText: "Check this out",
      imgUrl: "https://i.ibb.co/WG8JVWj/IMG-9828.jpg",
    ),
  ];

  List<ProductData> productData = [
    ProductData(
      category: 'Sportswear',
      title: 'Nike Sportswear Essential',
      image:
          'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c3492406-e1fb-4eb4-a009-271c2f45c5a2/sportswear-essential-bodysuit-tank-2s9QdC.png',
      images: [
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f62763cd-03e0-44aa-a4f5-0535c76d2eaf/sportswear-essential-bodysuit-tank-2s9QdC.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/36d0f151-a9cc-4adf-8bf6-25d9f5eb2d3a/sportswear-essential-bodysuit-tank-2s9QdC.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/e0230dcd-2910-4906-89b9-001136eef774/sportswear-essential-bodysuit-tank-2s9QdC.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/71169557-0931-4633-9113-6590c79c409d/sportswear-essential-bodysuit-tank-2s9QdC.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6ba4599d-b0e2-444e-9115-2b54a13ca840/nikecourt-dri-fit-slam-dress-ND5bnT.png'
      ],
      rating: 5.0,
      sold: 234,
      price: 54.49,
      desc:
          'With its soft, stretchy fabric and statement-making shape, this tight-fitting bodysuit gives you options. On its own, its asymmetrical cut-outs offer a sleek, athletic look. Under a button-up or your favourite sweatshirt, it\'s a stay-put layer that bends and stretches with your every move.',
    ),
    ProductData(
      category: 'Sportswear',
      title: 'Nike Sportswear Club',
      image:
          'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/4b9c10f2-56f6-4250-a4e0-9de298dd7779/sportswear-club-t-shirt-G2qXCD.png',
      images: [
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/a382d3df-0752-4399-b98e-a082cc8bea4d/sportswear-club-t-shirt-G2qXCD.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/85bb872f-a4ae-405f-ac9b-bc84fa85760a/sportswear-club-t-shirt-G2qXCD.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/123f3126-58dc-4ea9-a834-d31edd38a18b/sportswear-club-t-shirt-G2qXCD.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/6599b224-5b3a-4274-b423-16d4eaaa2cda/sportswear-club-t-shirt-G2qXCD.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6ba4599d-b0e2-444e-9115-2b54a13ca840/nikecourt-dri-fit-slam-dress-ND5bnT.png'
      ],
      rating: 4.6,
      sold: 112,
      price: 24.99,
      desc:
          'The Nike Sportswear Club T-Shirt is made with our everyday cotton fabric and a classic fit, for a familiar feel right out of the bag.An embroidered Futura logo on the chest provides a signature Nike look.',
    ),
    ProductData(
      category: 'Sportswear',
      title: 'NikeCourt Dri-FIT Slam',
      image:
          'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c00762e9-acbe-4f92-be0f-1a8dd96dc585/nikecourt-dri-fit-slam-dress-ND5bnT.png',
      images: [
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/ac494efc-0dce-4e84-99ad-e1cd046ccdcf/nikecourt-dri-fit-slam-dress-ND5bnT.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6ba4599d-b0e2-444e-9115-2b54a13ca840/nikecourt-dri-fit-slam-dress-ND5bnT.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/dc7a8095-4630-414e-8198-a7fe9d5f4257/nikecourt-dri-fit-slam-dress-ND5bnT.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/7aa8fdfc-f3f0-4941-a455-dc7552e6e90a/nikecourt-dri-fit-slam-dress-ND5bnT.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6ba4599d-b0e2-444e-9115-2b54a13ca840/nikecourt-dri-fit-slam-dress-ND5bnT.png'
      ],
      rating: 2.1,
      sold: 20,
      price: 129.99,
      desc:
          'From overheads to ground strokes, navigate the highs and lows of your game in this slim-fitting, airy mesh dress. A high neckline and a double-panelled skirt offer modesty through your dynamic moves. Sweat-wicking tech and strategically placed cut-outs help keep you cool and comfy.',
    ),
    ProductData(
      category: 'Sportswear',
      title: 'Nike Sportswear Tech Fleece',
      image:
          'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0bca7177-0bc8-4db1-bbf2-8e39f94c6cfd/sportswear-tech-fleece-hoodie-kC99j3.png',
      images: [
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1ed04118-0fb5-4d11-aeb3-d9a5762d4c34/sportswear-tech-fleece-hoodie-kC99j3.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/521e7cca-7269-4cdc-bd56-9e6df888f7e2/sportswear-tech-fleece-hoodie-kC99j3.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0a02de66-a637-44eb-aa3e-30d3839cb036/sportswear-tech-fleece-hoodie-kC99j3.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/bf216b56-85f5-4ac6-99aa-23f5f84e4262/sportswear-tech-fleece-hoodie-kC99j3.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6ba4599d-b0e2-444e-9115-2b54a13ca840/nikecourt-dri-fit-slam-dress-ND5bnT.png'
      ],
      rating: 3.9,
      sold: 300,
      price: 119.99,
      desc:
          'Ready to rock the warmth and comfort of your favourite weekender hoodie, but need to keep your look clean? This Nike Tech Fleece hoodie strikes the right balance with a lightweight, low-profile design that packs in the heat without adding bulk. You can layer with ease whether you\'re lounging at home or making your city commute.',
    ),
    ProductData(
      category: 'Sportswear',
      title: 'Nike Swoosh',
      image:
          'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/05f283c0-61d3-4e01-821b-4273b2147856/swoosh-support-non-padded-sports-bra-4LhtVf.png',
      images: [
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/db503ee3-f24b-403f-91d2-160e5e1b0d6f/swoosh-support-non-padded-sports-bra-4LhtVf.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/7fa9212b-4f6e-40bf-be8f-b9cd0c0eb306/swoosh-support-non-padded-sports-bra-4LhtVf.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/e87332fe-27cc-428f-9b01-130590e3d6f4/swoosh-support-non-padded-sports-bra-4LhtVf.png',
        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8140ebd9-a4d0-4f47-9177-f0035aeb3665/swoosh-support-non-padded-sports-bra-4LhtVf.png',
      ],
      desc:
          'The Nike Dri-FIT Swoosh Sports Bra gives you the kind of support you know you can count on. This non-padded style is made from soft, smooth fabric and an exposed elastic band at the bottom that helps keep everything in place. Sweat-wicking technology helps you stay dry and comfortable. This product is made from at least 50% recycled polyester fibres.',
      rating: 4.5,
      sold: 344,
      price: 29.9,
    )
  ];

  final pageCtrl = PageController();

  double get pageOffSet {
    try {
      var screen = pageCtrl.page ?? pageCtrl.initialPage.toDouble();
      return screen % carouselData.length;
    } catch (_) {
      return pageCtrl.initialPage.toDouble();
    }
  }

  double calculateOffSetIndex(int index) {
    return (index - pageOffSet);
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
            // elevation: 3,
            pinned: true,
            expandedHeight: 300,
            toolbarHeight: 80,
            title: SizedBox(
              height: 50,
              child: TextFormField(
                controller: _controller,
                autocorrect: false,
                cursorColor: Colors.grey[300],
                decoration: InputDecoration(
                  hintText: "Search..",
                  hintStyle: reg1,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFFEDEDED),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFFEDEDED),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ),
            actions: const [
              ActionIcons(
                icon: FaIcon(
                  FontAwesomeIcons.bagShopping,
                  color: Color(0xff494A59),
                  size: 25,
                ),
                numb: '1',
              ),
              ActionIcons(
                icon: FaIcon(
                  FontAwesomeIcons.message,
                  color: Color(0xff494A59),
                  size: 25,
                ),
                numb: '9+',
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    PageView.builder(
                        itemCount: carouselData.length,
                        controller: pageCtrl,
                        onPageChanged: (int index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          CarouselData data = CarouselData(
                            title: carouselData[index].title,
                            title2: carouselData[index].title2,
                            subtitle: carouselData[index].subtitle,
                            btnText: carouselData[index].btnText,
                            imgUrl: carouselData[index].imgUrl,
                          );
                          final items = carouselData;

                          return Container(
                            color: Colors.transparent,
                            child: CarouselW(
                              // carouselImg: imgUrl,
                              // items: items,
                              data: data, items: items,
                            ),
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List<Widget>.generate(
                        carouselData.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: InkWell(
                            onTap: () {
                              pageCtrl.animateToPage(index,
                                  duration: const Duration(microseconds: 200),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              height: 6,
                              width: _current == index ? 12 : 6,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  color: _current == index
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        quickBtns(icon: Icons.dashboard, name: 'Category'),
                        quickBtns(icon: Icons.flight, name: 'Flight'),
                        quickBtns(icon: Icons.edit_document, name: 'Bil'),
                        quickBtns(icon: Icons.phone, name: 'Data plan'),
                        quickBtns(icon: Icons.money, name: 'Top Up'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      carouselData.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: InkWell(
                          onTap: () {
                            pageCtrl.animateToPage(index,
                                duration: const Duration(microseconds: 200),
                                curve: Curves.easeIn);
                          },
                          child: Container(
                            height: 6,
                            width: _current == index ? 12 : 6,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: _current == index
                                    ? Colors.black
                                    : Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 80,
              maxHeight: 80,
              child: Container(
                padding: const EdgeInsets.all(20),
                // height: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Sale Product",
                      style: hev1,
                    ),
                    Text(
                      "See more",
                      style: reg2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.amber,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: productData.length,
                    itemBuilder: (BuildContext context, int index) {
                      ProductData data = productData[index];

                      return Product(
                        title: data.title,
                        image: data.image,
                        category: data.category,
                        price: data.price,
                        rate: data.rating,
                        sold: data.sold,
                        tap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                    image: data.image,
                                    images: data.images,
                                    title: data.title,
                                    sold: data.sold,
                                    rate: data.rating,
                                    price: data.price,
                                    data: productData,
                                  )));
                        },
                      );
                    },
                  ),
                );
              },
              childCount: 1, // Replace with your actual item count
            ),
          ),
        ],
      ),
    );
  }

  Column quickBtns({required String name, required IconData icon}) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF6F6F6)),
          child: Icon(
            icon,
            color: const Color(0xff494A59),
          ),
        ),
        Text(
          name,
          style: reg1,
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const Color backgroundColor = Color(0xffF7F8FA);

    return Container(
      color: backgroundColor, // Apply opaque background color
      child: SizedBox.expand(child: child),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
