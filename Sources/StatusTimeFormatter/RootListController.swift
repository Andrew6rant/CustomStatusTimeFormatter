import Preferences
import StatusTimeFormatterC

class RootListController: PSListController {
    private let path = "/var/mobile/Library/Preferences/io.github.andrew6rant.statustimeformatter.plist"
    private var settings = NSMutableDictionary()

    override var specifiers: NSMutableArray? {
        get {
            if let specifiers = value(forKey: "_specifiers") as? NSMutableArray {
                return specifiers
            } else {
                let specifiers = loadSpecifiers(fromPlistName: "Root", target: self)
                setValue(specifiers, forKey: "_specifiers")
                return specifiers
            }
        }
        set {
            super.specifiers = newValue
        }
    }
    override func readPreferenceValue(_ specifier: PSSpecifier!) -> Any! {
        settings = NSMutableDictionary(contentsOfFile: path) ?? NSMutableDictionary()
        return settings[specifier.property(forKey: "key") as Any] ?? specifier.property(forKey: "default")
    }
    override func setPreferenceValue(_ value: Any!, specifier: PSSpecifier!) {
        settings.setValue(value, forKey: specifier.property(forKey: "key") as! String)
        settings.write(toFile: path, atomically: true)
        super.setPreferenceValue(value, specifier: specifier)
    }
}
