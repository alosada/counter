(() => {
  const application = Stimulus.Application.start()

  application.register("counter", class extends Stimulus.Controller {
    static targets = ['registerForm', 'loginForm']
    register(eve){
      eve.preventDefault();
      // MUST move repeted code to a helper
      let formInputs = eve.target.querySelectorAll("input");
      let data = {};
      for( var i=0; i < formInputs.length; i++ ){
      	if(formInputs[i].name != ""){
          data[formInputs[i].name] = formInputs[i].value
      	}
      }
      fetch('/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      })
      .then((response) => {
      	return response.json()
      })
      .then((data) => {
        sessionStorage.setItem("token", data.token);
        document.getElementById('register').classList.add('hidden')
      })
      .catch((error) => {
        window.alert('An error ocurred')
      });
    }
    login(eve){
      eve.preventDefault();
       // MUST move repeted code to a helper
      let formInputs = eve.target.querySelectorAll("input");
      let data = {};
      for( var i=0; i < formInputs.length; i++ ){
      	if(formInputs[i].name != ""){
          data[formInputs[i].name] = formInputs[i].value
      	}
      }
      fetch('/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      })
      .then((response) => {
      	return response.json()
      })
      .then((data) => {
        sessionStorage.setItem("token", data.token);
        document.getElementById('register').classList.add('hidden')
      })
      .catch((error) => {
        window.alert('An error ocurred')
      });
    }
    showRegister(eve){
      eve.preventDefault();
      document.getElementById('login').classList.add('hidden')
      document.getElementById('register').classList.remove('hidden')
    }
    showLogin(eve){
      eve.preventDefault();
      document.getElementById('register').classList.add('hidden')
      document.getElementById('login').classList.remove('hidden')
    }
  })
})()