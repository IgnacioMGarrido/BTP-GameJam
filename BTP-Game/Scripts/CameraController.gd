extends Camera2D

const ZOOM_DURATION = .4
var is_zoomed_out : bool = false
var zoom_step : Vector2 = Vector2.ONE

onready var tween : Tween = $ZoomTween


func _process(delta):
	if Input.is_action_just_pressed("zoom"):
		print(zoom)
		if zoom == Vector2(1,1):
			tween.interpolate_property(self, 'zoom', self.zoom, zoom + zoom_step, ZOOM_DURATION, Tween.TRANS_QUAD, Tween.EASE_IN)
		elif zoom == Vector2(2,2):
			tween.interpolate_property(self, 'zoom', self.zoom, zoom - zoom_step, ZOOM_DURATION, Tween.TRANS_QUAD, Tween.EASE_IN)
#		elif zoom == Vector2(3,3):
#			tween.interpolate_property(self, 'zoom', self.zoom, zoom - zoom_step * 2, ZOOM_DURATION, Tween.TRANS_QUAD, Tween.EASE_IN)
		tween.start()
	