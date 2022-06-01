import 'package:flutter/material.dart';

import 'models/popularitems.dart';

Widget renderGridItem({required PopularItems item, required context}) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 0, 12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                item.pName!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: <Widget>[
              //     Text(
              //       r"$ " + item.price,
              //       textAlign: TextAlign.left,
              //       style: const TextStyle(
              //         color: Colors.black,
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 8.0,
              //     ),
              //     Text(
              //       item.priceDescription,
              //       textAlign: TextAlign.left,
              //       style: const TextStyle(
              //         color: Colors.black,
              //         fontSize: 14,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 8.0,
              ),
              Expanded(
                child: Hero(
                  tag: item.pName!,
                  child: Image.network(
                    'www.jfamoslogictics.com/images/${item.pimage!}',
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
