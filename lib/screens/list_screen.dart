import 'package:demo_maps/model/business_near_by.dart';
import 'package:flutter/material.dart';

class BusinessListScreen extends StatelessWidget {
  final BusinessNearBy businessNearBy;
  const BusinessListScreen({super.key, required this.businessNearBy});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Business List"),
      ),
      body: businessNearBy.places != null
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: businessNearBy.places!.length,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var itemVal = businessNearBy.places![index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: sharedContainerProfileWidget(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        userName: itemVal.displayName!.text.toString(),
                        textTheme: textTheme,
                        address: itemVal.formattedAddress.toString(),
                        mobileNum: itemVal.internationalPhoneNumber.toString(),
                        occupation: itemVal.websiteUri.toString(),
                        containerBackgroundColor: Colors.blue.withOpacity(0.08),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                );
              },
            )
          : SizedBox(
              width: screenWidth,
              height: screenHeight * 0.4,
              child: const Center(
                child: Text(
                  "noData Found",
                ),
              ),
            ),
    );
  }
}

class sharedContainerProfileWidget extends StatelessWidget {
  const sharedContainerProfileWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.userName,
    required this.textTheme,
    required this.address,
    required this.mobileNum,
    required this.occupation,
    required this.containerBackgroundColor,
  });

  final double screenWidth;
  final double screenHeight;
  final String userName;
  final TextTheme textTheme;
  final String address;
  final String mobileNum;
  final String occupation;
  final Color containerBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.2,
        decoration: BoxDecoration(
          color: containerBackgroundColor,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: LayoutBuilder(
          builder: (context, boxConstraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.22,
                  height: boxConstraints.maxHeight * 0.7,
                  margin: const EdgeInsets.only(left: 18, top: 18),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://www.posist.com/restaurant-times/wp-content/uploads/2016/04/traits-successful-restaurant-business.jpg"),
                    ),
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "$address",
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "$mobileNum",
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            occupation,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
