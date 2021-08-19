import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    //using list view without container will not show anything as it will then take infinite ht
    //as it without container it will then take ht of user transaction which is a column that takes ht of whole screen
    return Container(
        height: 300,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text(
                        '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: () {
                    deleteTx(transactions[index].id);
                  },
                ),
                title: Text(
                  '\$ ${transactions[index].title}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].date),
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
            //SECOND APPROACH TO LIST VIEW
            // return Card(
            //   child: transactions.isEmpty?Column(
            //       children: <Widget>[
            //         Text('No Expense added yet'),
            //         SizedBox(
            //           height: 10,
            //         ),
            //         Container(
            //           height: 200,
            //           child: Image.asset('assets/wait.png',fit: BoxFit.cover,),
            //         )
            //       ],
            //   ):
            //   Row(
            //     children: <Widget>[
            //       Container(
            //         margin: EdgeInsets.symmetric(
            //           horizontal: 15,
            //           vertical: 20,
            //         ),
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Theme.of(context).primaryColorLight, width: 2),
            //         ),
            //         padding: EdgeInsets.all(10),
            //         child: Text(
            //           '\$ ${transactions[index].amount.toStringAsFixed(2)}',
            //           style: TextStyle(
            //             color: Theme.of(context).primaryColorLight,
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //       //DateFormat.jm() -> for time
            //       //DateFormat.hm() -> for time in 24hrs
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           Text(
            //             transactions[index].title,
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           Text(
            //             DateFormat().format(transactions[index].date),
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // );
          },
        ));
  }
}

//SECOND APPROACH TO LIST VIEW
//USE ABOVE APPROACH FOR BIGGER LIST

// ListView
// (
// //taking list of transaction and mapping to card widget
// children: transactions.map((
// tx) {
// return Card(
// child: Row(
// children: <Widget>[
// Container(
// margin: EdgeInsets.symmetric(
// horizontal: 15,
// vertical: 20,
// ),
// decoration: BoxDecoration(
// border:
// Border.all(color: Colors.deepOrange, width: 2),
// ),
// padding: EdgeInsets.all(10),
// child: Text(
// '\$ ${tx.amount}',
// style: TextStyle(
// color: Colors.deepOrange,
// fontSize: 20,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// //DateFormat.jm() -> for time
// //DateFormat.hm() -> for time in 24hrs
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// tx.title,
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// ),
// ),
// Text(
// DateFormat().format(tx.date),
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// ),
// ),
// ],
// ),
// ],
// ),
// );
// })
// .
// toList
// (
// ),)
// ,
