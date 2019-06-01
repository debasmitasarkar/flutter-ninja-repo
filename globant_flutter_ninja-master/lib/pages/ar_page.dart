import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArPage extends StatefulWidget {
  @override
  _ArPageState createState() => _ArPageState();
}

class _ArPageState extends State<ArPage> {
  ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('City-wise statistics'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    _addPlane(controller);
    _addSphere(controller, 0.02, vector.Vector3(0.2,0,-1.0));
    _addSphere(controller, 0.04, vector.Vector3(-0.3,-0.1,-1.0));
    _addSphere(controller, 0.04, vector.Vector3(-0.17,0.2,-1.0));
    _addSphere(controller, 0.02, vector.Vector3(-0.11,-0.3,-1.0));
  }

  void _addPlane(ArCoreController controller) {
    final material = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244), texture: "india_png.png");
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(1, 1, 1),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  void _addSphere(ArCoreController controller, double radius, vector.Vector3 position) {
    final material = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),);
    final sphere = ArCoreSphere(
      materials: [material],
      radius: radius,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: position,
    );
    controller.addArCoreNode(node);
  }

  void _addCylindre(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.red,
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.3,
    );
    final node = ArCoreNode(
      shape: cylindre,
      position: vector.Vector3(0.0, -0.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
