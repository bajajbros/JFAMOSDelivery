import 'package:flutter/material.dart';
import 'package:jfamosdelivery/helper/consts.dart';
class Legal extends StatelessWidget {
  
  const Legal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            'Create Password',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'fredoka',
                color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              ListTile(
                style: ListTileStyle.list,
                tileColor: Colors.white,
                leading: Icon(
                  Icons.info,
                  color: kGreenColor,
                ),
                title: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'About us',
                    style: TextStyle(
                        fontSize: 38,
                        fontFamily: 'fredoka',
                        color: kGreenColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: Text('''Eiusmod laborum dolore incididunt cillum. Velit quis magna ea mollit amet do adipisicing qui. Officia minim nulla exercitation excepteur consectetur. Excepteur amet consectetur laboris fugiat laborum pariatur ipsum minim nisi qui.
        
        Aute pariatur nulla minim elit officia sunt tempor commodo ad officia fugiat. Laboris incididunt excepteur velit mollit do laboris ut laboris mollit esse. Sint enim dolor eiusmod duis. Officia nisi id pariatur adipisicing deserunt do labore ex aliquip. Culpa culpa velit eiusmod labore reprehenderit reprehenderit non ullamco irure. Ea sint sit aliqua dolore labore sunt Lorem consectetur cupidatat aute enim.
        
        Id enim tempor esse aliquip dolor exercitation sint sunt elit sint adipisicing sit deserunt. Sint sint sint id eiusmod est. Ad proident commodo anim et laboris deserunt fugiat aute labore duis labore fugiat nisi. Ut consectetur aute voluptate commodo est non in irure est. Nisi incididunt minim elit id cupidatat sint amet pariatur commodo nostrud id ad nisi.
        
        Qui eiusmod ea veniam dolore. Id nisi laborum dolore dolor reprehenderit ut cupidatat irure quis. Ut consectetur tempor eiusmod pariatur ut anim sint voluptate exercitation adipisicing cupidatat. Esse laboris exercitation incididunt cupidatat eu nostrud velit est. ''', style: TextStyle(
                        fontFamily: 'fredoka',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
        ),),
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                title: Text(
                  'About us',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'fredoka',
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                subtitle: Text('''Cupidatat fugiat dolore aliquip ea veniam ex consectetur enim laborum ex. Eu nisi ad et cupidatat aliqua Lorem aute do proident esse excepteur tempor ea. Magna consectetur culpa enim ullamco elit anim Lorem enim proident qui eu quis aliquip. Labore occaecat pariatur duis non magna non commodo nulla excepteur dolor.
        
        Enim velit enim non occaecat laboris occaecat aute pariatur sint ut. Dolore dolor irure quis commodo esse magna aute mollit. Do proident sit ex qui eu ut non consequat sit enim dolore exercitation ipsum magna. Non qui laboris ad proident qui incididunt dolor eiusmod nulla. Sunt aliquip dolor elit reprehenderit. Commodo qui duis tempor culpa duis veniam ea dolor duis occaecat Lorem non et.''')
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                title: Text(
                  'About us',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'fredoka',
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                subtitle: Text('''Eiusmod laborum dolore incididunt cillum. Velit quis magna ea mollit amet do adipisicing qui. Officia minim nulla exercitation excepteur consectetur. Excepteur amet consectetur laboris fugiat laborum pariatur ipsum minim nisi qui.
        
        Aute pariatur nulla minim elit officia sunt tempor commodo ad officia fugiat. Laboris incididunt excepteur velit mollit do laboris ut laboris mollit esse. Sint enim dolor eiusmod duis. Officia nisi id pariatur adipisicing deserunt do labore ex aliquip. Culpa culpa velit eiusmod labore reprehenderit reprehenderit non ullamco irure. Ea sint sit aliqua dolore labore sunt Lorem consectetur cupidatat aute enim.
        
        Id enim tempor esse aliquip dolor exercitation sint sunt elit sint adipisicing sit deserunt. Sint sint sint id eiusmod est. Ad proident commodo anim et laboris deserunt fugiat aute labore duis labore fugiat nisi. Ut consectetur aute voluptate commodo est non in irure est. Nisi incididunt minim elit id cupidatat sint amet pariatur commodo nostrud id ad nisi.
        
        Qui eiusmod ea veniam dolore. Id nisi laborum dolore dolor reprehenderit ut cupidatat irure quis. Ut consectetur tempor eiusmod pariatur ut anim sint voluptate exercitation adipisicing cupidatat. Esse laboris exercitation incididunt cupidatat eu nostrud velit est. ''')
              ),
              
            ],
          ),
        )
    );
  }
}