var recording = false;
var lastTimestamp = 0;

function startOrStopRecordingAccelerometer() {
	if (recording) {
		recording = false;
		lastTimestamp = 0;
		window.removeEventListener('devicemotion', accelerometerHandler);
	}
	else {
		recording = true;
		window.addEventListener('devicemotion', accelerometerHandler, false);
	}
}

function accelerometerHandler(eventData) {
	
	if (document.getElementById("printData").checked) {
		document.getElementById("xAcceleration").innerHTML = Number(eventData.accelerationIncludingGravity.x).toFixed(5);
		document.getElementById("yAcceleration").innerHTML = Number(eventData.accelerationIncludingGravity.y).toFixed(5);
		document.getElementById("zAcceleration").innerHTML = Number(eventData.accelerationIncludingGravity.z).toFixed(5);
	}
	if (document.getElementById("printInterval") && 
		document.getElementById("printInterval").checked) {
		if (lastTimestamp != 0) {
			document.getElementById("intervalAcceleration").innerHTML = Number(eventData.timeStamp - lastTimestamp).toFixed();
		}
		lastTimestamp = eventData.timeStamp;
	}
}
