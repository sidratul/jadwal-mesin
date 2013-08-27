var json= {
	"coba" :[
		{"nama" : "sid", "umur":21},
		{"nama" : "fajri", "umur":20}
	]
}


var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];

$(document).ready(function(){
	$("#binput").click(function(){
		
	});

	$("#bhapus").click(function(){
		alert(fruits);
		fruits.splice(1,2);
		alert(fruits);
	});

	function set(){
		for (var i = 0; i < json.coba.length; i++) {
			$("table tbody").append("<tr><td>"+json.coba[i].nama+"</td><td>"+json.coba[i].umur+"</td><td>-</td><td>-</td></tr>");
		};
	}


	set();
});
