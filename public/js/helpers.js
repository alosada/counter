const Helpers = {
  overlay: function(){return 'foobar'},
  zeroPad: function(string){
  	string = String(string)
  	while(6 > string.length ){
  	  string = '0' + string;
  	}
    return string
  }
};