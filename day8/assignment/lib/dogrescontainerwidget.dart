import 'package:flutter/material.dart';

class DogResContainerWidget extends StatelessWidget {
  const DogResContainerWidget(
      {super.key, required this.dogMsg, required this.dogImgUrl});
  final String dogMsg;
  final String dogImgUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5.0,
              spreadRadius: 3.0, // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 180,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 5.0,
                          spreadRadius: 3.0, // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(dogImgUrl, fit: BoxFit.fill)),
                  ),
                ),
              ),
              Text(dogMsg),
              const Icon(Icons.message_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
