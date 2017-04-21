/*:
 
 # Canvas
 
 The Canvas class provides methods that allow basic shapes to be drawn on a Cartesian plane.
 
 - callout(Experiment):
 
    Uncomment line 27 so that the axes of the plane are automatically drawn.
 
    Where is the origin?
 
    In what direction do values on the *x* and *y* axes increase?
 
 */
// These are some required statements to make this playground work.
import Cocoa
import PlaygroundSupport

// Create a new canvas
let canvas = Canvas(width: 500, height: 500)

// View the current state of the canvas
canvas

let angle : Degrees = 60
let distance = 300
let iterations = 3
var axiom = "F++F++F"
let rule = "F-F++F-F"
var startX = 100
var startY = 100
var reduction = 3

// Draw the axes
canvas.drawAxes()

canvas.translate(byX: startX, byY: startY)

startX = 0
startY = 0
canvas.saveState()

func drawAxiom(axiom: String, reductionFactor: Int, length: Int, iteration: Int) {
canvas.saveState()
for char in axiom.characters {
    
    if char == "F" {
        
        var newlength = Int(Double(length) / (pow(Double(reductionFactor), Double(iteration))))
        
        canvas.drawLine(fromX: startX, fromY: startY, toX: newlength, toY: startY)
        canvas.translate(byX: newlength, byY: 0)
       // canvas.drawAxes()
        
    } else if char == "+" {
        
        canvas.rotate(by: angle)
        //canvas.drawAxes()
        
    } else if char == "-" {
        
        canvas.rotate(by: 0 - angle)
        //canvas.drawAxes()
        
    } else {
        
        print("axiom character \(char) not understood")
    }
    //canvas.drawAxes()
    
}
canvas.restoreState()
}

func expandAxiom(currentAxiom: String, productionRule: String) -> String {
    
   var inputAxiom = currentAxiom
    var inputRule = productionRule
    var newAxiom : String = ""
    for char in inputAxiom.characters {
        
        if char == "F" {
        
        newAxiom.append(productionRule)
            
        } else {
            
        newAxiom.append(char)
            
        }
    
    }
    
    return newAxiom
}

for iteration in 0...iterations {
    
    drawAxiom(axiom: axiom, reductionFactor: reduction, length: distance, iteration: iteration)
    
    axiom = expandAxiom(currentAxiom: axiom, productionRule: rule)
    
}
/*:
 
 ## To see output
 
 To see output, ensure that you have enabled the Assistant Editor...
 
 ![assistant-editor](assistant-editor.png "Enable the Assistant Editor")
 
 ... and verify that you have selected the *Timeline* option:
 
 ![timeline-option](timeline-option.png "Show the timeline")
 
 Finally, do not remove the following line of code:

 */
PlaygroundPage.current.liveView = canvas.imageView
