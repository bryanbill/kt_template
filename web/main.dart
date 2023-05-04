import 'package:kitawi/widgets.dart';

void main() {
  run(
    [
      Route(builder: (args) => Home(), path: "/", name: "home"),
    ],
    id: "root",
  );
}

class Home extends Layout {
  int counter = 0;

  @override
  Widget build() {
    return Frame(
      body: Center(
        child: Text(
          "Counter: $counter",
          style: TextStyle(
            fontSize: 24.px,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        actions: [
          Action((p0) {
            setState(() => counter++);
          }, type: Actions.click)
        ],
        padding: EdgeInsets.all(12.px),
        decoration: Decoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            12.px,
          ),
        ),
        child: Icon(
          IconData(
            "add",
          ),
        ),
      ),
    );
  }
}
