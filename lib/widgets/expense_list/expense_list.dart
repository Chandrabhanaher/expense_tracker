import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expenses_items.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(expenses[index]),
            background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                margin: EdgeInsets.symmetric(
                    horizontal:
                        Theme.of(context).cardTheme.margin!.horizontal)),
            onDismissed: (direction) => onRemoveExpense(expenses[index]),
            child: ExpenseItems(expenses[index])));
  }
}
