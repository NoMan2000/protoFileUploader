# This imports all the layers for "fileUpload" into fileuploadLayers
fileuploadLayers = Framer.Importer.load "imported/fileUpload"

# By default, hide all of the layers
for key, value of fileuploadLayers
	value.visible = false

bgLayer = new BackgroundLayer

mainScreen = fileuploadLayers.MainScreen
excelSheets = fileuploadLayers._GoodAndBadExcel

excelSheets.visible = true

excelSheets.center()

mainScreen.visible = true

mainScreen.bringToFront()
excelSheets.bringToFront()

for subLayer in excelSheets.subLayers
	if (subLayer.name == 'Good')
		good = subLayer
	if (subLayer.name == 'Bad')
		bad = subLayer

excelSheets.y += 40
bad.visible = true
good.visible = true

for subLayer in mainScreen.subLayers
	if (subLayer.name == 'DropZone')
		dropzone = subLayer

print dropzone

dropzone.on Events.Click, (event, layer) ->
    print "Clicked", layer.name

# Make draggable	
good.draggable.enabled = true
bad.draggable.enabled = true

# Only allow vertical dragging, we will allow both
# good.draggable.horizontal = false	
# bad.draggable.horizontal = false

# Return to original position after dragging outside,
# otherwise it will just fly off the page.
good.draggable.constraints = 
	x: 0
	y: 0
	width: good.width
	height: good.height

bad.draggable.constraints = 
	x: 90
	y: 0
	width: bad.width
	height: bad.height


bad.on Events.Drag, (event, layer) ->
	print "Dragged"



