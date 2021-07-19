movingLayer = new Layer
movingLayer.centerX()
movingLayer.states =
	up:
		y: 400
	down:
		y: 1200
movingLayer.stateSwitch("up")
movingLayer.onTap ->
    movingLayer.stateCycle("up", "down")