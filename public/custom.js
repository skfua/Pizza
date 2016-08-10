function say_hello() {
    // window.localStorage.clear();
    var x = window.localStorage.getItem('aaa');
    x = x * 1 + 1;
    window.localStorage.setItem('aaa', x);
    alert(x);
}


function update_orders_input() {
    var orders = card_get_orders();
    $('#orders_input').val(orders);
}

function update_orders_list() {
    var orders = card_get_orders();
    $('#orders_list').val(orders);
}

function localStorage_clean() {
    window.localStorage.clear()
}


function add_to_card(id) {
    if (id == 1) {
        // var key = 'Hawaiian'
        var price = 350
    } else if (id == 2) {
        // var key = 'Pepperoni'
        var price = 450
    } else {
        // var key = 'Vegeterian'
        var price = 400
    }
    var x = window.localStorage.getItem(id);
    x = x * 1 + 1;
    window.localStorage.setItem(id, x);
    var store = 0;
    for (var i = 0; i < window.localStorage.length; i++) {
        var number = ([window.localStorage.getItem(localStorage.key(i))])
        store = store * 1 + number * 1;
    }
    update_orders_input();
    update_orders_button();
    // alert(key)
}

function card_get_orders() {
    var orders = '';
    for (var i = 0; i < window.localStorage.length; i++) {
        var key = window.localStorage.key(i)
        var number = ([window.localStorage.getItem(key)]);
        orders = orders + key + '=' + number + ',';
    }
    return orders
}


function update_orders_button() {
    var text = 'Card (' + card_get_number_of_items() + ')';
    $('#order_button').val(text);
}

function card_get_number_of_items() {
    var items = 0;
    for (var i = 0; i < window.localStorage.length; i++) {
        var number = ([window.localStorage.getItem(localStorage.key(i))])
        items = items * 1 + number * 1;
    }
    return items
}

function totalPrice() {
    var price = 0
    for (var i = 0; i < window.localStorage.length; i++) {
        var key = window.localStorage.key(i);
        if (key == 'Hawaiian') {
            price_of_each = 350
        } else if (key == 'Pepperoni') {
            price_of_each = 450
        } else {
            price_of_each = 400
        }
        var number = ([window.localStorage.getItem(key)]);
        price = price * 1 + (number * 1 * price_of_each);
    }
    return price
}

function show_card() {
    var table = document.getElementById("tableCard")
    for (var i = 0; i < window.localStorage.length; i++) {
        var key = window.localStorage.key(i);
        var number = ([window.localStorage.getItem(key)]);
        var row = table.insertRow(i + 1);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        if (key == 1) {
          var name = 'Hawaiian';
        }
        if (key == 2) {
          var name = 'Pepperoni';
        }
        else {
          var name = 'Vegeterian';
        }
        cell1.innerHTML = name;
        cell2.innerHTML = number;
        // cell3.innerHTML = '<a href="#" class"delete" onclick="delete_from_card()">Delete me</a>'
    }
}

function show_total_price() {
    var total_price = totalPrice();
    $('#summ').html(total_price);
}

function delete_from_card(i) {
    var link = document.querySelectorAll('.delete')
        link.setAttribute(id, 'deleted');
}
