contacts = [
	"John Walker"
	"Mark Roberts"
	"Jessica Plankton"
]

for name in contacts
	print name

for name, i in contacts when name isnt "Mark Roberts"
	print name + ' is in the position ' + i