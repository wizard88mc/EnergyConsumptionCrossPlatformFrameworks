var recording = false;
var lastTimestamp = 0;

function startOrStopRecordingLuminosity() {
	if (recording) {
		recordign = false; lastTimestamp = 0;
		window.removeEventListener('devicelight', luminosityHandler);
	}
	else {
		recording = true;
		window.addEventListener('devicelight', luminosityHandler, false);
	}
}

function luminosityHandler(event) {
	
	if (document.getElementById("printData").checked) {
		document.getElementById("luminosityValue").innerHTML = event.value;
	}
	if (document.getElementById("printInterval").checked) {
		if (lastTimestamp != 0) {
			document.getElementById("intervalLuminosity").innerHTML = event.timeStamp - lastTimestamp;
		}
		lastTimestamp = event.timeStamp;
	}
}


