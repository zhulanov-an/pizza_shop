// отображение на кнопке количества позиций
function total_item_in_cart(){
	var total = 0
	var template = 'product_'
	for(var i in localStorage)
		{
		if (i.includes(template)){
			total = localStorage[i] * 1 + total;
		}
	}
	$('#count').text('Count in your cart: ' + total);
}

// добавление в корзину
function add_to_cart(id){
	var key = 'product_' + id
	x = window.localStorage.getItem(key);
	x = x * 1 + 1
	window.localStorage.setItem(key, x);
	total_item_in_cart();//set count orders on button
	update_orders_in_cart();//update text orders in hidden field
}

// удаление из корзины
function remove_from_cart(id){
	var key = 'product_' + id;
	window.localStorage.removeItem(key);
	// var orders = orders_from_cart();
	// $('#orders_input_' + id).val(orders);
	$('#' + key).hide();
	total_item_in_cart();//set count orders on button
	update_orders_in_cart();//update text orders in hidden field
}

// отправка из корзины на оформление
function checkout(){
	var orders = orders_from_cart();
	$('#orders_checkout').val(orders);
}

// получение строки с заказами
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
	orders = orders.slice(0,-1);
	return orders;
}

function update_orders_in_cart(){
	var orders = orders_from_cart();
	$('#orders_input').val(orders);
}


function clear_cart(){
	window.localStorage.clear();
	$('#count').hide();
}