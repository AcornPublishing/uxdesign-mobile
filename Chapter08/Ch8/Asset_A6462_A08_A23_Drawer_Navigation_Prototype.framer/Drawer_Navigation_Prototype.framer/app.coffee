# Import file "Drawer_Navigation_Prototype_Designs" (sizes and positions are scaled 1:3)
sketch = Framer.Importer.load("imported/Drawer_Navigation_Prototype_Designs@3x")

# HIDE ELEMENTS INIT
# Hide Result view
sketch.Results.opacity = 0
# Hide Suggested Search view
sketch.Suggested_Search.opacity = 0
# Hide Search Bar view
sketch.Search_Bar.opacity = 0
sketch.Place_Holder.opacity = 0
sketch.Search_Line.scaleX = 0.2
sketch.Search_Line.x = sketch.Search_Line.x + sketch.Search_Line.width*0.4
sketch.Cross_Icon.opacity = 0
# Hide Drawer Menu
sketch.Drawer_Menu.x = -900
# Hide Black Background
sketch.Black_Background.opacity = 0
# Hide touch target elements
sketch.Cross_Icon_Touch_Target.opacity = 0
sketch.Search_Icon_Touch_Target.opacity = 0
sketch.Menu_Icon_Touch_Target.opacity = 0
sketch.Back_Icon_Touch_Target.opacity = 0
sketch.Back_Navigation_Touch_Target.opacity = 0

# SCROLLABLE ELEMENTS INIT
# Wrap Activities Feed
scroll = ScrollComponent.wrap sketch.Activities_Feed
scroll.scrollHorizontal = false
scroll.scrollVertical = true
scroll.y -= 42
scroll.contentInset =
    bottom: 182
    top: 42

# FAB BUTTON
# Fab Buttons States
sketch.FAB_Button.states =
    stateIn:
        y: 1551
        animationOptions:
            time: 0.2
    stateOut:
        y: 1551+400
        animationOptions:
            time: 0.2
# FAB Button Behaviour
scroll.on Events.Scroll, ->
    if scroll.direction == "up"
        sketch.FAB_Button.animate('stateIn')
    if scroll.direction == "down"
        sketch.FAB_Button.animate("stateOut")

# DRAWER MENU
# Open Menu Function
openMenu = ->    
    sketch.Drawer_Menu.animate
        properties:
            x: 0
        time: 0.2
    sketch.Black_Background.animate
        properties:
            opacity: 100
        time: 0.2
    sketch.Drawer_Menu.on Events.SwipeLeft, (event) ->
        closeMenu()
    scroll.scrollVertical = false
    sketch.Search_Icon_Touch_Target.off(Events.Tap, showSearch)
# Close Menu Function
closeMenu = ->
    sketch.Drawer_Menu.animate
        properties:
            x: -900
        time: 0.2
    sketch.Black_Background.animate
        properties:
            opacity: 0
        time: 0.2
    scroll.scrollVertical = true
    sketch.Search_Icon_Touch_Target.on(Events.Tap, showSearch)
# Drawer Menu Behaviour
Screen.on Events.EdgeSwipeLeft, (event) ->
    openMenu()
sketch.Menu_Icon_Touch_Target.on(Events.Tap, openMenu)
# Back Navigation Functionality
sketch.Back_Navigation_Touch_Target.on Events.Tap, ->
    closeMenu()
    
# SEARCH FUNCTIONALITY
# Add Input Field
inputSearchField = new Layer
    html: "<input style='width: 690px; height:144px; font-size:60px; color: #ffffff; background: transparent; border: none;' type='text' id='searchInput' name='inputName'>"
    backgroundColor: null
    x: 218
    y: 82
document.getElementById('searchInput').style.display = 'none';

# Show Search Bar Function
showSearch = ->
    layersToHide = [sketch.Activities_Feed, sketch.Menu_Icon, sketch.Feed_Title, sketch.FAB_Button, sketch.Search_Icon]
    for layer in layersToHide
        layer.animate
            properties:
                opacity: 0
            time: 0.4    
    layersToShow = [sketch.Search_Bar, sketch.Suggested_Search]
    for layer in layersToShow
        layer.animate
            properties:
                opacity: 1
            time: 0.4        
    sketch.Place_Holder.animate
        properties:
            opacity: 1
        time: 0.4
        delay: 0.5
    sketch.Search_Line.animate
        properties:
            opacity: 1
            scaleX:  1
            x: sketch.Search_Line.x - sketch.Search_Line.width*0.4
        time: 0.8
    document.getElementById('searchInput').style.display = 'inline'
    sketch.Cross_Icon_Touch_Target.on(Events.Tap, cleanInput)
    sketch.Search_Bar.bringToFront()
    sketch.Search_Icon_Touch_Target.off(Events.Tap, showSearch)
    sketch.Menu_Icon_Touch_Target.off(Events.Tap, openMenu)
    sketch.Back_Icon_Touch_Target.on Events.Tap, (event) ->
        hideSearch()
        #event.stopPropagation()
# Hide Search Bar Function
hideSearch = ->
    layersToShow = [sketch.Activities_Feed, sketch.Menu_Icon, sketch.Feed_Title, sketch.FAB_Button, sketch.Search_Icon]
    for layer in layersToShow
        layer.animate
            properties:
                opacity: 1
            time: 0.4
    layersToHide = [sketch.Search_Bar, sketch.Place_Holder, sketch.Suggested_Search]
    for layer in layersToHide
        layer.animate
            properties:
                opacity: 0
            time: 0.4
    sketch.Search_Line.animate
        properties:
            opacity: 0
            scaleX:  0.2
            x: sketch.Search_Line.x + sketch.Search_Line.width*0.4
        time: 0.4
    document.getElementById('searchInput').style.display = 'none'
    document.getElementById('searchInput').value = ''
    sketch.Results.opacity = 0
    sketch.Cross_Icon.opacity = 0
    sketch.Cross_Icon_Touch_Target.off(Events.Tap, cleanInput)
    sketch.Search_Bar.sendToBack()
    sketch.Search_Icon_Touch_Target.on(Events.Tap, showSearch)
    Utils.delay 1, ->
        sketch.Menu_Icon_Touch_Target.on(Events.Tap, openMenu)
# Input Field Behaviour
document.getElementById('searchInput').onfocus = ->
    sketch.Place_Holder.opacity = 0
document.getElementById('searchInput').onkeyup = ->
    if document.getElementById('searchInput').value != ''
        sketch.Suggested_Search.opacity = 0
        sketch.Place_Holder.opacity = 0
        sketch.Cross_Icon.opacity = 1
        sketch.Results.animate
            properties:
                opacity: 1
            time: 0.5
    else
        sketch.Suggested_Search.opacity = 1
        sketch.Results.opacity = 0
# Clean Input Field Function
cleanInput = ->
    document.getElementById('searchInput').value = ''
    sketch.Suggested_Search.opacity = 1
    sketch.Results.animateStop()
    sketch.Results.opacity = 0
    sketch.Place_Holder.opacity = 1
    sketch.Cross_Icon.opacity = 0
# Search Bar Behaviour
sketch.Search_Icon_Touch_Target.on(Events.Tap, showSearch)