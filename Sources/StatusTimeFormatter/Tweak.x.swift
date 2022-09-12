import Orion
import StatusTimeFormatterC

let prefs = Preferences()

class StatusBarTimeHook: ClassHook<_UIStatusBarStringView> {
    func setText(_ text: String) {
        if text.contains(":") {
            prefs.load()
            let formatter = DateFormatter()
            formatter.dateFormat = prefs.format
            orig.setText(formatter.string(from: Date()))
        } else {
            orig.setText(text)
        }
    }
}

final class Preferences {
    private(set) var format:String = "hh.mm"
    func load() {
        let path = "/var/mobile/Library/Preferences/io.github.andrew6rant.statustimeformatter.plist"
        let dict = NSMutableDictionary(contentsOfFile: path) as? [String: Any]
        format = dict?["format"] as? String ?? "hh.mm"
    }
}