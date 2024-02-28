import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedDate = DateTime.now();
  var selected = false;
  var f = DateFormat("dd/MM/yyyy EEEE");

  var modVal = 0;
  var houseName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("MahaBote"),
        centerTitle: true,
      ),
      body: _homeDesign(),
    );
  }

  Widget _mahaboteLayout() => const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(""), Text("အဓိပတိ"), Text("")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("အထွန်း"), Text("သိုက်"), Text("ရာဇ")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("မရဏ"), Text("ဘင်္ဂ"), Text("ပုတ်")],
            ),
          ],
        ),
      );

  String _houseResult(year, day) {
    var houses = ["မရဏ", "ဘင်္ဂ", "ပုတ်", "အထွန်း", "သိုက်", "ရာဇ", "အဓိပတိ"];
    return houses[(year - day - 1) % 7];
  }

  var isChecked = false;

  Widget _homeDesign() => ListView(
        children: <Widget>[
          Container(
            height: 100,
            color: Theme.of(context).primaryColor,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue, fixedSize: const Size(100, 50)),
              onPressed: () async {
                final DateTime? picked = (await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2030),
                    helpText: 'Select Your Birthday',
                    cancelText: 'Not Now'));
                if (picked != null) {
                  var myanmarYear = picked.year - 638;
                  if (picked.month < 4) {
                    var myanmarYear = picked.year - 637;
                  }

                  setState(() {
                    selectedDate = picked;
                    modVal = myanmarYear % 7;
                    houseName = _houseResult(myanmarYear, picked.weekday);
                    selected = true;
                  });
                }
              },
              child: selected
                  ? Text(f.format(selectedDate))
                  : const Text("Select Your Birthday"),
            ),
          ),
          Checkbox(
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          Container(
            margin: const EdgeInsets.all(12),
            height: 145,
            child: Card(
              child: Center(
                child: _mahaboteLayout(),
              ),
            ),
          ),
          selected == false
              ? Container()
              : Container(
                  margin: const EdgeInsets.all(12),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            houseName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan),
                          ),
                          Text("အကြွင်း $modVal")
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      );
}
