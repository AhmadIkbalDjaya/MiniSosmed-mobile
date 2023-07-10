import 'package:flutter/material.dart';

class PersonBox extends StatelessWidget {
  const PersonBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 2,
              blurRadius: 3,
            )
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(radius: 25),
              SizedBox(width: 15),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahmad Ikbal Djaya",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("46 Pengikut"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            child: Text("Follow"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 35),
            ),
          ),
        ],
      ),
    );
  }
}
