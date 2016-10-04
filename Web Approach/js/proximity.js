var recording = false;
var lastTimestamp = 0;

function startOrStopRecordingProximity() {
	if (recording) {
		recording = false; lastTimestamp = 0;
		window.removeEventListener('deviceproximity', proximityHandler);
	}
	else {
		recording = true;
		window.addEventListener('deviceproximity', proximityHandler, false);
	}
}

function proximityHandler(eventData) {
	
	if (document.getElementById("printData").checked) {
		document.getElementById("proximityValue").innerHTML = eventData.value;
	}
	if (document.getElementById("printInterval") && 
		document.getElementById("printInterval").checked) {
		if (lastTimestamp != 0) {
			document.getElementById("intervalProximity").innerHTML = eventData.timeStamp - lastTimestamp;
		}
		lastTimestamp = eventData.timeStamp;
	}
}
