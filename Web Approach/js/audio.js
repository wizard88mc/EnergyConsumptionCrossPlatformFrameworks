var audioContext = new AudioContext();

function startOrStopRecordingAudio() {
	
	navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia
						|| navigator.mozGetUserMedia || navigator.msGetUserMedia; 
						
	if (navigator.getUserMedia) {
		navigator.getUserMedia({audio: true}, function(stream) {
			inputPoint = audioContext.createGain();
			realAudioInput = audioContext.createMediaStreamSource(stream);
		}, function(e) {
			console.log("error");
			document.getElementById("error").innerHTML = e;
		});
	}
	else {
		document.getElementById("error").innerHTML = "No get user media";
	}
	
}
