import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."
import "../sailfish-ease-vkb"

EaseBase {

    easeLayout: {
        "topLeft": {
            "caption":        "a", "swipeCaption":        ["", "", "ł", "ź", "", "", "ŭ", "v"], "swipeSpecial": ["", "ˇ", "", "", "-", "$", "€", ""],
            "captionShifted": "A", "swipeCaptionShifted": ["", "", "Ł", "Ź", "", "", "Ŭ", "V"], "symView": "1" },
        "top": {
            "caption":        "n", "swipeCaption":        ["", "", "", "", "", "", "l", ""], "swipeSpecial": ["`", "^", "´", "+", "!", "/", "", "\\"],
            "captionShifted": "N", "swipeCaptionShifted": ["", "", "", "", "", "", "L", ""], "symView": "2" },
        "topRight": {
            "caption":        "i", "swipeCaption":        ["ń", "", "", "", "", "x", "", ""], "swipeSpecial": ["", "°", "¸", "?", "", "", "=", "£"],
            "captionShifted": "I", "swipeCaptionShifted": ["Ń", "", "", "", "", "X", "", ""], "symView": "3" },
        "left": {
            "caption":        "h", "swipeCaption":        ["", "ć", "", "", "k", "", "š", ""], "swipeSpecial": ["{", "", "%", "(", "", "[", "", "_"],
            "captionShifted": "H", "swipeCaptionShifted": ["", "Ć", "", "", "K", "", "Š", ""], "symView": "4" },
        "center": {
            "caption":        "o", "swipeCaption":        ["q", "u", "p", "c", "b", "g", "d", "j"], "swipeSpecial": ["", "", "", "", "", "", "", ""],
            "captionShifted": "O", "swipeCaptionShifted": ["Q", "U", "P", "C", "B", "G", "D", "J"], "symView": "5" },
        "right": {
            "caption":        "r", "swipeCaption":        ["", "", "", "m", "", "", "", ""], "swipeSpecial": ["|", "", "}", "", ")", "@", "", "]"],
            "captionShifted": "R", "swipeCaptionShifted": ["", "", "", "M", "", "", "", ""], "symView": "6" },
        "bottomLeft": {
            "caption":        "t", "swipeCaption":        ["", "ž", "y", "", "", "", "č", ""], "swipeSpecial": ["~", "", "", "<", "*", "", "", ""],
            "captionShifted": "T", "swipeCaptionShifted": ["", "Ž", "Y", "", "", "", "Č", ""], "symView": "7" },
        "bottom": {
            "caption":        "e", "swipeCaption":        ["", "w", "", "ś", "z", "", "", ""], "swipeSpecial": ["\"", "", "'", "", "", ",", ".", ":"],
            "captionShifted": "E", "swipeCaptionShifted": ["", "W", "", "Ś", "Z", "", "", ""], "symView": "8" },
        "bottomRight": {
            "caption":        "s", "swipeCaption":        ["f", "", "", "", "", "", "", ""], "swipeSpecial": ["", "&", "", "#", ">", ";", "", ""],
            "captionShifted": "S", "swipeCaptionShifted": ["F", "", "", "", "", "", "", ""], "symView": "9" }
    }
    accentMap: {
            "a": {          "^": "â", "¨": "ä", "`": "à", "~": "ã", "°": "å"},
            "A": {          "^": "Â", "¨": "Ä", "`": "À", "~": "Ã", "°": "Å"},
            "e": {          "^": "ê", "¨": "ë", "`": "è",                   },
            "E": {          "^": "Ê", "¨": "Ë", "`": "È",                   },
            "i": {          "^": "î", "¨": "ï", "`": "ì"},
            "I": {          "^": "Î", "¨": "Ï", "`": "Ì"},
            "o": {          "^": "ô", "¨": "ö", "`": "ò", "~": "õ"},
            "O": {          "^": "Ô", "¨": "Ö", "`": "Ò", "~": "Õ"},
            "u": {          "^": "û", "¨": "ü", "`": "ù", "˘": "ŭ"},
            "U": {          "^": "Û", "¨": "Ü", "`": "Ù", "˘": "Ŭ"},
            "y": {                    "¨": "ÿ"},
            "Y": {                    "¨": "Ϋ"},
            "n": {"´": "ń",                               "~": "ñ"},
            "N": {"´": "Ń",                               "~": "Ñ"},
            "c": {"´": "ć", "ˇ": "č",                                        "¸": "ç",},
            "C": {"´": "Ć", "ˇ": "Č", "¸": "Ç",},
            "s": {"´": "ś", "ˇ": "š"},
            "S": {"´": "Ś", "ˇ": "Š"},
            "z": {"´": "ź", "ˇ": "ž"},
            "Z": {"´": "Ź", "ˇ": "Ž"}
    }
}
