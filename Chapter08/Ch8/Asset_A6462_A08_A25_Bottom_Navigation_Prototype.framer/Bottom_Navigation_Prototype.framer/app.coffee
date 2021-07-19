# Import file "Bottom_Navigation_Prototype_Designs" (sizes and positions are scaled 1:3)
sketch = Framer.Importer.load("imported/Bottom_Navigation_Prototype_Designs@3x")

# HIDE ELEMENTS INIT
# Hide Touch Target Buttons
sketch.Find_Touch_Target.opacity = 0
sketch.Calendar_Touch_Target.opacity = 0
sketch.Contacts_Touch_Target.opacity = 0
sketch.Messages_Touch_Target.opacity = 0

# PAGE COMPONENT INIT
# Scroll Find Activities Creation
scrollFind = ScrollComponent.wrap(sketch.Find)
scrollFind.contentInset =
    bottom: 204
scrollFind.scrollHorizontal = false
# Page Componen Creation
page = new PageComponent
    width: 1080
    height: 1920
page.superLayer = sketch.Mobile_Portrait
page.scrollVertical = false
sketch.Background.sendToBack()
sketch.Status_App_Bar.bringToFront()
sketch.Bottom_Navigation.bringToFront()
page.addPage scrollFind
page.addPage sketch.Calendar
page.addPage sketch.Contacts
page.addPage sketch.Messages

# CHANGE VIEW FUNCTIONALITY
# Change View Function
changeView = (view) ->
    sketch.Find_Blue.opacity = 0
    sketch.Find_Grey.opacity = 1
    sketch.Calendar_Blue.opacity = 0
    sketch.Calendar_Grey.opacity = 1
    sketch.Contacts_Blue.opacity = 0
    sketch.Contacts_Grey.opacity = 1
    sketch.Messages_Blue.opacity = 0
    sketch.Messages_Grey.opacity = 1
    sketch.Find_App_Bar.opacity = 0
    sketch.Calendar_App_Bar.opacity = 0
    sketch.Contacts_App_Bar.opacity = 0
    sketch.Messages_App_Bar.opacity = 0
    switch view
        when 'find'
            sketch.Find_Blue.opacity = 1
            sketch.Find_Grey.opacity = 0
            sketch.Find_App_Bar.opacity = 1
        when 'calendar'
            sketch.Calendar_Blue.opacity = 1
            sketch.Calendar_Grey.opacity = 0
            sketch.Calendar_App_Bar.opacity = 1
        when 'contacts'
            sketch.Contacts_Blue.opacity = 1
            sketch.Contacts_Grey.opacity = 0
            sketch.Contacts_App_Bar.opacity = 1
        else
            sketch.Messages_Blue.opacity = 1
            sketch.Messages_Grey.opacity = 0
            sketch.Messages_App_Bar.opacity = 1
changeView 'find'

# BOTTOM NAVIGATION
# Bottom Navigation Behaviour
sketch.Find_Blue.on Events.Tap, ->
    page.snapToPage(sketch.scrollFind)
    changeView 'find'
sketch.Calendar_Blue.on Events.Tap, ->
    page.snapToPage(sketch.Calendar)
    changeView 'calendar'
sketch.Contacts_Blue.on Events.Tap, ->
    page.snapToPage(sketch.Contacts)
    changeView 'contacts'
sketch.Messages_Blue.on Events.Tap, ->
    page.snapToPage(sketch.Messages)
    changeView 'messages'
    
# Page Behaviour Control
page.on "change:currentPage", ->
    if page.currentPage == scrollFind
        changeView 'find'
    if page.currentPage == sketch.Calendar
        changeView 'calendar'
    if page.currentPage == sketch.Contacts
        changeView 'contacts'
    if page.currentPage == sketch.Messages
        changeView 'messages'
