import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function txHandler;

  NewTransaction(this.txHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleTextController = TextEditingController();

  final amountTextController = TextEditingController();

  void submitData() {
    final enterTitle = titleTextController.text;
    final enterAmount = double.parse(amountTextController.text);

    if (enterTitle.isNotEmpty && enterAmount >= 0) {
      widget.txHandler(enterTitle, enterAmount);
      Navigator.of(context).pop();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: titleTextController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountTextController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => {submitData()},
            ),
            FlatButton(
              child: Text("Add transaction"),
              textColor: Colors.purple,
              onPressed: () => submitData,
            )
          ],
        ),
      ),
    );
  }
}
