import 'package:flutter/material.dart';

import '../widgets/my_elevated_button.dart';

class PredictionList extends StatelessWidget {
  final List<Item> items = [Item(), Item(), Item(), Item(), Item(), Item()];

  PredictionList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 每列最小宽度为 300，最多 4 列
        int crossAxisCount = (constraints.maxWidth / 300).floor().clamp(1, 4);

        return GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 200,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _PredictionItemCard(item);
          },
        );
      },
    );
  }
}

class _PredictionItemCard extends StatelessWidget {
  final Item item;

  const _PredictionItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 8, offset: Offset(0, 0))],
      ),
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.south_america, size: 40),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Text(
                  "US recession in 2025? US recession in 2025?",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 40,
                  child: TextElevatedButton(
                    foregroundColor: Color(0xff21a556),
                    backgroundColor: Color(0xffe3f3ef),
                    selectedBackgroundColor: Color(0xff21a556),
                    selectedForegroundColor: Colors.white,
                    onPressed: () {},
                    child: Text("Buy Yes", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 40,
                  child: TextElevatedButton(
                    foregroundColor: Color(0xffec4b2f),
                    backgroundColor: Color(0xfff3e6e3),
                    selectedBackgroundColor: Color(0xffec4b2f),
                    selectedForegroundColor: Colors.white,
                    onPressed: () {},
                    child: Text("Buy No", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("\$5m Vol."),
              Spacer(),
              InkWell(onTap: () {}, child: Icon(Icons.star_outline, size: 20, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class Item {}
