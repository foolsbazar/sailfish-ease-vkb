import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."
import "../sailfish-ease-vkb"

EaseBase {

    easeLayout: {
        "topLeft": {
            "caption":        "a", "swipeCaption":        ["", "", "å", "", "", "", "", "v"], "swipeSpecial": ["€", "", "", "", "-", "$", "", ""],
            "captionShifted": "A", "swipeCaptionShifted": ["", "", "Å", "", "", "", "", "V"], "symView": "1" },
        "top": {
            "caption":        "n", "swipeCaption":        ["", "", "", "", "", "", "l", ""], "swipeSpecial": ["`", "^", "´", "+", "!", "/", "", "\\"],
            "captionShifted": "N", "swipeCaptionShifted": ["", "", "", "", "", "", "L", ""], "symView": "2" },
        "topRight": {
            "caption":        "i", "swipeCaption":        ["", "", "", "", "", "f", "", ""], "swipeSpecial": ["¨", "°", "¸", "?", "", "", "=", "£"],
            "captionShifted": "I", "swipeCaptionShifted": ["", "", "", "", "", "F", "", ""], "symView": "3" },
        "left": {
            "caption":        "k", "swipeCaption":        ["", "", "", "", "h", "", "", ""], "swipeSpecial": ["{", "", "%", "(", "", "[", "", "_"],
            "captionShifted": "K", "swipeCaptionShifted": ["", "", "", "", "H", "", "", ""], "symView": "4" },
        "center": {
            "caption":        "o", "swipeCaption":        ["q", "u", "p", "c", "b", "g", "d", "j"], "swipeSpecial": ["", "", "", "", "", "", "", ""],
            "captionShifted": "O", "swipeCaptionShifted": ["Q", "U", "P", "C", "B", "G", "D", "J"], "symView": "5" },
        "right": {
            "caption":        "r", "swipeCaption":        ["", "ä", "", "m", "", "", "ö", ""], "swipeSpecial": ["|", "", "}", "", ")", "@", "", "]"],
            "captionShifted": "R", "swipeCaptionShifted": ["", "Ä", "", "M", "", "", "Ö", ""], "symView": "6" },
        "bottomLeft": {
            "caption":        "t", "swipeCaption":        ["", "", "y", "", "", "", "", ""], "swipeSpecial": ["~", "", "", "<", "*", "", "", ""],
            "captionShifted": "T", "swipeCaptionShifted": ["", "", "Y", "", "", "", "", ""], "symView": "7" },
        "bottom": {
            "caption":        "e", "swipeCaption":        ["", "w", "", "", "z", "", "", ""], "swipeSpecial": ["\"", "", "'", "", "", ",", ".", ":"],
            "captionShifted": "E", "swipeCaptionShifted": ["", "W", "", "", "Z", "", "", ""], "symView": "8" },
        "bottomRight": {
            "caption":        "s", "swipeCaption":        ["x", "", "", "", "", "", "", ""], "swipeSpecial": ["", "&", "", "#", ">", ";", "", ""],
            "captionShifted": "S", "swipeCaptionShifted": ["X", "", "", "", "", "", "", ""], "symView": "9" }
    }
}
