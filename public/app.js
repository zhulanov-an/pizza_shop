// отображение на кнопке количества позиций
function set_total_item_on_button(){
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
	set_total_item_on_button();//set count orders on button
	update_orders_in_cart();//update text orders in hidden field
}

// удаление из корзины
function remove_from_cart(id){
	var key = 'product_' + id;
	window.localStorage.removeItem(key);
	$('#' + key).hide();
	set_total_sum();
	set_total_item_on_button();//set count orders on button
	update_orders_in_cart();//update text orders in hidden field
	checkout();
	remove_order_button();
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

// обновление заказов в корзине в скрытой форме
function update_orders_in_cart(){
	var orders = orders_from_cart();
	$('#orders_input').val(orders);
}

//обновление строки из корзины на оформление
function checkout(){
	var orders = orders_from_cart();
	$('#orders_checkout').val(orders);
}

// очистка корзины после оплаты
function clear_cart(){
	window.localStorage.clear();
	$('#count').hide();
}

//обновление и отображение общей суммы заказа в корзине
function set_total_sum(){
	var sum = 0;
	$(".price").each(function() {
		var visible = $(this).is(':visible');
    var value = $(this).text();
    // add only if the value is number
    if(!isNaN(value) && value.length != 0 && visible == true) {
        sum += parseFloat(value);
    }
		});
	sum = (sum).toFixed(1);
	$('#total_sum').text(sum);
}

function remove_order_button(){
	var count = 0
	$(".price").each(function() {
		var visible = $(this).is(':visible');
    if(visible == true) {
        count += 1;
    }
		});
	if (count == 0){
		$('.info').hide();
	}
}