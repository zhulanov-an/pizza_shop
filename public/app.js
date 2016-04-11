function something(){
		var i = window.localStorage.getItem('i');
		alert(i);
    i = i * 1 + 1;
    window.localStorage.setItem('i', i);
	}