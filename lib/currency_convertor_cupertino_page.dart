import "package:flutter/cupertino.dart";

class CurrencyConvertorCupertinoPage extends StatefulWidget {
  const CurrencyConvertorCupertinoPage({super.key});

  @override
  State<CurrencyConvertorCupertinoPage> createState() =>
      _CurrencyConvertorCupertinoPageState();
}

class _CurrencyConvertorCupertinoPageState
    extends State<CurrencyConvertorCupertinoPage> {
  double res = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemYellow,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemYellow,
        middle: Text(
          'Currency Calculator',
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'INR ${res != 0 ? res.toStringAsFixed(2) : res.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemPink),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CupertinoTextField(
                // backgroundColor: Color.fromARGB(255, 37, 155, 82),
                controller: textEditingController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                padding: const EdgeInsets.all(15.0),
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 20,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGreen,
                  border: Border.all(
                      color: CupertinoColors.black,
                      width: 6,
                      strokeAlign: BorderSide.strokeAlignInside),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                placeholder: "Please enter amount in USD",
                placeholderStyle: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 20,
                ),
                prefix: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    CupertinoIcons.money_dollar_circle,
                    color: CupertinoColors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
            //button
            Container(height: 10),

            CupertinoButton(
              onPressed: () {
                setState(() {
                  res = double.parse(textEditingController.text) * 81;
                });
              },
              borderRadius: BorderRadius.circular(60),
              color: CupertinoColors.black,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.money_dollar_circle_fill,
                    color: CupertinoColors.white,
                    size: 24,
                  ),
                  Text(
                    "Convert",
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
