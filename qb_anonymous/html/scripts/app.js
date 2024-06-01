$(document).ready(function(){ 
	// Partial Functions
	function ShowCamera() {
	  $("html").css("display", "block");
	}
	function CloseCamera() {
	  $("html").css("display", "none");
	}
	// Listen for NUI Events
	window.addEventListener('message', function(event){
	  var item = event.data;
	  // Open & Close main bank window
	  if(item.openCamera == true) {
			ShowCamera();
		}
	  if(item.openCamera == false) {
			CloseCamera();
	  }
	});
});