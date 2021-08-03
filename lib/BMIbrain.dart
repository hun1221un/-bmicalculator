import 'dart:math';


class BmiBrain{

  final int height;
  final int weight;

  double _bMInumber;

  BmiBrain(this.height,this.weight);

  String calculateBMI(){
      _bMInumber = weight/pow(height/100, 2);
      return _bMInumber.toStringAsFixed(1);
  }

  String result(){
    if (_bMInumber >= 25){
      return 'Overweight';
    }else if (_bMInumber > 18.5){
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }

  String instructor(){
    if (_bMInumber >= 25){
      return 'You should eat more';
    }else if (_bMInumber > 18.5){
      return 'You are normal';
    }else {
      return 'You should eat less';
    }
  }


}

