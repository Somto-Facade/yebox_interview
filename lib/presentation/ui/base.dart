import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yebox_interview/data/constants/assets.dart';
import 'package:yebox_interview/data/responses/team_data_response.dart';
import 'package:yebox_interview/data/services/api/api_service.dart';
import 'package:yebox_interview/di/get_it.dart';
import 'package:yebox_interview/presentation/components/card_widget.dart';

import '../../data/constants/sizes_constants.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  TeamDataRes? clubDetails;
  bool isLoading = true;
  @override
  void initState() {
    getMatches();
    super.initState();
  }
  void getMatches()async{
     clubDetails= await getItInstance<ApiServiceImpl>().getMatches();
    setState(() {
      isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_25),
      child: isLoading? const CircularProgressIndicator()
          :clubDetails==null? SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWidget(borderRadius: Sizes.dimen_20,
                  height: Sizes.dimen_150,
                  width: Sizes.dimen_150,
                  margin: const EdgeInsets.only(bottom: Sizes.dimen_30,),
                  child: Image.asset(Assets.error)
              ),
              Text(
                'Oops! \nCannot get data',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade800,
                    fontSize: Sizes.dimen_22
                ),
              ),
            ],
          )
      ): Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:Sizes.dimen_70, bottom: Sizes.dimen_10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BUNDESLIGA',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade800,
                      fontSize: Sizes.dimen_30
                  ),
                ),
                Image.asset(Assets.bundesliga, height: Sizes.dimen_50, width: Sizes.dimen_90, fit: BoxFit.fill,)
              ],
            )
          ),
          const Text(
            'Club with most wins in the last 30 days:',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Sizes.dimen_18
            ),
          ),
          CardWidget(borderRadius: Sizes.dimen_20,
          height: Sizes.dimen_220,
          width: Sizes.dimen_220,
          margin: const EdgeInsets.only(bottom: Sizes.dimen_30, top: Sizes.dimen_50),
          child: clubDetails!.crestUrl[clubDetails!.crestUrl.length-1]+clubDetails!.crestUrl[clubDetails!.crestUrl.length-2]+clubDetails!.crestUrl[clubDetails!.crestUrl.length-3]!='gvs'
              ?Image.network(clubDetails!.crestUrl):SvgPicture.network(clubDetails!.crestUrl)
          ),
          CardWidget(
            borderRadius: Sizes.dimen_4,
            padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_8, horizontal: Sizes.dimen_15),
            child: Text(
                clubDetails!.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.dimen_38
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:Sizes.dimen_70, bottom: Sizes.dimen_20),
            child: Text(
              'Address: ${clubDetails!.address}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.dimen_18
              ),
            ),
          ),
          Text(
            'Email: ${clubDetails!.email}',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.dimen_18
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:Sizes.dimen_20, bottom: Sizes.dimen_20),
            child: Text(
              'website: ${clubDetails!.website}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                  fontSize: Sizes.dimen_18
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
