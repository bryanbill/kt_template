
import 'package:kitawi/kitawi.dart';

void main() {
  run(
    [
      Route(builder: (args) => App(), path: "/", name: "App"),
    ],
    id: 'root', // This is the id of element that will contain your app
    env: Environment.dev,
  );
}

class App extends Layout {
  final counter = ValueStream(0);
  @override
  Widget build() {
    return SizedBox(
      height: 100.percent,
      width: 100.percent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int?>(
            stream: counter.stream,
            initialData: counter.value,
            builder: (snapshot) => Text.h3(
              "${snapshot.data}",
            ),
          ),
          FloatingActionButton(
            actions: [
              Action(
                type: 'click',
                callback: (event) => counter.add(counter.value! + 1),
              )
            ],
            decoration: Decoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            width: 48.px,
            height: 48.px,
            child: Icon(
              IconData("add", type: "material-icons-outlined"),
              size: 24.px,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    counter.dispose();
    super.dispose();
  }
}
