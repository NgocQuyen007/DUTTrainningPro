function viewImg(img) {
	var fileReader = new FileReader;
	fileReader.onload = function(img) {
		var avartarShow = document.getElementById("avartar-img-show");
		avartarShow.src = img.target.result;
	}, fileReader.readAsDataURL(img.files[0]);
}

function SearchProcessing(){
	
	var input = document.getElementById('idKhoa').value;
	
	var xhttp;
	var url = "giangvien?idKhoa=" + input;
	if (window.XMLHttpRequest) {
		// code for chrome, firefox, IE7+, Opera, Safari
		xhttp = new XMLHttpRequest();
	} else {
		// Code for IE6--
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	// Mở kết nối và send yêu cầu đến server do 
	//	ajax engine đảm nhiệm. true asyn
	xhttp.open("GET", url, true);
	xhttp.send();

	xhttp.onreadystatechange = function() {
		// Hoàn thành xử lý và đợi gửi lại từ phía client
		if (xhttp.readyState == 4) {
			var data = xhttp.responseText;
			document.getElementById("TimKiemKhoa").innerHTML = data;
		}
	}
	// or put it here
}

