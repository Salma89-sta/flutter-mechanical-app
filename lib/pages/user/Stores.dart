import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/pages/user/user-storesdata.dart';
import '../../basicScreens/login.dart';
import '../../shared/aappBarr.dart';
import '../../shared/bottomnavigationbar.dart';
import '../../shared/imagedrawer.dart';
import '../../shared/listtiteldrawer.dart';
import '../../shared/storeCard.dart';
import '../chat.dart';
import '../myList.dart';


class Stores extends StatelessWidget{
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:AppBBar('Stores'),
      ),
      body: ListView(
        children: [
          //Search(),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('01222487636','مجموعة عز العرب للسيارات','كم 28 طريق القاهرة اسكندرية الصحراوى','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/ezz-elarab-automotive-group-logo_76402_2020_55845.jpg?11220','https://www.google.com/maps/dir//%D9%85%D8%AC%D9%85%D9%88%D8%B9%D8%A9+%D8%B9%D8%B2+%D8%A7%D9%84%D8%B9%D8%B1%D8%A8+%D9%84%D9%84%D8%B3%D9%8A%D8%A7%D8%B1%D8%A7%D8%AA%D8%8C+5+%D8%B7%D8%B1%D9%8A%D9%82+%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9+-+%D8%A7%D9%84%D8%A5%D8%B3%D9%83%D9%86%D8%AF%D8%B1%D9%8A%D8%A9+%D8%A7%D9%84%D8%B5%D8%AD%D8%B1%D8%A7%D9%88%D9%8A%D8%8C+%D8%A7%D9%84%D8%B8%D9%87%D9%8A%D8%B1+%D8%A7%D9%84%D8%B5%D8%AD%D8%B1%D8%A7%D9%88%D9%89+%D9%84%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D8%AC%D9%8A%D8%B2%D8%A9%D8%8C+%D8%A7%D9%84%D8%AC%D9%8A%D8%B2%D8%A9+3620054%E2%80%AD/@30.153977,31.9582375,9z/data=!4m8!4m7!1m0!1m5!1m1!1s0x14585b1a34cb0683:0x87432dd9afc1935e!2m2!1d30.837632!2d30.153977')));
                        },
                        child: Expanded(child: StoreCardds('مجموعة عز العرب للسيارات','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/ezz-elarab-automotive-group-logo_76402_2020_55845.jpg?11220'))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('16565','مراكز تغيير زيوت شل المعتمدة','79 مبنى فيو ش التسعين الجنوبى','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/authorized-shell-oil-change-centers-logo_685530_2021_wa.jpg?11220','https://www.google.com/maps/dir//%D9%85%D8%B1%D8%A7%D9%83%D8%B2+%D8%AA%D8%BA%D9%8A%D9%8A%D8%B1+%D8%B2%D9%8A%D9%88%D8%AA+%D8%B4%D9%84+%D8%A7%D9%84%D9%85%D8%B9%D8%AA%D9%85%D8%AF%D8%A9++%D9%85%D8%A8%D9%86%D9%89+%D9%81%D9%8A%D9%88+%D8%B4+%D8%A7%D9%84%D8%AA%D8%B3%D8%B9%D9%8A%D9%86+%D8%A7%D9%84%D8%AC%D9%86%D9%88%D8%A8%D9%89%E2%80%AD/@30.0750979,31.5654651,11z')));
                        },
                        child: Expanded(child: StoreCardds('مراكز تغيير زيوت شل المعتمدة','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/authorized-shell-oil-change-centers-logo_685530_2021_wa.jpg?11220'))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('01100900742','شركة هاى تك لخدمة وسائل النقل','القطعة 73 امتداد المنطقة الصناعية الثالثة','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/454001_nk_itm.jpg?11220','https://www.google.com/maps/dir//%D8%B4%D8%B1%D9%83%D8%A9+%D9%87%D8%A7%D9%89+%D8%AA%D9%83+%D9%84%D8%AE%D8%AF%D9%85%D8%A9+%D9%88%D8%B3%D8%A7%D8%A6%D9%84+%D8%A7%D9%84%D9%86%D9%82%D9%84%D8%8C+%D8%A7%D9%84%D9%82%D8%B7%D8%B9%D8%A9+73,+%D8%A7%D9%85%D8%AA%D8%AF%D8%A7%D8%AF+%D8%A7%D9%84%D9%85%D9%86%D8%B7%D9%82%D8%A9+%D8%A7%D9%84%D8%B5%D9%86%D8%A7%D8%B9%D9%8A%D8%A9+%D8%A7%D9%84%D8%AB%D8%A7%D9%84%D8%AB%D8%A9%D8%8C+%D8%A7%D9%84%D8%AC%D9%8A%D8%B2%D8%A9%E2%80%AD/@29.9354534,30.9064066,13z/data=!4m8!4m7!1m0!1m5!1m1!1s0x1458ff135e539063:0x112ad1b44658f3c9!2m2!1d30.8714158!2d29.9354769')));
                        },
                        child: Expanded(child: StoreCardds('شركة هاى تك لخدمة وسائل النقل','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/454001_nk_itm.jpg?11220'))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('01222242455','الشركة الوطنية لقطع غيار السيارات ش.م.م','28 ش صلاح الدين','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/el-watania-auto-parts-logo__536709__2017_28010_16287_11278.jpg?11220','https://www.google.com/maps/dir//%D8%A7%D9%84%D8%B4%D8%B1%D9%83%D8%A9+%D8%A7%D9%84%D9%88%D8%B7%D9%86%D9%8A%D8%A9+%D9%84%D9%82%D8%B7%D8%B9+%D8%BA%D9%8A%D8%A7%D8%B1+%D8%A7%D9%84%D8%B3%D9%8A%D8%A7%D8%B1%D8%A7%D8%AA+%D9%88%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D9%8A%D8%B1%D8%A7%D8%AF,+%D8%A7%D9%84%D8%A7%D9%84%D9%85%D8%A7%D9%86%D9%8A%D8%A9,+28+%D8%B4+%D8%B5%D9%84%D8%A7%D8%AD+%D8%A7%D9%84%D8%AF%D9%8A%D9%86,+%D8%A3%D9%85%D8%A7%D9%85+%D8%A7%D9%84%D9%85%D8%AF%D8%B1%D8%B3%D8%A9%D8%8C+%D8%A7%D9%84%D8%B9%D8%B7%D8%A7%D8%B1%D9%8A%D9%86%D8%8C+%D8%A7%D9%84%D8%A5%D8%B3%D9%83%D9%86%D8%AF%D8%B1%D9%8A%D8%A9%E2%80%AD/@31.1916005,29.9327935,13z/data=!4m8!4m7!1m0!1m5!1m1!1s0x14f5c19e601003f1:0x1ddac4436eee4cf7!2m2!1d29.8977836!2d31.1916088')));
                        },
                        child: Expanded(child: StoreCardds('الشركة الوطنية لقطع غيار السيارات ش.م.م','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/el-watania-auto-parts-logo__536709__2017_28010_16287_11278.jpg?11220'))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('01112299824','ابو عدى - ملك الرينو','القطعة 3/65, المحور المركزى','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/abou-oday-king-of-renault-logo_388440-_2022_sh.jpg?11220','https://www.google.com/maps/dir//%D8%A7%D8%A8%D9%88+%D8%B9%D8%AF%D9%89+-+%D9%85%D9%84%D9%83+%D8%A7%D9%84%D8%B1%D9%8A%D9%86%D9%88+-+Abou+Oday+-+King+Of+Renault,+%D8%AF%D8%A7%D8%AE%D9%84+%D8%B7%D9%8A%D8%A8%D8%A9+%D8%AC%D8%B1%D8%A7%D9%86%D8%AF+%D9%85%D9%88%D9%84+%D8%A7%D9%84%D9%82%D8%B7%D8%B9%D8%A9+3,+65+%D8%A7%D9%84%D9%85%D8%AD%D9%88%D8%B1+%D8%A7%D9%84%D9%85%D8%B1%D9%83%D8%B2%D9%8A%D8%8C+%D8%A7%D9%84%D8%AC%D9%8A%D8%B2%D8%A9+12573%E2%80%AD/@29.9484684,30.9453696,13z/data=!4m8!4m7!1m0!1m5!1m1!1s0x1458559b067106a3:0xa11fcd4dcb7988da!2m2!1d30.91035!2d29.948473')));
                        },
                        child: Expanded(child: StoreCardds('ابو عدى - ملك الرينو','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/abou-oday-king-of-renault-logo_388440-_2022_sh.jpg?11220'))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('01222242455','المؤسسة العالمية للسوست الميكانيكية والاشغال المعدنية والزمبليكات','الطريق الدائرى','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/el-alameya-establishment-for-mechanical-springs-manufacturing-metal-works-logo_204781_2019_sh_53955_20071.jpg?11220','https://www.google.com/maps/dir//%D8%A7%D9%84%D9%85%D8%A4%D8%B3%D8%B3%D8%A9+%D8%A7%D9%84%D8%B9%D8%A7%D9%84%D9%85%D9%8A%D8%A9+%D9%84%D9%84%D8%B3%D9%88%D8%B3%D8%AA+%D8%A7%D9%84%D9%85%D9%8A%D9%83%D8%A7%D9%86%D9%8A%D9%83%D9%8A%D8%A9+%D9%88%D8%A7%D9%84%D8%A7%D8%B4%D8%BA%D8%A7%D9%84+%D8%A7%D9%84%D9%85%D8%B9%D8%AF%D9%86%D9%8A%D8%A9+%D9%88%D8%A7%D9%84%D8%B2%D9%85%D8%A8%D9%84%D9%8A%D9%83%D8%A7%D8%AA%D8%8C+%D8%A7%D9%84%D8%B7%D8%B1%D9%8A%D9%82+%D8%A7%D9%84%D8%AF%D8%A7%D8%A6%D8%B1%D9%89%D8%8C+%D9%85%D8%AF%D8%AE%D9%84%D8%8C+%D8%A7%D9%84%D9%85%D8%B1%D8%AC+%D8%A7%D9%84%D8%AC%D8%AF%D9%8A%D8%AF%D8%A9%D8%8C+%D8%A7%D9%84%D9%82%D9%84%D9%8A%D9%88%D8%A8%D9%8A%D8%A9%E2%80%AD/@30.1845463,31.3861836,13z/data=!4m8!4m7!1m0!1m5!1m1!1s0x145813449352747b:0x4f2775cd6cd60a36!2m2!1d31.351164!2d30.184551')));
                        },
                        child: Expanded(child: StoreCardds('المؤسسة العالمية للسوست الميكانيكية','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/el-alameya-establishment-for-mechanical-springs-manufacturing-metal-works-logo_204781_2019_sh_53955_20071.jpg?11220'))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('01144504380','الفلتر ملكو','121 ش رمسيس','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/al-filter-melco-logo_51083_2017_19009.jpg?11220','https://www.google.com/maps/dir//%D9%81%D9%84%D8%AA%D8%B1+%D9%85%D9%84%D9%83%D9%88%D8%8C+121+%D8%B1%D9%85%D8%B3%D9%8A%D8%B3%D8%8C+%D8%A7%D9%84%D8%AC%D9%8A%D8%A7%D8%B1%D8%A9%D8%8C+%D8%A7%D9%84%D8%A3%D8%B2%D8%A8%D9%83%D9%8A%D8%A9%D8%8C+%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9%E2%80%AC+4320121%E2%80%AD/@30.0583649,31.2792328,13z/data=!4m8!4m7!1m0!1m5!1m1!1s0x14584093ea70d541:0xd6f658e60ef73fd!2m2!1d31.2442132!2d30.0583695')));
                        },
                        child: Expanded(child: StoreCardds('الفلتر ملكو','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/al-filter-melco-logo_51083_2017_19009.jpg?11220'))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>StoresData('01152886661 ','شركة الباقورى لتجارة البطاریات','الطريق الدائرى, القومیة','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/albaqoury-co-for-batteries-trading-logo_669805_2021_sh.jpg?11220','')));
                        },
                        child: Expanded(child: StoreCardds('شركة الباقورى لتجارة البطاریات','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/albaqoury-co-for-batteries-trading-logo_669805_2021_sh.jpg?11220'))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('01140449001','المؤسسة المتحدة للاستيراد والتصدير','2 ش ال يوسف','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/united-foundation-for-import-export-logo_379246-_2022_sh.jpg?11220','https://www.google.com/maps/dir//%D8%A7%D9%84%D9%85%D8%A4%D8%B3%D8%B3%D8%A9+%D8%A7%D9%84%D9%85%D8%AA%D8%AD%D8%AF%D8%A9+%D9%84%D9%84%D8%A7%D8%B3%D8%AA%D9%8A%D8%B1%D8%A7%D8%AF+%D9%88%D8%A7%D9%84%D8%AA%D8%B5%D8%AF%D9%8A%D8%B1,+%D9%81%D9%84%D9%81%D9%84%D8%A9%D8%8C+2+%D8%B4+%D8%A7%D9%84+%D9%8A%D9%88%D8%B3%D9%81,+%D8%A8%D8%AC%D9%88%D8%A7%D8%B1%D8%8C+%D8%B7%D8%B1%D9%8A%D9%82+%D8%A7%D9%84%D9%85%D8%B1%D9%8A%D9%88%D8%B7%D9%8A%D8%A9%D8%8C+%D9%81%D9%8A%D8%B5%D9%84%E2%80%AD/@30.004526,31.1740486,13z/data=!4m8!4m7!1m0!1m5!1m1!1s0x145845bafba4ab41:0x588bbeb53d70eb46!2m2!1d31.1390247!2d30.0045334')));
                        },
                        child: Expanded(child: StoreCardds('المؤسسة المتحدة للاستيراد والتصدير','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/united-foundation-for-import-export-logo_379246-_2022_sh.jpg?11220'))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('01007297555 ','Alam El Syarat .Net','3 Badr Tower, Zohour El Maadi City','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/alam-el-syarat-magazine-logo_143152_2022_wa.jpg?11220','https://www.google.com/maps/dir//28QJ%2BVXW+%D8%B9%D8%A7%D9%84%D9%85+%D8%A7%D9%84%D8%B3%D9%8A%D8%A7%D8%B1%D8%A7%D8%AA%D8%8C+%D8%A7%D9%84%D8%AD%D8%AF%D9%8A%D9%82%D8%A9+%D8%A7%D9%84%D8%AF%D9%88%D9%84%D9%8A%D8%A9%D8%8C+Madinet+Nasr%D8%8C+%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9%E2%80%AC+4441221%E2%80%AD/@30.0397419,31.3346377,17z/data=!4m8!4m7!1m0!1m5!1m1!1s0x14583e8d436ae9b3:0x13a05bb99eabdf47!2m2!1d31.3324472!2d30.0397563')));
                        },
                        child: Expanded(child: StoreCardds('Alam El Syarat .Net','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/alam-el-syarat-magazine-logo_143152_2022_wa.jpg?11220'))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData(' 0105 0199412','El Gohary Plast','Plot 124 Block B, 3rd Industrial Zone - 6 Million Zone','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/el-gohary-plast-logo_687717_2022_wa.jpg?11220','https://www.google.com/maps/dir//%D8%AD%D8%A7%D8%B1%D8%A9+%D8%A7%D9%84%D8%AC%D9%88%D9%87%D8%B1%D9%8A%D8%8C+%D8%A3%D9%85%D8%A8%D8%B1%D9%88%D8%B2+%D9%88%D9%85%D8%AD%D8%B1%D9%85+%D8%A8%D9%83%D8%8C+%D9%85%D8%AD%D8%B1%D9%85+%D8%A8%D9%83%D8%8C+%D8%A7%D9%84%D8%A5%D8%B3%D9%83%D9%86%D8%AF%D8%B1%D9%8A%D8%A9+5413450%E2%80%AD/@31.1925511,29.9208341,18.26z/data=!4m8!4m7!1m0!1m5!1m1!1s0x14f5c39a4b0e3837:0xfa11fc9d7a14c661!2m2!1d29.9190806!2d31.1926112')));
                        },
                        child: Expanded(child: StoreCardds('El Gohary Plast','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/el-gohary-plast-logo_687717_2022_wa.jpg?11220'))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData(' 0100 4001291','El Motaheda Co. For Spare Parts','Plot 15B, 1St Industrial Zone C1','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/el-motaheda-co-for-spare-parts-logo_641083_2022_wa.jpg?11220','https://www.google.com/maps/dir//%D8%A7%D9%84%D9%85%D8%AA%D8%AD%D8%AF%D8%A9+%D9%84%D9%82%D8%B7%D8%B9+%D8%A7%D9%84%D8%BA%D9%8A%D8%A7%D8%B1%D8%8C+%D9%82%D8%B3%D9%85+%D8%A3%D9%88%D9%84+%D9%85%D8%AF%D9%8A%D9%86%D8%A9+%D8%B9%D8%B4%D8%B1%D8%A9+%D8%B1%D9%85%D8%B6%D8%A7%D9%86%E2%80%AD/@30.2597242,31.7790702,13z/data=!4m8!4m7!1m0!1m5!1m1!1s0x1457fd50e43e3b75:0x4022a19e470e5894!2m2!1d31.7443739!2d30.2977555')));
                        },
                        child: Expanded(child: StoreCardds('El Motaheda Co. For Spare Parts','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/el-motaheda-co-for-spare-parts-logo_641083_2022_wa.jpg?11220'))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData(' 0100 1156167','Amas For Cars Glass Industry - AMG','Plot 20& 21, Block No. 15, Extension Of Industrial Zone','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/amas-for-cars-glass-industry-amg-logo_489600_2020_wa.jpg?11220','https://www.google.com/maps/place/%D9%85%D8%B5%D9%86%D8%B9+%D8%A7%D9%85%D8%A7%D8%B3+%D9%84%D8%B5%D9%86%D8%A7%D8%B9%D8%A9+%D8%B2%D8%AC%D8%A7%D8%AC+%D8%A7%D9%84%D8%B3%D9%8A%D8%A7%D8%B1%D8%A7%D8%AA+-+%D9%85%D8%A4%D8%B3%D8%B3%D8%A9+%D8%A7%D9%84%D8%B2%D8%A7%D9%88%D9%89%E2%80%AD/@30.3427552,31.5671858,10.08z/data=!4m20!1m13!4m12!1m3!2m2!1d31.2286886!2d30.0527518!1m6!1m2!1s0x14f79c4abdd3ce49:0x633aed5dcbbb1d75!2z2YXYtdmG2Lkg2KfZhdin2LMg2YTYtdmG2KfYudipINiy2KzYp9isINin2YTYs9mK2KfYsdin2KogLSDZhdik2LPYs9ipINin2YTYstin2YjZidiMINin2YTYr9mC2YfZhNmK2KksINin2YTZhdmG2LXZiNix2Kk!2m2!1d31.3781067!2d31.0300906!3e0!3m5!1s0x14f79c4abdd3ce49:0x633aed5dcbbb1d75!8m2!3d31.0300906!4d31.3781067!16s%2Fg%2F11f_b_2r9t')));
                        },
                        child: Expanded(child: StoreCardds('Amas For Cars Glass Industry - AMG','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/amas-for-cars-glass-industry-amg-logo_489600_2020_wa.jpg?11220'))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('0103 2224880','دكتور نانو سيراميك','الحى 11, السادس من اكتوبر, الجيزة امام مدينة الثقافة والعلوم','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/dr-nano-ceramic-logo_594821_2022_sh.jpg?11220','https://www.google.com/maps/place/Dr+Nano+Ceramic/@30.0473605,31.2849945,13z/data=!4m23!1m16!4m15!1m6!1m2!1s0x14584130f7e3b17d:0x3f116fa12adccd34!2zRHIgTmFubyBDZXJhbWljLCDYudio2K8g2KfZhNi52LLZitiy2Iwg2LrZiti3INin2YTYudiv2KnYjCDYp9mE2YXZiNiz2YPZidiMINmF2K3Yp9mB2LjYqSDYp9mE2YLYp9mH2LHYqeKArCA0MjgzMDQ1!2m2!1d31.2499749!2d30.0473652!1m6!1m2!1s0x14584130f7e3b17d:0x3f116fa12adccd34!2zRHIgTmFubyBDZXJhbWljLCDYudio2K8g2KfZhNi52LLZitiy2Iwg2LrZiti3INin2YTYudiv2KnYjCDYp9mE2YXZiNiz2YPZidiMINmF2K3Yp9mB2LjYqSDYp9mE2YLYp9mH2LHYqeKArCA0MjgzMDQ1!2m2!1d31.2499749!2d30.0473652!3e2!3m5!1s0x14584130f7e3b17d:0x3f116fa12adccd34!8m2!3d30.0473651!4d31.2499749!16s%2Fg%2F11gg721d3g')));
                        },
                        child: Expanded(child: StoreCardds('دكتور نانو سيراميك','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/dr-nano-ceramic-logo_594821_2022_sh.jpg?11220'))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('00201143482136','تاوبلاست','القطعة 15ب, المنطقة الصناعية الاولى C1, العاشر من رمضان','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/tawplast-logo_154680_2020_sh.jpg?1','https://www.google.com/maps/place/Tawplast/@30.2396491,31.8163324,13z/data=!4m23!1m16!4m15!1m6!1m2!1s0x14f8395ee73f3a23:0x3eaf927e654ef99!2z2LTYsdmD2Kkg2KfZhNi52KfYtNixINmF2YYg2LHZhdi22KfZhiDZhNi12YbYp9i52KfYqiDYp9mE2YPYsdiq2YjZhiAtINmD2KfYsdiq2K_Yp9mG2Iwg2KfZhNmF2YbYt9mC2Kkg2KfZhNi12YbYp9i52YrYqSDYp9mE2KfZiNmE2YkgQzEg2YLYt9i52KkgOCDYqNis2YjYp9ixINmF2LXZhti5INin2YTYp9iz2KrYp9iwINmE2YTYo9it2LDZitip2Iwg2KfZhNi52KfYtNixINmF2YYg2LHZhdi22KfZhtiMINin2YTYtNix2YLZitip!2m2!1d31.7331!2d30.29953!1m6!1m2!1s0x1457fd4a6002417b:0x213dc751a729afb8!2zVGF3cGxhc3QsIE5lYXIsINin2YTYtNix2YLZitip!2m2!1d31.7954893!2d30.2337691!3e2!3m5!1s0x1457fd4a6002417b:0x213dc751a729afb8!8m2!3d30.2337691!4d31.7954893!16s%2Fg%2F11f5n7rsqq')));
                        },
                        child: Expanded(child: StoreCardds('تاوبلاست','https://cdn.yellowpages.com.eg/static/modules/uploads/logos/tawplast-logo_154680_2020_sh.jpg?1'))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData(' 0127 8213108','ابراهيم الطباخ لقطع غيار السيارات','36 ش صلاح الدين','https://cdn.yellowpages.com.eg/static/v2022/img/closed-logo.png?1','https://www.google.com/maps/dir//%D8%B4%D8%B1%D9%83%D8%A9+%D8%A7%D9%8A%D9%85%D9%86+%D8%A7%D9%84%D8%B7%D8%A8%D8%A7%D8%AE+%D9%84%D9%82%D8%B7%D8%B9+%D8%BA%D9%8A%D8%A7%D8%B1+%D8%A7%D9%84%D9%85%D8%B1%D8%B3%D9%8A%D8%AF%D8%B3%D8%8C+4CW2%2B97C%D8%8C+%D9%8A%D8%AD%D9%8A%D9%89+%D8%B9%D9%8A%D8%AF%D8%8C+%D8%A8%D8%B1%D9%83%D8%A9+%D8%A7%D9%84%D9%86%D8%B5%D8%B1%D8%8C+%D8%A3%D9%88%D9%84+%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85%D8%8C+%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9%E2%80%AC%D8%8C%D8%8C+%D9%82%D8%B3%D9%85+%D8%A3%D9%88%D9%84+%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85%E2%80%AD/@30.1459324,31.4356632,13z/data=!3m1!4b1!4m9!4m8!1m0!1m5!1m1!1s0x14581779e9c9562f:0xf0fb50cdd641fa1e!2m2!1d31.4006482!2d30.1459376!3e2')));
                        },
                        child: Expanded(child: StoreCardds('ابراهيم الطباخ لقطع غيار السيارات','https://cdn.yellowpages.com.eg/static/v2022/img/closed-logo.png?1'))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('0122 6146069','ابراهيم العدوى','7 حارة الشرفاء - متفرع من ش الخطيرى - وكالة البلح','https://cdn.yellowpages.com.eg/static/v2022/img/closed-logo.png?1','https://www.google.com/maps/dir//%D8%A7%D8%A8%D8%B1%D8%A7%D9%87%D9%8A%D9%85+%D8%A7%D9%84%D8%B9%D8%AF%D9%88%D9%89%D8%8C+7+%D8%AD%D8%A7%D8%B1%D8%A9+%D8%A7%D9%84%D8%B4%D8%B1%D9%81%D8%A7%D8%A1+-+%D9%85%D8%AA%D9%81%D8%B1%D8%B9+%D9%85%D9%86+%D8%B4+%D8%A7%D9%84%D8%AE%D8%B7%D9%8A%D8%B1%D9%89%D8%8C+%D8%A8%D9%88%D9%84%D8%A7%D9%82%D8%8C+%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9%D8%8C+%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9+%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9%E2%80%AC+4312204%E2%80%AD/@30.0571869,31.2692782,13z/data=!3m1!4b1!4m9!4m8!1m0!1m5!1m1!1s0x145840ebd4c24f43:0x3dbc914b5751bee4!2m2!1d31.234259!2d30.0571909!3e2')));
                        },
                        child: Expanded(child: StoreCardds('ابراهيم العدوى','https://cdn.yellowpages.com.eg/static/v2022/img/closed-logo.png?1'))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('02 25744764','ابراهيم امين سليمان','9 ش زكى','https://cdn.yellowpages.com.eg/static/v2022/img/closed-logo.png?1','https://www.google.com/maps/place/%D8%B3%D9%88%D9%82+%D8%A7%D9%84%D8%AA%D9%88%D9%81%D9%8A%D9%82%D9%8A%D8%A9+%D9%84%D9%82%D8%B7%D8%B9+%D8%BA%D9%8A%D8%A7%D8%B1+%D8%A7%D9%84%D8%B3%D9%8A%D8%A7%D8%B1%D8%A7%D8%AA%E2%80%AD/@30.0523241,31.2432876,402m/data=!3m1!1e3!4m22!1m15!4m14!1m6!1m2!1s0x14584162720b3287:0xf76ae1b9bb9c637b!2zOSDYtNin2LHYuSDYudiv2YTZitiMIDkg2LTYp9ix2Lkg2LnYr9mE2YrYjCDYp9mE2YHZiNin2YTYqdiMINi52KfYqNiv2YrZhtiMINmF2K3Yp9mB2LjYqSDYp9mE2YLYp9mH2LHYqeKArCAxMTIxMQ!2m2!1d31.2451544!2d30.05153!1m6!1m2!1s0x14584162720b3287:0xf76ae1b9bb9c637b!2zOSDYtNin2LHYuSDYudiv2YTZitiMIDkg2LTYp9ix2Lkg2LnYr9mE2YrYjCDYp9mE2YHZiNin2YTYqdiMINi52KfYqNiv2YrZhtiMINmF2K3Yp9mB2LjYqSDYp9mE2YLYp9mH2LHYqeKArCAxMTIxMQ!2m2!1d31.2451544!2d30.05153!3m5!1s0x14583f86b26a7bef:0x6648507db5202bd2!8m2!3d30.0528978!4d31.2427398!16s%2Fg%2F11b5plc44p')));
                        },
                        child: Expanded(child: StoreCardds('ابراهيم امين سليمان','https://cdn.yellowpages.com.eg/static/v2022/img/closed-logo.png?1'))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('0114 4442806','ابن ثابت لقطع غيار السيارات','9 ش الوحدة المحلية','https://cdn.yellowpages.com.eg/static/v2022/img/closed-logo.png?1','https://www.google.com/maps/dir//%D8%A7%D9%84%D8%AD%D9%85%D8%AF+%D9%84%D9%82%D8%B7%D8%B9+%D8%BA%D9%8A%D8%A7%D8%B1+%D8%A7%D9%84%D8%B3%D9%8A%D8%A7%D8%B1%D8%A7%D8%AA%D8%8C+%D8%A7%D9%84%D8%B4%D8%A7%D8%B1%D8%B9+%D8%A7%D9%84%D8%B9%D9%85%D9%88%D9%85%D9%89%D8%8C+%D8%A8%D9%84%D9%82%D8%B3%D8%8C+%D9%85%D8%B1%D9%83%D8%B2+%D9%82%D9%84%D9%8A%D9%88%D8%A8%D8%8C+%D8%A7%D9%84%D9%82%D9%84%D9%8A%D9%88%D8%A8%D9%8A%D8%A9+6313514%E2%80%AD/@30.1757772,31.27515,21z/data=!4m8!4m7!1m0!1m5!1m1!1s0x14581537a3285527:0xd89079f833535121!2m2!1d31.2750212!2d30.1757667')));
                        },
                        child: Expanded(child: StoreCardds('ابن ثابت لقطع غيار السياراتر','https://cdn.yellowpages.com.eg/static/v2022/img/closed-logo.png?1'))),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => StoresData('0114 0287071','ابناء بدير لقطع غيار السيارات','93 ش ترعة المنصورية - برطس','https://cdn.yellowpages.com.eg/static/v2022/img/closed-logo.png?1','https://www.google.com/maps/place/%D8%A8%D8%B1%D8%B7%D8%B3%D8%8C+%D9%85%D8%B1%D9%83%D8%B2+%D8%A3%D9%88%D8%B3%D9%8A%D9%85%D8%8C+%D8%A7%D9%84%D8%AC%D9%8A%D8%B2%D8%A9+3676401%E2%80%AD/@30.1442089,31.1317004,21z/data=!4m19!1m12!4m11!1m3!2m2!1d31.131697!2d30.144195!1m6!1m2!1s0x0:0xdb4a34c14240bb4f!2zNDRWSitKSkfYjCDYqNix2LfYs9iMINmF2LHZg9iyINij2YjYs9mK2YXYjNiMINio2LHYt9iz2Iwg2YXYsdmD2LIg2KPZiNiz2YrZhdiMINin2YTYrNmK2LLYqdiM2IwgT3NzaW0sIEVneXB0!2m2!1d31.1315116!2d30.1441798!3m5!1s0x145869d6037af89d:0x20db5e9ebfb47c18!8m2!3d30.1441798!4d31.1315116!16s%2Fg%2F11g64r8s4j')));
                        },
                        child: Expanded(child: StoreCardds('ابناء بدير لقطع غيار السيارات','https://cdn.yellowpages.com.eg/static/v2022/img/closed-logo.png?1'))),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar:bottomnavigationbar(2),
      drawer: Drawer(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 300,
                child:
                FutureBuilder(
                    future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return Text('No Data');
                      }
                      return ImageDrawer(snapshot.data['image'], snapshot.data['name']);
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:18),
                child: listtitel('My.list','قائمه المواعيد',Icon(Icons.wysiwyg_rounded),(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyList()));}),
              ),
              listtitel('chats','My.Chats',Icon(Icons.chat),(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Chats()));}),
              listtitel('Logout','Bye-Bye!',Icon(Icons.logout,size: 20,),(){Navigator.push(context, MaterialPageRoute(builder: (context)=> Firts() ));}),
            ],
          ),
        ),
      ),
    );
  }
}