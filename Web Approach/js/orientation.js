var recording = false;
var lastTimestamp = 0;

function startOrStopRecordingGyroscope() {
	
	if (recording) {
		recording = false; lastTimestamp = 0;
		window.removeEventListener('deviceorientation', gyroscopeHandler);
	}
	else {
		recording = true;
		window.addEventListener('deviceorientation', gyroscopeHandler, false); 
	}
}

function gyroscopeHandler(eventData) {
	
	if (document.getElementById("printData").checked) {
		document.getElementById("alphaGyroscope").innerHTML = Number(eventData.alpha).toFixed(5);
		document.getElementById("betaGyroscope").innerHTML = Number(eventData.beta).toFixed(5);
		document.getElementById("gammaGyroscope").innerHTML = Number(eventData.gamma).toFixed(5);
	}
	if (document.getElementById("printInterval") && 
		document.getElementById("printInterval").checked) {
		if (lastTimestamp != 0) {
			 document.getElementById("intervalGyroscope").innerHTML = Number(eventData.timeStamp - lastTimestamp).toFixed();
		}
		lastTimestamp = eventData.timeStamp;
	}
}
