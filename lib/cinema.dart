import 'package:flutter/material.dart';

class CinemaHall extends StatefulWidget {
  const CinemaHall({Key? key}) : super(key: key);

  @override
  _CinemaHallState createState() => _CinemaHallState();
}

class _CinemaHallState extends State<CinemaHall> with TickerProviderStateMixin {
  late List<Offset> positions;
  late List<ValueNotifier<bool>> states;
  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();
    positions = [
      ...List.generate(8, (index) => (Offset(index + 1, 0))),
      for (int r = 1; r < 10; r++)
        ...List.generate(
            10, (index) => (Offset(index.toDouble(), r.toDouble()))),
    ];
    states = List.generate(positions.length, (index) => ValueNotifier(false));
    ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    Future.delayed(const Duration(milliseconds: 2000), () => ctrl.forward());
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xff000044),
      child: InteractiveViewer(
        minScale: 1.0,
        maxScale: 3.0,
        child: CustomMultiChildLayout(
          delegate: CinemaHallDelegate(ctrl, positions, const Size(64, 64)),
          children: List.generate(
              positions.length,
              (index) => LayoutId(
                    id: index,
                    child: FittedBox(
                      child: ValueListenableBuilder<bool>(
                        valueListenable: states[index],
                        builder: (context, state, child) {
                          return TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 200),
                            tween: Tween(end: state ? 0.8 : 0.2),
                            builder: (context, t, child) {
                              return IconButton(
                                icon: Icon(Icons.person,
                                    color: Colors.white.withOpacity(t)),
                                padding: EdgeInsets.zero,
                                iconSize: 64,
                                tooltip:
                                    'seat ${positions[index].dy.toInt() + 1}, ${positions[index].dx.toInt() + 1}',
                                onPressed: () {
                                  states[index].value = !state;
                                  print(index);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    ctrl.dispose();
  }
}

class CinemaHallDelegate extends MultiChildLayoutDelegate {
  final AnimationController ctrl;
  final List<Offset> positions;
  final Size seatSize;
  late Size cinemaHallSize;

  CinemaHallDelegate(this.ctrl, this.positions, this.seatSize)
      : super(relayout: ctrl) {
    double cols = positions
            .map((o) => o.dx)
            .reduce((value, element) => value > element ? value : element) +
        1;
    double rows = positions
            .map((o) => o.dy)
            .reduce((value, element) => value > element ? value : element) +
        1;
    cinemaHallSize = Size(cols * seatSize.width, rows * seatSize.height);
  }

  @override
  void performLayout(Size size) {
    final matrix = sizeToRect(cinemaHallSize, Offset.zero & size);
    final seatRect = MatrixUtils.transformRect(matrix, Offset.zero & seatSize);
    final center =
        size.center(Offset(-seatRect.width / 2, -seatRect.height / 2));

    int childId = 0;
    final constraints =
        BoxConstraints.tight(Size(seatRect.width, seatRect.height));
    final t = Curves.bounceOut.transform(ctrl.value);
    for (final position in positions) {
      layoutChild(childId, constraints);
      final offset = Offset(seatRect.left + position.dx * seatRect.width,
          seatRect.top + position.dy * seatRect.height);
      positionChild(childId, Offset.lerp(center, offset, t)!);
      childId++;
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}

Matrix4 sizeToRect(Size src, Rect dst,
    {BoxFit fit = BoxFit.contain, Alignment alignment = Alignment.center}) {
  FittedSizes fs = applyBoxFit(fit, src, dst.size);
  double scaleX = fs.destination.width / fs.source.width;
  double scaleY = fs.destination.height / fs.source.height;
  Size fittedSrc = Size(src.width * scaleX, src.height * scaleY);
  Rect out = alignment.inscribe(fittedSrc, dst);

  return Matrix4.identity()
    ..translate(out.left, out.top)
    ..scale(scaleX, scaleY);
}
