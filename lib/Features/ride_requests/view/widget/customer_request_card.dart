import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Features/ride_requests/view_model/ride_request_cubit/ride_request_cubit.dart';

import '../../../UserHome/Model/ride_request_model.dart';
import 'customer_request_details_dialog.dart';

class CustomerRequestCard extends StatelessWidget {
  const CustomerRequestCard(
      {super.key, required this.rideRequest, required this.cupit});
  final RideRequestCubit cupit;

  final RideRequestModel rideRequest;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => customerRequestDetailsDialog(
          context: context, rideRequest: rideRequest, cupit: cupit),
      child: SizedBox(
        width: double.infinity,
        height: 90.h,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),
          ),
          color: const Color(0xff2C3333),
          child: Padding(
            padding: EdgeInsets.only(left: 12.w, top: 2.h),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.w),
                        child: Image.network(
                            'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      rideRequest.rideType!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      formatTimeDifference(
                          DateTime.parse(rideRequest.dateTime!),
                          DateTime.now()),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: .3.sh),
                      child: Text(
                        rideRequest.destinationText!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: .3.sh),
                      child: Text(
                        rideRequest.pickUpText!,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        children: [
                          TextSpan(
                              text: rideRequest.targetPrice,
                              style: const TextStyle(color: Colors.redAccent)),
                          WidgetSpan(child: SizedBox(width: 8.w)),
                          const TextSpan(text: '~1K'),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String formatTimeDifference(DateTime date1, DateTime date2) {
  Duration difference = date2.difference(date1);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds} sec ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} min ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} h ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days ago';
  } else {
    int weeks = difference.inDays ~/ 7;
    return '$weeks weeks ago';
  }
}
