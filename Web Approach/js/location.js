var recording = false;
var lastTimestamp = 0;
var watchID = -1;

function startOrStopRecordingLocation() {
	if (recording) {
		recording = false; lastTimestamp = 0;
		navigator.geolocation.clearWatch(watchID);
	}
	else {
		recording = true;
		navigator.geolocation.watchPosition(handlerPosition);
	}
}

function handlerPosition(position) {
	if (document.getElementById("printData").checked) {
		document.getElementById("latitudeLocation").innerHTML = Number(position.coords.latitude).toFixed(5);
		document.getElementById("longitudeLocation").innerHTML = Number(position.coords.longitude).toFixed(5);
	}
	if (document.getElementById("printInterval") && 
		document.getElementById("printInterval").checked) {
		if (lastTimestamp != 0) {
			document.getElementById("intervalLocation").innerHTML = Number(position.timeStamp - lastTimestamp).toFixed();
		}
		lastTimestamp = position.timeStamp;
	}
}
