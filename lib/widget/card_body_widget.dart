import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardBody extends StatelessWidget {
  CardBody({
    required this.item,
    required this.handleDelete,
    required this.index,
    super.key,
  });
  // ignore: prefer_typing_uninitialized_variables
  var item;
  // ignore: prefer_typing_uninitialized_variables
  var index;
  final Function handleDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: (index % 2 == 0)
            ? const Color.fromARGB(255, 51, 240, 246)
            : const Color.fromARGB(255, 241, 141, 233),
        borderRadius: BorderRadius.circular(12),
      ),
      // ignore: prefer_const_constructors
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xff4B4B4B),
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_outline,
                color: Color(0xff4B4B4B),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
