import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_firstapp/models/IT.dart';
import 'package:my_firstapp/models/categories.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categoriedata = CategoryModel.getcategories();
  List<ITModel> ITdata = ITModel.getIT();
  String? selectedIcon; // To track the currently selected icon
  List<String> selectedCategories = []; // To store selected categories

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          categories(),
          Expanded(child: IT()), // Display IT list based on selected categories
        ],
      ),
    );
  }

  Widget categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.all(17),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Define the categories based on the SVG icon clicked
                    selectedIcon = categoriedata[index].vector;
                    if (selectedIcon!.contains('app.svg')) {
                      selectedCategories = ['app developer',];
                    } else if (selectedIcon!.contains('web.svg')) {
                      selectedCategories = ['front end developer', 'full stack developer'];
                    } else if (selectedIcon!.contains('AI.svg')) {
                      selectedCategories = ['Artificial Intelligence', 'python developer'];
                    } else if (selectedIcon!.contains('notify.svg')) {
                      selectedCategories = ['backend developer'];
                    } else {
                      selectedCategories.clear(); // Reset selection if needed
                    }
                    print('Selected categories: $selectedCategories'); // Debug print
                  });
                },
                child: Container(
                  height: 60,
                  width: 50,
                  child: SvgPicture.asset(categoriedata[index].vector),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: selectedIcon == categoriedata[index].vector
                            ? const Color.fromARGB(104, 155, 39, 176)
                            : Colors.black12,
                        offset: Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                    color: selectedIcon == categoriedata[index].vector
                        ? Color.fromARGB(125, 97, 36, 108)
                        : Colors.white,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 53),
            itemCount: categoriedata.length,
          ),
        ),
      ],
    );
  }

  Container header() {
    return Container(
      color: Color.fromARGB(255, 56, 18, 62),
      height: 350,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hi user!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(11),
                child: SvgPicture.asset(
                  'assets/vectors/notification.svg',
                  fit: BoxFit.contain,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "let's find\nbest IT Professionals",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 56),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ),
              hintText: "search here",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget IT() {
    // Show all IT data if no category is selected
    List<ITModel> filteredITdata = selectedCategories.isEmpty
        ? ITdata
        : ITdata.where((it) {
            return selectedCategories.contains(it.category);
          }).toList();

    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemBuilder: (context, index) {
        return Container(
          height: 150,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 247, 163, 157).withOpacity(0.5),
                offset: Offset(0, 4),
                blurRadius: 20,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 90,
                decoration: BoxDecoration(
                  color: filteredITdata[index].imagebox,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(filteredITdata[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      filteredITdata[index].name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      filteredITdata[index].category,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Specialities:",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Wrap(
                      spacing: 4,
                      children: filteredITdata[index].specialities.map((speciality) {
                        return Text(
                          speciality,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Score:",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    filteredITdata[index].score.toString(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: filteredITdata.length,
    );
  }
}
