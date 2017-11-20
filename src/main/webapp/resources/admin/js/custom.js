function viewImg(img) {
	var fileReader = new FileReader;
	fileReader.onload = function(img) {
		var avartarShow = document.getElementById("avartar-img-show");
		avartarShow.src = img.target.result;
	}, fileReader.readAsDataURL(img.files[0]);
}