function something(){
		var i = window.localStorage.getItem('i');
		alert(i);
    i = i * 1 + 1;
    window.localStorage.setItem('i', i);
	}

function add_to_cart(id){
	var key = 'product_' + id
	x = window.localStorage.getItem(key);
	x = x * 1 + 1
	window.localStorage.setItem(key, x);
	alert(x);
}