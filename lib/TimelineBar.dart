import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelineItem extends StatefulWidget {
  final int index;
  final double width;
  final double height;
  final bool enableIcon;

  TimelineItem(this.index, this.width,
      {this.height = 90, this.enableIcon = true});

  @override
  _TimelineItemState createState() => _TimelineItemState();
}

class _TimelineItemState extends State<TimelineItem> {
  @override
  Widget build(BuildContext context) {
    final date = DateTime.now().add(Duration(days: widget.index)).toLocal();
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: BorderDirectional(end: BorderSide(color: Colors.black12)),
      ),
      child: Stack(
        children: <Widget>[
          if (widget.enableIcon)
            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.keyboard_arrow_right),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "${date.day}/${date.month}/${date.year}",
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineBar extends StatefulWidget {
  final int count;
  final void Function(int) onChange;

  const TimelineBar({this.count = 7, @required this.onChange});

  @override
  _TimelineBarState createState() => _TimelineBarState();
}

class _TimelineBarState extends State<TimelineBar> {
  ScrollController scroll;
  double width;

  @override
  void initState() {
    super.initState();
    this.scroll = ScrollController();
  }

  @override
  void dispose() {
    this.scroll.dispose();
    super.dispose();
  }

  void releaseDrag() {
    final v = this.scroll.offset;
    int f = v ~/ width;
    if (v % width > width / 2) {
      f += 1;
    }
    this.scroll.animateTo(
          f * width,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
        );
    this.widget.onChange(f);
  }

  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width;
    final count = widget.count;
    return SizedBox(
      height: 90,
      child: Listener(
        onPointerUp: (delta) => this.releaseDrag(),
        behavior: HitTestBehavior.translucent,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          controller: this.scroll,
          itemCount: count,
          itemBuilder: (context, index) {
            return TimelineItem(
              index,
              width,
              enableIcon: index != count - 1,
            );
          },
        ),
      ),
    );
  }
}
