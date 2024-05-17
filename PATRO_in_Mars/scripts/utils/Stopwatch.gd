extends Label

var time = 0.0
var minutes = 0
var seconds = 0


func _process(delta):
	time += delta
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600)/60
	var seconds_string = "%02d" %seconds
	var minutes_string = "%02d" %minutes
	$".".text = minutes_string + ":" + seconds_string
