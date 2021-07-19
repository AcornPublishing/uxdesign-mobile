myBackgroundLayer = new BackgroundLayer
    backgroundColor: "white"

myScroll = new ScrollComponent
    width: 750
    height: 1334
myScroll.scrollVertical = false
myTextLayer = new TextLayer
    text: "This layer is scrollable"
    color: "#333333"
    fontSize: 120
myLayer = new Layer
    width: 1500
    height: 1334
    backgroundColor: "#ffffff"
    parent: myScroll.content
myTextLayer.parent = myLayer
myTextLayer.center()