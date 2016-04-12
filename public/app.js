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