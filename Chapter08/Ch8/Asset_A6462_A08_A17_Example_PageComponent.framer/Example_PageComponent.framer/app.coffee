myLayer1 = new TextLayer
    text: "1"
    color: "#333333"
    fontSize: 200
    padding:
        top: 64
        left: 64
    width: 750
    height: 1334
    backgroundColor: "#ffffff"
myLayer2 = new TextLayer
    text: "2"
    color: "#333333"
    fontSize: 200
    padding:
        top: 64
        left: 64
    width: 750
    height: 1334
    backgroundColor: "#ffffff"
myLayer3 = new TextLayer
    text: "3"
    color: "#333333"
    fontSize: 200
    padding:
        top: 64
        left: 64
    width: 750
    height: 1334
    backgroundColor: "#ffffff"
myPage = new PageComponent
    width: 750
    height: 1334
myPage.addPage(myLayer1, "right")
myPage.addPage(myLayer2, "right")
myPage.addPage(myLayer3, "right")
