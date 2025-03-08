import 'package:flutter/material.dart';
import 'package:tracking_app/src/models/expense_model.dart';
import 'package:tracking_app/src/utils/utils.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {

  _addBalance(BuildContext context){
    final TextEditingController balanceController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(balance == 0.0 ? "Add Balance" : "Edit Balance"),
        content: TextField(
          controller: balanceController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            labelText: "Amount",
          ),
        ),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),
          TextButton(onPressed: (){
            setState(() {
              balance = double.parse(balanceController.text);
              Navigator.pop(context);
            });
          }, child: Text(balance == 0.0 ? "Add" : "Save")),
        ],
      ),
    );
  }

  _deleteExpense(int index) {
    setState(() {
      balance = balance + _expenses[index].amount;
      _expenses.removeAt(index);
    });
  }

  _deleteAll() {
    setState(() {
      balance = 0.0;
      _expenses.clear();
    });
  }


  final List<ExpenseModel> _expenses = [];
  double balance = 0.0;
  final List<String> _categories = [
    "Food & Groceries",
    "Clothing",
    "Education",
    "Entertainment",
    "Transportation",
    "Bills",
    "Health & Personal Care",
    "Savings & Investments",
    "Debt & Loans",
    "Others",
  ];
  final List<IconData> _categoriesImg = [
    Icons.restaurant_outlined,
    Icons.shopping_bag_outlined,
    Icons.school_outlined,
    Icons.festival_outlined,
    Icons.directions_bus_filled_outlined,
    Icons.attach_money,
    Icons.health_and_safety_outlined,
    Icons.account_balance,
    Icons.balance,
    Icons.more_horiz,
  ];

  Future _displayBottomSheet(BuildContext context, double screenHeight) async {
    final TextEditingController amountController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    String selectedCategory = _categories.first;
    int imgIndex = 0;
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder:
          (context) => SizedBox(
            height: screenHeight * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  DropdownButtonFormField(
                    items:
                        _categories
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Category',
                    ),
                    onChanged: (value) {
                      selectedCategory = value.toString();
                      imgIndex = _categories.indexOf(value.toString());
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Title',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Amount',
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (double.tryParse(amountController.text) == null ||
                          titleController.text.isEmpty) {
                        Utils.snackBar(
                          "Please enter a valid amount or title",
                          context,
                        );
                      } else {
                        setState(() {
                          _expenses.add(
                            ExpenseModel(
                              category: selectedCategory,
                              title: titleController.text,
                              amount: double.parse(amountController.text),
                              date: DateTime.now().toString(),
                              icon: _categoriesImg[imgIndex],
                            ),
                          );
                        });
                        balance = balance - double.parse(amountController.text);
                        amountController.clear();
                        titleController.clear();
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade800,
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple.shade800,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _deleteAll();
            },
            icon: Icon(Icons.delete_outline_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              child: Container(
                height: screenHeight * 0.2,
                width: screenWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            _addBalance(context);
                          },
                          icon: Icon(Icons.edit, color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                    Text(
                      "My Balance:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      balance.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(balance < 0 ? Icons.error : Icons.check, color: Colors.white, size: 20),
                        Text(
                          balance < 0 ? "You're on debt!" : "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: screenHeight * 0.55,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: _expenses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      surfaceTintColor: Colors.deepPurple.shade400,
                      elevation: 3,
                      margin: EdgeInsets.all(5),
                      child: InkWell(
                        onLongPress: ()=> showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Delete ${_expenses[index].title}"),
                            content: Text("Are you sure you want to delete this expense?"),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
                              TextButton(onPressed: () {
                                _deleteExpense(index);
                                Navigator.pop(context);
                              }, child: Text("Delete")),
                            ],
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepPurple.shade700,
                            child: Icon(
                              _expenses[index].icon,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            _expenses[index].title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            _expenses[index].date,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          trailing: Text(
                            _expenses[index].amount.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
              child: SizedBox(
                height: screenHeight * 0.05,
                width: screenWidth,
                child: ElevatedButton(
                  onPressed: () {
                    _displayBottomSheet(context, screenHeight);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade800,
                  ),
                  child: Text(
                    "Add Expense",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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