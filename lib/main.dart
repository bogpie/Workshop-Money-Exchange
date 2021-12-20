import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 1. Create a variable which will change
  String _changeable = 'Initial text';
  String imageUrl =
      'https://www.pngall.com/wp-content/uploads/2018/05/Euro-Symbol-PNG-Image-File.png';
  final TextEditingController _controller = TextEditingController();
  double _sumBeforeConversion = 0.0;
  double _sumAfterConversion = 0.0;
  String _currentCurrency = '';
  double leiToEurosFactor = 4.9;
  double leiToDollarsFactor = 4.4;
  Map<String, double> map = {
    'euros': 4.9,
    'dollars': 4.4,
  };
  String? _errorText;

  // map  K  V
  // 'mar' : 'aliment ...'
  // 'a manca' : 'actiune'
  //
  // 'euros' : eurosfactor
  // 'dollar' : dollarsfactor
  //
  // map['mar'] -> 'aliment..'
  void _changeMoney(String currency) {
    setState(() {
      _sumBeforeConversion = double.tryParse(_controller.value.text) ?? 0;
      _currentCurrency = currency;
      _sumAfterConversion = _sumBeforeConversion / map[currency]!;

      if (_controller.value.text.isEmpty) {
        _errorText = 'Please insert a sum';
      } else {
        _errorText = null;
      }

      // before map:
      // if (currency == 'euros') {
      //   _sumAfterConversion = _sumBeforeConversion / leiToEurosFactor;
      // } else if (currency == 'dollars') {
      //   _sumAfterConversion = _sumBeforeConversion / leiToDollarsFactor;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                imageUrl,
                height: 200,
              ),
              TextField(
                // 3. Change that variable with SETSTATE
                decoration: InputDecoration(
                  hintText: 'Enter a text',
                  errorText: _errorText,
                ),

                keyboardType: const TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),

                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9,.]+')),
                ],

                onChanged: (text) {
                  setState(() {
                    _changeable = text;
                    _errorText = null;
                  });
                },

                controller: _controller,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                // 2. Use that variable in a widget from build
                _changeable,
                style: GoogleFonts.lato(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _changeMoney('euros');
                    },
                    child: const Text('Convert to euros'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () => _changeMoney('dollars'),
                    child: const Text('Convert to dollars'),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                        'Before: ${_sumBeforeConversion.toStringAsFixed(2)} lei'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                        'After: ${_sumAfterConversion.toStringAsFixed(2)} $_currentCurrency'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
