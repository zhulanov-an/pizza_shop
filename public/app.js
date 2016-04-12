function total_item_in_cart(){
	var total = 0
	var template = 'product_'
	for(var i in localStorage)
		{
		if (i.includes(template)){
			total = localStorage[i] * 1 + total;
		}
	}
	document.getElementById("count").innerHTML = 'Count in your cart: ' + total;
}

function add_to_cart(id){
	var key = 'product_' + id
	x = window.localStorage.getItem(key);
	x = x * 1 + 1
	window.localStorage.setItem(key, x);
	total_item_in_cart();
}

function orders_from_cart(){
	// product_1 = 2, product_3 = 1
	var orders = '';
	var template = 'product_'
	for (var i = 0; i < window.localStorage.length; i++){
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);
		if (key.includes(template)){
			orders = orders + key + '=' + value + ',';
		}
	}
	console.log(orders);
}

