function something(){
		var i = window.localStorage.getItem('i');
		window.localStorage.setItem('i', 555);
		alert(i);
	}