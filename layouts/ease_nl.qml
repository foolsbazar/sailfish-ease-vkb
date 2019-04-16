import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."
import "../sailfish-ease-vkb"

EaseBase {

    easeLayout: {
        "topLeft": {
            "caption":        "a", "swipeCaption":        ["", "", "ä", "ï", "", "", "", "v"], "swipeSpecial": ["", "", "", "", "-", "$", "€", ""],
            "captionShifted": "A", "swipeCaptionShifted": ["", "", "Ä", "Ï", "", "", "", "V"], "symView": "1" },
        "top": {
            "caption":        "n", "swipeCaption":        ["", "", "", "", "", "", "l", ""], "swipeSpecial": ["`", "^", "´", "+", "!", "/", "", "\\"],
            "captionShifted": "N", "swipeCaptionShifted": ["", "", "", "", "", "", "L", ""], "symView": "2" },
        "topRight": {
            "caption":        "i", "swipeCaption":        ["", "", "ö", "", "", "x", "", ""], "swipeSpecial": ["¨", "°", "¸", "?", "", "", "=", "£"],
            "captionShifted": "I", "swipeCaptionShifted": ["", "", "Ö", "", "", "X", "", ""], "symView": "3" },
        "left": {
            "caption":        "h", "swipeCaption":        ["", "", "", "", "k", "", "", ""], "swipeSpecial": ["{", "", "%", "(", "", "[", "", "_"],
            "captionShifted": "H", "swipeCaptionShifted": ["", "", "", "", "K", "", "", ""], "symView": "4" },
        "center": {
            "caption":        "o", "swipeCaption":        ["q", "u", "p", "c", "b", "g", "d", "j"], "swipeSpecial": ["", "", "", "", "", "", "", ""],
            "captionShifted": "O", "swipeCaptionShifted": ["Q", "U", "P", "C", "B", "G", "D", "J"], "symView": "5" },
        "right": {
            "caption":        "r", "swipeCaption":        ["", "", "", "m", "", "", "", ""], "swipeSpecial": ["|", "", "}", "", ")", "@", "", "]"],
            "captionShifted": "R", "swipeCaptionShifted": ["", "", "", "M", "", "", "", ""], "symView": "6" },
        "bottomLeft": {
            "caption":        "t", "swipeCaption":        ["", "", "y", "", "", "", "", "è"], "swipeSpecial": ["~", "", "", "<", "*", "", "", ""],
            "captionShifted": "T", "swipeCaptionShifted": ["", "", "Y", "", "", "", "", "È"], "symView": "7" },
        "bottom": {
            "caption":        "e", "swipeCaption":        ["", "w", "", "", "z", "", "", ""], "swipeSpecial": ["\"", "", "'", "", "", ",", ".", ":"],
            "captionShifted": "E", "swipeCaptionShifted": ["", "W", "", "", "Z", "", "", ""], "symView": "8" },
        "bottomRight": {
            "caption":        "s", "swipeCaption":        ["f", "", "ü", "", "", "", "", "é"], "swipeSpecial": ["", "&", "", "#", ">", ";", "", ""],
            "captionShifted": "S", "swipeCaptionShifted": ["F", "", "Ü", "", "", "", "", "É"], "symView": "9" }
    }
}
