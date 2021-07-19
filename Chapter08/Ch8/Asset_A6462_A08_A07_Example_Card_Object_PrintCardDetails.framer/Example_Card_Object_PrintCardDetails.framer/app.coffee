card =  
    cardHeight: 10
    cardWidth: 10
    cardColor: 222222
    printCardDetails: (x) ->
            i = 0
            while i < x
                print "Height:  " + this.cardHeight + ", Width: " + this.cardWidth + ", Color: " + this.cardColor
                i++
            
card.printCardDetails 3