import 'package:the_nice_funstantic_park/data/list_halaman_utama.dart';

List ceklist(int kategori)
{
  List hasil;
  if(kategori == 1 )
  {
    hasil = destinasiData;
  }else if(kategori==2){
    hasil = playgroundData ;
  }
  else if(kategori==3){
    hasil = restoranData ;
  }
  else{
    hasil=[];
  }

  return hasil;
}