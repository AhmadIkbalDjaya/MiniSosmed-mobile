import 'package:flutter/material.dart';
import 'package:mini_sosmed/auth.dart';
import 'package:mini_sosmed/controller/UserController.dart';
import 'package:mini_sosmed/model/profile.dart';

class BioBox extends StatefulWidget {
  const BioBox({super.key, required this.profile, required this.fetchData});
  final Profile profile;
  final Function fetchData;

  @override
  State<BioBox> createState() => _BioBoxState();
}

class _BioBoxState extends State<BioBox> {
  final userController = UserContoller();
  final addressController = TextEditingController();
  final List listGender = ["Laki-Laki", "Perempuan"];
  late String gender;
  late DateTime birthday;

  Future<dynamic> updateBio() async {
    String birthdayData = "${birthday.year}-${birthday.month}-${birthday.day}";
    String genderData = gender;
    String addressData = addressController.text;

    var result =
        await userController.updateBio(birthdayData, genderData, addressData);
    if (result) {
      Navigator.of(context).pop();
      widget.fetchData();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Biodata Berhasil Diperbaharui"),
        ),
      );
    } else {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Biodata Gagal Diperbaharui"),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addressController.text =
        widget.profile.address != null ? widget.profile.address.toString() : '';
    gender = widget.profile.gender.toString();
    birthday = DateTime.parse(widget.profile.birthday.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Biodata",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                      child: Text(
                        ":",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      "${widget.profile.name}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        "Birthday",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                      child: Text(
                        ":",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      "${widget.profile.birthday}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        "Gender",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                      child: Text(
                        ":",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      "${widget.profile.gender}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                      child: Text(
                        ":",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      widget.profile.address != null
                          ? "${widget.profile.address}"
                          : "Belum ditambahkan",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          widget.profile.id.toString() == Auth.userId
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 30),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              height: 390,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  // header
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Edit Biodata",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: Icon(
                                              Icons.clear_outlined,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                  // body
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(radius: 20),
                                          SizedBox(width: 10),
                                          Text(
                                            "${Auth.name}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Birthday"),
                                          Container(
                                            height: 30,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "${birthday.day}/${birthday.month}/${birthday.year}"),
                                                IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  onPressed: () async {
                                                    final DateTime? selectDate =
                                                        await showDatePicker(
                                                      context: context,
                                                      initialDate: birthday,
                                                      firstDate: DateTime(1945),
                                                      lastDate: DateTime(2020),
                                                    );
                                                    if (selectDate != null) {
                                                      setState(
                                                        () {
                                                          birthday = selectDate;
                                                        },
                                                      );
                                                    }
                                                  },
                                                  icon: Icon(Icons.date_range),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Jenis Kelamin"),
                                          SizedBox(height: 5),
                                          SizedBox(
                                            height: 30,
                                            child:
                                                DropdownButtonFormField<String>(
                                              value: gender,
                                              items: listGender
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      child: Text("${e}"),
                                                      value: e as String,
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  gender = value!;
                                                });
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Address"),
                                          SizedBox(height: 5),
                                          SizedBox(
                                            height: 30,
                                            child: TextField(
                                              controller: addressController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // footer
                                  Column(
                                    children: [
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Cancel"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              updateBio();
                                            },
                                            child: Text("Edit"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Text("Edit Biodata"),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
