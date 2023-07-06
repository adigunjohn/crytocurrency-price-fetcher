// void main(){
//   for(int i = 0; i<7; i++){
//     print('hello $i');
//   }
// }

// main (){
//   buyMeat(8);
// }
//
//  void buyMeat (int days){
//   for(int i=1; i< days; i++){
//     print('buying milk on day $i');
//   }
//  }

// main (){
//   writeLyrics(9);
// }
//
// void writeLyrics (int days){
//   for(int i=days; i>0; i--){
//     print('$i bottles of beer on the wall, $i bottles of bear'
//         'Take one down and pass it around, ${i-1} bottles of beer on the wall');
//   }
// }

List<String> phoneBrands = [
  'iphone',
  'samsung',
  'tecno',
  'infinix',
];
    void caseMaker (){
  for(String phoneBrand in phoneBrands){
    print('$phoneBrand case');
  }
    }

    main(){
  caseMaker();
    }