import 'package:flutter/material.dart';

class ExpenseModel {
  String cost;
  int price;
  ExpenseModel({required this.cost, required this.price});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final costController = TextEditingController();
  final priceController = TextEditingController();

  // List<int> prizeData = [2000, 3000];
  // List<String> costData = ["drink", "drink3"];
  List<ExpenseModel> data = [
    ExpenseModel(cost: "cost1", price: 1000),
    ExpenseModel(cost: "cost2", price: 2000),
  ];

  void addData() {
    setState(() {
      data.add(ExpenseModel(
          cost: costController.text, price: int.parse(priceController.text)));
    });
  }

  int countTotal() {
    int result = 0;

    for (int i = 0; i < data.length; i++) {
      result += data[i].price;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cost",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: costController,
                  decoration: InputDecoration(
                    hintText: 'cost',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Price",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    hintText: 'price',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  addData();
                },
                child: Text('Add'),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: List.generate(
                  data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 350,
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text("${index + 1}"),
                            SizedBox(
                              height: 20,
                            ),
                            Text("cost: ${data[index].cost}"),
                            Text('prize: ${data[index].price}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Card(
                  color: Colors.black26,
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Text("Total: ${countTotal()}"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
