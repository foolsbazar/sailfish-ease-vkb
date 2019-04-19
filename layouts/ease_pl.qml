import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."
import "../sailfish-ease-vkb"

EaseBase {

    easeLayout: {
        "topLeft": {
            "caption":        "a", "swipeCaption":        ["", "", "ł", "", "", "", "", "v"], "swipeSpecial": ["", "˙", "", "", "-", "$", "€", ""],
            "captionShifted": "A", "swipeCaptionShifted": ["", "", "Ł", "", "", "", "", "V"], "symView": "1" },
        "top": {
            "caption":        "n", "swipeCaption":        ["", "", "", "", "", "", "l", ""], "swipeSpecial": ["`", "^", "´", "+", "!", "/", "", "\\"],
            "captionShifted": "N", "swipeCaptionShifted": ["", "", "", "", "", "", "L", ""], "symView": "2" },
        "topRight": {
            "caption":        "i", "swipeCaption":        ["", "", "", "", "", "x", "", ""], "swipeSpecial": ["", "°", "¸", "?", "", "", "=", "£"],
            "captionShifted": "I", "swipeCaptionShifted": ["", "", "", "", "", "X", "", ""], "symView": "3" },
        "left": {
            "caption":        "z", "swipeCaption":        ["", "", "", "", "k", "", "", ""], "swipeSpecial": ["{", "", "%", "(", "", "[", "", "_"],
            "captionShifted": "Z", "swipeCaptionShifted": ["", "", "", "", "K", "", "", ""], "symView": "4" },
        "center": {
            "caption":        "o", "swipeCaption":        ["q", "u", "p", "c", "b", "g", "d", "j"], "swipeSpecial": ["", "", "", "", "", "", "", ""],
            "captionShifted": "O", "swipeCaptionShifted": ["Q", "U", "P", "C", "B", "G", "D", "J"], "symView": "5" },
        "right": {
            "caption":        "r", "swipeCaption":        ["", "", "", "m", "", "", "", ""], "swipeSpecial": ["|", "", "}", "", ")", "@", "", "]"],
            "captionShifted": "R", "swipeCaptionShifted": ["", "", "", "M", "", "", "", ""], "symView": "6" },
        "bottomLeft": {
            "caption":        "w", "swipeCaption":        ["", "", "y", "", "", "", "", ""], "swipeSpecial": ["~", "", "", "<", "*", "", "", ""],
            "captionShifted": "W", "swipeCaptionShifted": ["", "", "Y", "", "", "", "", ""], "symView": "7" },
        "bottom": {
            "caption":        "e", "swipeCaption":        ["", "t", "", "", "h", "", "", ""], "swipeSpecial": ["\"", "", "'", "", "", ",", ".", ":"],
            "captionShifted": "E", "swipeCaptionShifted": ["", "T", "", "", "H", "", "", ""], "symView": "8" },
        "bottomRight": {
            "caption":        "s", "swipeCaption":        ["f", "", "", "", "", "", "", ""], "swipeSpecial": ["", "&", "", "#", ">", ";", "", ""],
            "captionShifted": "S", "swipeCaptionShifted": ["F", "", "", "", "", "", "", ""], "symView": "9" }
    }
    accentMap: {
            "a": {          "¨": "ä", "`": "à", "~": "ã", "°": "å","¸":"ą"},
            "A": {          "¨": "Ä", "`": "À", "~": "Ã", "°": "Å","¸":"Ą"},
            "e": {          "¨": "ë", "`": "è",                    "¸":"ę"},
            "E": {          "¨": "Ë", "`": "È",                    "¸":"Ę"},
            "i": {          "¨": "ï", "`": "ì"},
            "I": {          "¨": "Ï", "`": "Ì"},
            "o": {          "¨": "ö", "`": "ò", "~": "õ", "´": "ó"},
            "O": {          "¨": "Ö", "`": "Ò", "~": "Õ", "´": "Ó"},
            "u": {          "¨": "ü", "`": "ù"},
            "U": {          "¨": "Ü", "`": "Ù"},
            "y": {                    "¨": "ÿ"},
            "Y": {                    "¨": "Ϋ"},
            "n": {"´": "ń",                               "~": "ñ"},
            "N": {"´": "Ń",                               "~": "Ñ"},
            "c": {"´": "ć",                                                "¸": "ç",},
            "C": {"´": "Ć", "¸": "Ç",},
            "s": {"´": "ś"},
            "S": {"´": "Ś"},
            "z": {"´": "ź", "˙": "ż"},
            "Z": {"´": "Ź", "˙": "Ż"}
    }
}
