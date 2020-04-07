const Helpers = {
  showOverlay: function(targetId){
  	let overlay = document.getElementById('overlay')
  	this.swapOverlay(targetId);
  	overlay.classList.remove('hidden')
  },
  hideOverlay: function(){
  	let overlay = document.getElementById('overlay')
  	overlay.classList.add('hidden')
  	this.swapOverlay(null);
  },
  swapOverlay: function(targetId){
  	let content = document.getElementById('overlay').querySelector('.overlay-content')
  	let target = document.getElementById(targetId);
  	
  	if(content.firstElementChild !== null){
  	  document.getElementById('templates').appendChild(content.firstElementChild);
  	  content.innerHTML = '';
  	}
    if(target !== null){
      content.appendChild(target)
    }
  },
  zeroPad: function(string){
  	string = String(string)
  	while(6 > string.length ){
  	  string = '0' + string
  	}
    return string
  },
  setCurrent: function(data){
    if(Boolean(data.attributes)){
      let zeroPadded = this.zeroPad(data.attributes.counter)
      document.getElementById('current').innerText = zeroPadded
      document.getElementById('current-input').value = data.attributes.counter
    }
  },
  handleResponse: function(response){
    if(response.status === 403){
      sessionStorage.removeItem('token')
      document.helpers.showOverlay('login')
      window.alert('Unauthorized, please log in or register.')
      return {}
    }else{
      return response.json() 
    }
  }
};