import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."
import "../sailfish-ease-vkb"

EaseBase {

    easeLayout: {
        "topLeft": {
            "caption":        "a", "swipeCaption":        ["", "", "", "", "", "", "æ", "q"], "swipeSpecial": ["€", "", "·", "", "-", "$", "", ""],
            "captionShifted": "A", "swipeCaptionShifted": ["", "", "", "", "", "", "Æ", "Q"], "symView": "1" },
        "top": {
            "caption":        "n", "swipeCaption":        ["", "", "", "", "", "", "h", ""], "swipeSpecial": ["`", "^", "´", "+", "!", "/", "", "\\"],
            "captionShifted": "N", "swipeCaptionShifted": ["", "", "", "", "", "", "H", ""], "symView": "2" },
        "topRight": {
            "caption":        "i", "swipeCaption":        ["", "", "", "", "", "x", "", ""], "swipeSpecial": ["¨", "¡", "¿", "?", "¸", "°", "=", "£"],
            "captionShifted": "I", "swipeCaptionShifted": ["", "", "", "", "", "X", "", ""], "symView": "3" },
        "left": {
            "caption":        "l", "swipeCaption":        ["", "ø", "", "", "k", "", "", ""], "swipeSpecial": ["{", "", "%", "(", "", "[", "", "_"],
            "captionShifted": "L", "swipeCaptionShifted": ["", "Ø", "", "", "K", "", "", ""], "symView": "4" },
        "center": {
            "caption":        "o", "swipeCaption":        ["u", "v", "p", "c", "m", "g", "t", "b"], "swipeSpecial": ["", "", "", "", "", "", "", ""],
            "captionShifted": "O", "swipeCaptionShifted": ["U", "V", "P", "C", "M", "G", "T", "B"], "symView": "5" },
        "right": {
            "caption":        "r", "swipeCaption":        ["", "", "", "j", "", "", "", ""], "swipeSpecial": ["|", "", "}", "", ")", "@", "", "]"],
            "captionShifted": "R", "swipeCaptionShifted": ["", "", "", "J", "", "", "", ""], "symView": "6" },
        "bottomLeft": {
            "caption":        "d", "swipeCaption":        ["", "ç", "y", "", "", "", "", ""], "swipeSpecial": ["~", "", "", "<", "*", "", "", ""],
            "captionShifted": "D", "swipeCaptionShifted": ["", "Ç", "Y", "", "", "", "", ""], "symView": "7" },
        "bottom": {
            "caption":        "e", "swipeCaption":        ["", "w", "", "ñ", "z", "", "", ""], "swipeSpecial": ["\"", "", "'", "", "", ",", ".", ":"],
            "captionShifted": "E", "swipeCaptionShifted": ["", "W", "", "Ñ", "Z", "", "", ""], "symView": "8" },
        "bottomRight": {
            "caption":        "s", "swipeCaption":        ["f", "", "", "", "", "", "", ""], "swipeSpecial": ["", "&", "", "#", ">", ";", "", ""],
            "captionShifted": "S", "swipeCaptionShifted": ["F", "", "", "", "", "", "", ""], "symView": "9" }
    }
    accentMap: {
            "a": {"´": "á", "¨": "ä", "`": "à", "°": "å", "~": "ã"},
            "A": {"´": "Á", "¨": "Ä", "`": "À", "°": "Å", "~": "Ã"},
            "e": {"´": "é", "¨": "ë", "`": "è"},
            "E": {"´": "É", "¨": "Ë", "`": "È"},
            "o": {"´": "ó", "¨": "ö", "`": "ò",           "~": "õ"},
            "O": {"´": "Ó", "¨": "Ö", "`": "Ò",           "~": "Õ"},
            "i": {"´": "í", "¨": "ï", "`": "ì"},
            "I": {"´": "Í", "¨": "Ï", "`": "Ì"},
            "u": {"´": "ú", "¨": "ü", "`": "ù"},
            "U": {"´": "Ú", "¨": "Ü", "`": "Ù"},
            "y": {"´": "ý",           "¨": "ÿ"},
            "Y": {"´": "Ý",           "¨": "Ϋ"},
            "n": {                                                  "~": "ñ"},
            "N": {                                                  "~": "Ñ"},
            "c": {"¸": "ç"},
            "C": {"¸": "Ç"}
    }
}
