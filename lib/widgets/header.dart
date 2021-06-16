import 'package:flutter/material.dart';
import 'package:walletui/data.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Michael Wallet',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(boxShadow: customShadow,color: primaryColor,shape: BoxShape.circle),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(boxShadow: customShadow,color: Colors.deepOrange,shape: BoxShape.circle),
            
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(boxShadow: customShadow,color: primaryColor,shape: BoxShape.circle),
            
                  ),
                ),
                Center(
                  child: Icon(Icons.notifications),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}