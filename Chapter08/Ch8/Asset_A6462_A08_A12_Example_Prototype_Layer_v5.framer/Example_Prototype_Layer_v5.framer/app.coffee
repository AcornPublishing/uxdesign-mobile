myFirstLayer = new Layer
myFirstLayer.midX = 1080/2
myFirstLayer.midY = 1920/2
print myFirstLayer.x
print myFirstLayer.y

myFirstLayer.center()

myFirstLayer.width = 500
myFirstLayer.height = 500
print myFirstLayer.size

mySecondLayer = new Layer
    parent: myFirstLayer
    x: 30
    y: 30

myFirstLayer.animate
    x: 200
    options:
        curve: Bezier.easeOut
        time: 1

animationGoTo200 = new Animation myFirstLayer,
    x: 200
    options:
        curve: Bezier.easeOut
        time: 1
animationGoTo200.start()
