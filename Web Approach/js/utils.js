var printData = false;
var printInterval = false;

function changeCheckboxValue() {
	if (document.getElementById("printData").checked) {
		printData = true;
	}
	else {
		printData = false;
	}
	
	if (document.getElementById("printInterval") != null && 
		document.getElementById("printInterval").checked) {
		
		printInterval = true;
	}
	else {
		printInterval = false;
	}
}