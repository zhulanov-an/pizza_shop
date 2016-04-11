function something(){
		var i = window.localStorage.getItem('i');
		alert(i);
    i = i * 1 + 1;
    window.localStorage.setItem('i', i);
	}

function add_to_cart(id){
	x = window.localStorage.getItem('product_' + id);
	x = x * 1 + 1
	window.localStorage.setItem('product_' + id, x);
	alert(x);
}