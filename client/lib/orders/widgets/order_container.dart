import 'package:client/services/constants.dart';
import 'package:client/services/repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/models.dart';


class OrderContainer extends StatelessWidget {
  OrderContainer({
    Key? key, 
    required this.order, 
    required this.onTap,
    required this.onDelete,
    required this.onPay
  }) : super(key: key);

  void Function() onTap;
  void Function() onDelete;
  void Function() onPay;
  Order order;

  @override
  Widget build(BuildContext context) {
    print(order.isEnd);
    return Card(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 25, 
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(child: Text(order.ordId.toString()))
              ),
              Expanded(
                flex: 15,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(order.listOrders.map<String>((e) => e.dish.dishName).toList().join(', '), 
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ),
              if (!order.isEnd) Expanded(
                flex: 2,
                child: Padding(padding: const EdgeInsets.all(3), child: ElevatedButton(
                  child: const Text("pay"),
                  onPressed: onPay,
                ))
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Provider.of<Constants>(context, listen: false).grey,
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: onDelete
                  )
                )
              )
            ]
          )
        ),
      )
    );
  }
}