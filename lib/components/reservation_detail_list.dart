import 'package:flutter/material.dart';
import 'package:gestion_hopital/Theme/app_theme.dart';
import 'package:gestion_hopital/Theme/text_theme.dart';
import 'package:gestion_hopital/screens/ReservationDetails/reservation_detail_screen.dart';
import 'package:gestion_hopital/utils/navigate_screen.dart';
import 'package:intl/intl.dart';
import '../models/ReservationDetails.dart';
import '../models/Status.dart';




class ReservationDetailList extends StatefulWidget {
  const ReservationDetailList({
    Key? key,
    required this.reserveDetailList,
  }) : super(key: key);

  final List<ReservationDetails> reserveDetailList;

  @override
  _ReservationDetailListState createState() => _ReservationDetailListState();
}

class _ReservationDetailListState extends State<ReservationDetailList> {
  String? selectedSortOption;

  @override
  Widget build(BuildContext context) {
    // Sorting Logic
    if (selectedSortOption != null) {
      widget.reserveDetailList.sort((a, b) {
        if (selectedSortOption == 'Ascending') {
          return a.status.name.compareTo(b.status.name);
        } else {
          return b.status.name.compareTo(a.status.name);
        }
      });
    }

    return Column(
      children: [
        // DropdownButton<String>(
        //   value: selectedSortOption,
        //   icon: Icon(Icons.arrow_downward),
        //   iconSize: 24,
        //   elevation: 16,
        //   style: AppTextTheme.listtitle,
        //   underline: Container(
        //     height: 2,
        //     color: AppColors.primaryblue,
        //   ),
        //   onChanged: (String? newValue) {
        //     setState(() {
        //       selectedSortOption = newValue!;
        //     });
        //   },
        //   items: <String>['Ascending', 'Descending']
        //       .map<DropdownMenuItem<String>>((String value) {
        //     return DropdownMenuItem<String>(
        //       value: value,
        //       child: Text(value),
        //     );
        //   }).toList(),
        // ),
        
        Expanded(
          child: ListView.builder(
            itemCount: widget.reserveDetailList.length,
            itemBuilder: (context, index) {
              final item = widget.reserveDetailList[index];
              Color statusColor;
              switch (item.status){
                case Status.PENDINGRESERVE:
                  statusColor = Colors.yellow;
                  break;
                case Status.BORROW:
                  statusColor = Color.fromARGB(255, 59, 213, 255);
                  break;
                case Status.PENDINGRETURN:
                  statusColor = Colors.orange;
                  break;
                case Status.RESERVE:
                  statusColor = Colors.green;
                  break;
                default:
                  statusColor = Colors.grey; 
              }

              return GestureDetector(
                onTap: () {
                  NavigationScreen.navigate(
                      context,
                      ReservationDetailsScreen(
                        Item: item,
                      ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 217, 219),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.equipmentItemId.toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // Text(
                            //   'Quantity: ${item.reservedQuantity}',
                            //   style: TextStyle(fontSize: 14, color: AppColors.black),
                            // ),
              
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Status: ${item.status.name}',
                          style: TextStyle(color: AppColors.black, fontSize: 14),
                        ),),
                        SizedBox(height: 10,),
                          Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.danger,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Return Date: ${DateFormat('dd-MM-yyyy').format(item.returnDate)}',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),),

                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


