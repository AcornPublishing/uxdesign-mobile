numberOfTaps = 0
numberOfTapsLayer = new Layer
    backgroundColor: "#123123"
numberOfTapsLayer.center()
numberOfTapsLayer.on Events.Tap, ->
    numberOfTaps++
    print numberOfTaps