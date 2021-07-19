# Import file "Welcome_Tour_Prototype_Designs" (sizes and positions are scaled 1:3)
sketch = Framer.Importer.load("imported/Welcome_Tour_Prototype_Designs@3x")

# STEP 2
# Step 2 states
sketch.Step_2_Artboard.states.out =
    x: 1080
    animationOptions:
        time: 0.3
        curve: Bezier.ease    
sketch.Step_2_Artboard.states.in =
    x: 0
    animationOptions:
        time: 0.3
        curve: Bezier.ease
# Set default Step 2 state
sketch.Step_2_Artboard.stateSwitch("out")
# STEP 3
# Step 3 states
sketch.Step_3_Artboard.states.out =
    x: 1080
    animationOptions:
        time: 0.3
        curve: Bezier.ease    
sketch.Step_3_Artboard.states.in =
    x: 0
    animationOptions:
        time: 0.3
        curve: Bezier.ease
# Set default Step 3 state
sketch.Step_3_Artboard.stateSwitch("out")
# ACTIVITIES FEED
# Activities Feed states
sketch.Feed_Activities_Artboard.states.out =
    y: 1920
    animationOptions:
        time: 0.3
        curve: Spring(damping: 0.5)    
sketch.Feed_Activities_Artboard.states.in =
    y: 0
    animationOptions:
        time: 0.3
        curve: Spring(damping: 0.7)
# Set default Activities Feed state
sketch.Feed_Activities_Artboard.stateSwitch("out")
# Set default x Activities Feed position
sketch.Feed_Activities_Artboard.x = 0

# WELCOME BEHAVIOUR
# Step 1 Functionality
sketch.CTA_1.on Events.Tap, ->
    sketch.Step_2_Artboard.animate("in")
sketch.Step_1_Artboard.on Events.SwipeLeft, (event) ->
    sketch.Step_2_Artboard.animate("in")
# Step 2 Functionality
sketch.CTA_2.on Events.Tap, ->
    sketch.Step_3_Artboard.animate("in")
sketch.Step_2_Artboard.on Events.SwipeLeft, (event) ->
    sketch.Step_3_Artboard.animate("in")
sketch.Step_2_Artboard.on Events.SwipeRight, (event) ->
    sketch.Step_2_Artboard.animate("out")
# Step 3 Functionality
sketch.Step_3_Artboard.on Events.SwipeRight, (event) ->
    sketch.Step_3_Artboard.animate("out")
sketch.CTA_3.on Events.Tap, ->
    sketch.Feed_Activities_Artboard.animate("in")
    for card in cardsInFeed
        card.animate("end")

# ACTIVITIES FEED
# Array of the cards
cardsInFeed = [sketch.Card1, sketch.Card2, sketch.Card3, sketch.Card4, sketch.Card5, sketch.Card6];
# Loop to create card states
for card,i in cardsInFeed
    card.states.end =
        y: card.y
        opacity: 1
        animationOptions:
            time: 0.3
            curve: "ease-out"
            delay: i*0.2
    card.states.start =
        opacity: 0
        y: card.y+200
    card.states.switchInstant "start"
