import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/walkthrough_model.dart';
import '../utils/colours.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPureWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  itemBuilder: (BuildContext context, int index) {
                    Future.delayed(Duration.zero, () async {
                      setindex(index);
                    });
                    print("index:$index");
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: index == contents.length - 1
                              ? const SizedBox(height: 14)
                              : GestureDetector(
                            onTap: () => _controller.jumpToPage(2),
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffE8E0EA),
                              ),
                              child: Center(
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Expanded(
                          child: Image.asset(contents[index].image),
                        ),
                        const SizedBox(height: 30),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      contents[index].text,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Roboto',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),


                                  ],
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    contents[index].description,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: kGray,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                height: 10,
                margin: const EdgeInsets.only(bottom: 10),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: contents.length,
                  effect: const WormEffect(
                    radius: 5,
                    dotWidth: 25,
                    dotHeight: 10,
                    activeDotColor: kPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              index != contents.length - 1 ? CircleAvatar(
                radius:40,
                backgroundColor:  kLightGray,
                child: ElevatedButton(
                  onPressed: () => index == contents.length - 1
                      ? Navigator.of(context)
                      .pushReplacementNamed("/getstarted")
                      : _controller.nextPage(
                    duration:
                    const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(4),
                    backgroundColor: kPrimary,
                  ),
                  child:
                  IconButton(
                    icon: const Icon(Icons.arrow_forward,color: kWhite,),
                    onPressed: () {
                      print("elevated index:$index");
                      print("len:${contents.length}");
                      index == contents.length - 1
                          ? Navigator.of(context)
                          .pushReplacementNamed("/getstarted")
                          : _controller.nextPage(
                        duration:
                        const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                ),
              ):
              Container(
                width: 180,
                height: 60,
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xffE8E0EA),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          color: kPrimary
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {

                        print("len:${contents.length}");
                        index == contents.length - 1
                            ? Navigator.of(context)
                            .pushReplacementNamed("/getstarted")
                            : _controller.nextPage(
                            duration:
                            const Duration(milliseconds: 300),
                            curve: Curves.easeOut  );
                      },
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(4),
                        backgroundColor: kPrimary, // <-- Button color

                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setindex(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        this.index = index;
      });
    });
  }
}
