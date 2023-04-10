import 'package:olympusfood/screens/navigation.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkModeEnabled = false;
  bool isAlunoSelected = true;

  final PageController _pageController = PageController();

  final List<String> _images = [
    'https://picsum.photos/200',
    'https://picsum.photos/201',
    'https://picsum.photos/202',
  ];

  final lightTheme = ThemeData(
    primaryColor: Colors.green,
    backgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  final darkTheme = ThemeData(
    primaryColor: Colors.grey[900]!,
    backgroundColor: Colors.grey[800]!,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkModeEnabled ? darkTheme : lightTheme,
      home: Scaffold(
        bottomNavigationBar: Navigation(),
        backgroundColor: isDarkModeEnabled ? Colors.grey[800] : Colors.white,
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://www.w3schools.com/howto/img_avatar.png'),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nº da matrícula',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '123456',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Olá, Maria Clara',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isDarkModeEnabled = !isDarkModeEnabled;
                          });
                        },
                        icon: Icon(
                          isDarkModeEnabled
                              ? Icons.nightlight_round
                              : Icons.wb_sunny,
                          color:
                              isDarkModeEnabled ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAlunoSelected = !isAlunoSelected;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isAlunoSelected = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isAlunoSelected
                                  ? Colors.green
                                  : Colors.grey[400],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Aluno',
                                style: TextStyle(
                                  color: isAlunoSelected
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isAlunoSelected = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isAlunoSelected
                                  ? Colors.grey[400]
                                  : Colors.green,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Responsável',
                                style: TextStyle(
                                  color: isAlunoSelected
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 150, // altere o valor da altura para o desejado
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: PageIndicatorContainer(
                  length: _images.length,
                  align: IndicatorAlign.bottom,
                  indicatorColor: Colors.grey,
                  indicatorSelectorColor: Colors.green,
                  child: PageView(
                    controller: _pageController,
                    children: _images.map((imageUrl) {
                      return Container(
                        width: double.infinity,
                        height: 100, // altere o valor da altura para o desejado
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(children: [
                  CircleAvatar(
                      backgroundColor: Color(0xFF49B417),
                      child: Icon(Icons.abc_outlined)),
                  Text("Cardápio")
                ]),
                Column(children: [
                  CircleAvatar(
                      backgroundColor: Color(0xFF49B417),
                      child: Icon(Icons.abc_outlined)),
                  Text("Histórico")
                ]),
                Column(children: [
                  CircleAvatar(
                      backgroundColor: Color(0xFF49B417),
                      child: Icon(Icons.abc_outlined)),
                  Text("Favoritos")
                ]),
              ]),
              SizedBox(height: 10),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 200,
                  child: Column(children: [
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Carteira Digital",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ]),

                    //  Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text("******")
                    //         ],
                    //       ))
                    Row(children: [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Carteira Digital",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.start,
                              ),
                              Text("******")
                            ],
                          ))
                    ]),
                    Row(children: [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Carteira Digital",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.start,
                              ),
                              Text("******")
                            ],
                          ))
                    ]),
                  ]),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 197, 191, 191),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ))
            ])),
      ),
    );
  }
}
