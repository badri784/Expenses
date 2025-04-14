import 'package:expenses/widget/chart/chart.dart';
import 'package:expenses/widget/expenses_list/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/expense.dart';
import 'expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _list = [
    Expense(
      title: "cinema",
      amount: 50,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "dart course",
      amount: 123,
      date: DateTime.now(),
      category: Category.education,
    ),
    Expense(
      title: "travel",
      amount: 578,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "mechanical course",
      amount: 5045,
      date: DateTime.now(),
      category: Category.education,
    ),
    Expense(
      title: "breakfast",
      amount: 55,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "maintenance",
      amount: 19,
      date: DateTime.now(),
      category: Category.other,
    ),
  ];
  void addExpense(Expense expense) {
    setState(() {
      _list.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      _list.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => NewExpenses(addExpense),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chart(expenses: _list),
            Expanded(
              child: ExpensesList(
                expenses: _list,
                onRemoveExpense: removeExpense,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
