
import UIKit

struct Place : Decodable {
    
    var type :String
    var backgroundColor :String
    var fontSize :String
    var textColor :String
    var source :String
    var width : Int
    var Height : Int
    var sourceImg :String
    
    
}

let json = """

[
{
            "type": "text",
            "backgroundColor": "#FFFFFF",
            "fontSize": "17",
            "textColor": "#000000",
            "source": "Element1: This is the paragraph which should have at least 250 character. Use Lorem ipsum for large paragraph",
    
    "width" : 250,
    "Height" : 200,
    "sourceImg": "Image url or hard coded image"
},
{
            "type": "image",
            "backgroundColor": "#FFFFFF",
            "fontSize": "17",
            "textColor": "#000000",
            "source": "Element1: This is the paragraph which should have at least 250 character. Use Lorem ipsum for large paragraph",

            "width" : 250,
            "Height" : 200,
            "sourceImg": "Image url or hard coded image"
}
]
""".data(using: .utf8)!

let places = try! JSONDecoder().decode([Place].self, from: json)
print(places)

