import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "photo1" asset catalog image resource.
    static let photo1 = DeveloperToolsSupport.ImageResource(name: "photo1", bundle: resourceBundle)

    /// The "photo10" asset catalog image resource.
    static let photo10 = DeveloperToolsSupport.ImageResource(name: "photo10", bundle: resourceBundle)

    /// The "photo11" asset catalog image resource.
    static let photo11 = DeveloperToolsSupport.ImageResource(name: "photo11", bundle: resourceBundle)

    /// The "photo12" asset catalog image resource.
    static let photo12 = DeveloperToolsSupport.ImageResource(name: "photo12", bundle: resourceBundle)

    /// The "photo13" asset catalog image resource.
    static let photo13 = DeveloperToolsSupport.ImageResource(name: "photo13", bundle: resourceBundle)

    /// The "photo14" asset catalog image resource.
    static let photo14 = DeveloperToolsSupport.ImageResource(name: "photo14", bundle: resourceBundle)

    /// The "photo15" asset catalog image resource.
    static let photo15 = DeveloperToolsSupport.ImageResource(name: "photo15", bundle: resourceBundle)

    /// The "photo16" asset catalog image resource.
    static let photo16 = DeveloperToolsSupport.ImageResource(name: "photo16", bundle: resourceBundle)

    /// The "photo17" asset catalog image resource.
    static let photo17 = DeveloperToolsSupport.ImageResource(name: "photo17", bundle: resourceBundle)

    /// The "photo18" asset catalog image resource.
    static let photo18 = DeveloperToolsSupport.ImageResource(name: "photo18", bundle: resourceBundle)

    /// The "photo19" asset catalog image resource.
    static let photo19 = DeveloperToolsSupport.ImageResource(name: "photo19", bundle: resourceBundle)

    /// The "photo2" asset catalog image resource.
    static let photo2 = DeveloperToolsSupport.ImageResource(name: "photo2", bundle: resourceBundle)

    /// The "photo20" asset catalog image resource.
    static let photo20 = DeveloperToolsSupport.ImageResource(name: "photo20", bundle: resourceBundle)

    /// The "photo21" asset catalog image resource.
    static let photo21 = DeveloperToolsSupport.ImageResource(name: "photo21", bundle: resourceBundle)

    /// The "photo22" asset catalog image resource.
    static let photo22 = DeveloperToolsSupport.ImageResource(name: "photo22", bundle: resourceBundle)

    /// The "photo23" asset catalog image resource.
    static let photo23 = DeveloperToolsSupport.ImageResource(name: "photo23", bundle: resourceBundle)

    /// The "photo24" asset catalog image resource.
    static let photo24 = DeveloperToolsSupport.ImageResource(name: "photo24", bundle: resourceBundle)

    /// The "photo25" asset catalog image resource.
    static let photo25 = DeveloperToolsSupport.ImageResource(name: "photo25", bundle: resourceBundle)

    /// The "photo26" asset catalog image resource.
    static let photo26 = DeveloperToolsSupport.ImageResource(name: "photo26", bundle: resourceBundle)

    /// The "photo27" asset catalog image resource.
    static let photo27 = DeveloperToolsSupport.ImageResource(name: "photo27", bundle: resourceBundle)

    /// The "photo28" asset catalog image resource.
    static let photo28 = DeveloperToolsSupport.ImageResource(name: "photo28", bundle: resourceBundle)

    /// The "photo29" asset catalog image resource.
    static let photo29 = DeveloperToolsSupport.ImageResource(name: "photo29", bundle: resourceBundle)

    /// The "photo3" asset catalog image resource.
    static let photo3 = DeveloperToolsSupport.ImageResource(name: "photo3", bundle: resourceBundle)

    /// The "photo30" asset catalog image resource.
    static let photo30 = DeveloperToolsSupport.ImageResource(name: "photo30", bundle: resourceBundle)

    /// The "photo31" asset catalog image resource.
    static let photo31 = DeveloperToolsSupport.ImageResource(name: "photo31", bundle: resourceBundle)

    /// The "photo32" asset catalog image resource.
    static let photo32 = DeveloperToolsSupport.ImageResource(name: "photo32", bundle: resourceBundle)

    /// The "photo33" asset catalog image resource.
    static let photo33 = DeveloperToolsSupport.ImageResource(name: "photo33", bundle: resourceBundle)

    /// The "photo34" asset catalog image resource.
    static let photo34 = DeveloperToolsSupport.ImageResource(name: "photo34", bundle: resourceBundle)

    /// The "photo35" asset catalog image resource.
    static let photo35 = DeveloperToolsSupport.ImageResource(name: "photo35", bundle: resourceBundle)

    /// The "photo36" asset catalog image resource.
    static let photo36 = DeveloperToolsSupport.ImageResource(name: "photo36", bundle: resourceBundle)

    /// The "photo37" asset catalog image resource.
    static let photo37 = DeveloperToolsSupport.ImageResource(name: "photo37", bundle: resourceBundle)

    /// The "photo38" asset catalog image resource.
    static let photo38 = DeveloperToolsSupport.ImageResource(name: "photo38", bundle: resourceBundle)

    /// The "photo39" asset catalog image resource.
    static let photo39 = DeveloperToolsSupport.ImageResource(name: "photo39", bundle: resourceBundle)

    /// The "photo4" asset catalog image resource.
    static let photo4 = DeveloperToolsSupport.ImageResource(name: "photo4", bundle: resourceBundle)

    /// The "photo5" asset catalog image resource.
    static let photo5 = DeveloperToolsSupport.ImageResource(name: "photo5", bundle: resourceBundle)

    /// The "photo6" asset catalog image resource.
    static let photo6 = DeveloperToolsSupport.ImageResource(name: "photo6", bundle: resourceBundle)

    /// The "photo7" asset catalog image resource.
    static let photo7 = DeveloperToolsSupport.ImageResource(name: "photo7", bundle: resourceBundle)

    /// The "photo8" asset catalog image resource.
    static let photo8 = DeveloperToolsSupport.ImageResource(name: "photo8", bundle: resourceBundle)

    /// The "photo9" asset catalog image resource.
    static let photo9 = DeveloperToolsSupport.ImageResource(name: "photo9", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "photo1" asset catalog image.
    static var photo1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo1)
#else
        .init()
#endif
    }

    /// The "photo10" asset catalog image.
    static var photo10: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo10)
#else
        .init()
#endif
    }

    /// The "photo11" asset catalog image.
    static var photo11: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo11)
#else
        .init()
#endif
    }

    /// The "photo12" asset catalog image.
    static var photo12: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo12)
#else
        .init()
#endif
    }

    /// The "photo13" asset catalog image.
    static var photo13: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo13)
#else
        .init()
#endif
    }

    /// The "photo14" asset catalog image.
    static var photo14: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo14)
#else
        .init()
#endif
    }

    /// The "photo15" asset catalog image.
    static var photo15: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo15)
#else
        .init()
#endif
    }

    /// The "photo16" asset catalog image.
    static var photo16: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo16)
#else
        .init()
#endif
    }

    /// The "photo17" asset catalog image.
    static var photo17: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo17)
#else
        .init()
#endif
    }

    /// The "photo18" asset catalog image.
    static var photo18: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo18)
#else
        .init()
#endif
    }

    /// The "photo19" asset catalog image.
    static var photo19: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo19)
#else
        .init()
#endif
    }

    /// The "photo2" asset catalog image.
    static var photo2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo2)
#else
        .init()
#endif
    }

    /// The "photo20" asset catalog image.
    static var photo20: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo20)
#else
        .init()
#endif
    }

    /// The "photo21" asset catalog image.
    static var photo21: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo21)
#else
        .init()
#endif
    }

    /// The "photo22" asset catalog image.
    static var photo22: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo22)
#else
        .init()
#endif
    }

    /// The "photo23" asset catalog image.
    static var photo23: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo23)
#else
        .init()
#endif
    }

    /// The "photo24" asset catalog image.
    static var photo24: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo24)
#else
        .init()
#endif
    }

    /// The "photo25" asset catalog image.
    static var photo25: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo25)
#else
        .init()
#endif
    }

    /// The "photo26" asset catalog image.
    static var photo26: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo26)
#else
        .init()
#endif
    }

    /// The "photo27" asset catalog image.
    static var photo27: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo27)
#else
        .init()
#endif
    }

    /// The "photo28" asset catalog image.
    static var photo28: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo28)
#else
        .init()
#endif
    }

    /// The "photo29" asset catalog image.
    static var photo29: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo29)
#else
        .init()
#endif
    }

    /// The "photo3" asset catalog image.
    static var photo3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo3)
#else
        .init()
#endif
    }

    /// The "photo30" asset catalog image.
    static var photo30: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo30)
#else
        .init()
#endif
    }

    /// The "photo31" asset catalog image.
    static var photo31: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo31)
#else
        .init()
#endif
    }

    /// The "photo32" asset catalog image.
    static var photo32: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo32)
#else
        .init()
#endif
    }

    /// The "photo33" asset catalog image.
    static var photo33: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo33)
#else
        .init()
#endif
    }

    /// The "photo34" asset catalog image.
    static var photo34: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo34)
#else
        .init()
#endif
    }

    /// The "photo35" asset catalog image.
    static var photo35: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo35)
#else
        .init()
#endif
    }

    /// The "photo36" asset catalog image.
    static var photo36: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo36)
#else
        .init()
#endif
    }

    /// The "photo37" asset catalog image.
    static var photo37: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo37)
#else
        .init()
#endif
    }

    /// The "photo38" asset catalog image.
    static var photo38: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo38)
#else
        .init()
#endif
    }

    /// The "photo39" asset catalog image.
    static var photo39: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo39)
#else
        .init()
#endif
    }

    /// The "photo4" asset catalog image.
    static var photo4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo4)
#else
        .init()
#endif
    }

    /// The "photo5" asset catalog image.
    static var photo5: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo5)
#else
        .init()
#endif
    }

    /// The "photo6" asset catalog image.
    static var photo6: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo6)
#else
        .init()
#endif
    }

    /// The "photo7" asset catalog image.
    static var photo7: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo7)
#else
        .init()
#endif
    }

    /// The "photo8" asset catalog image.
    static var photo8: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo8)
#else
        .init()
#endif
    }

    /// The "photo9" asset catalog image.
    static var photo9: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .photo9)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "photo1" asset catalog image.
    static var photo1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo1)
#else
        .init()
#endif
    }

    /// The "photo10" asset catalog image.
    static var photo10: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo10)
#else
        .init()
#endif
    }

    /// The "photo11" asset catalog image.
    static var photo11: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo11)
#else
        .init()
#endif
    }

    /// The "photo12" asset catalog image.
    static var photo12: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo12)
#else
        .init()
#endif
    }

    /// The "photo13" asset catalog image.
    static var photo13: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo13)
#else
        .init()
#endif
    }

    /// The "photo14" asset catalog image.
    static var photo14: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo14)
#else
        .init()
#endif
    }

    /// The "photo15" asset catalog image.
    static var photo15: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo15)
#else
        .init()
#endif
    }

    /// The "photo16" asset catalog image.
    static var photo16: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo16)
#else
        .init()
#endif
    }

    /// The "photo17" asset catalog image.
    static var photo17: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo17)
#else
        .init()
#endif
    }

    /// The "photo18" asset catalog image.
    static var photo18: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo18)
#else
        .init()
#endif
    }

    /// The "photo19" asset catalog image.
    static var photo19: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo19)
#else
        .init()
#endif
    }

    /// The "photo2" asset catalog image.
    static var photo2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo2)
#else
        .init()
#endif
    }

    /// The "photo20" asset catalog image.
    static var photo20: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo20)
#else
        .init()
#endif
    }

    /// The "photo21" asset catalog image.
    static var photo21: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo21)
#else
        .init()
#endif
    }

    /// The "photo22" asset catalog image.
    static var photo22: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo22)
#else
        .init()
#endif
    }

    /// The "photo23" asset catalog image.
    static var photo23: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo23)
#else
        .init()
#endif
    }

    /// The "photo24" asset catalog image.
    static var photo24: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo24)
#else
        .init()
#endif
    }

    /// The "photo25" asset catalog image.
    static var photo25: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo25)
#else
        .init()
#endif
    }

    /// The "photo26" asset catalog image.
    static var photo26: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo26)
#else
        .init()
#endif
    }

    /// The "photo27" asset catalog image.
    static var photo27: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo27)
#else
        .init()
#endif
    }

    /// The "photo28" asset catalog image.
    static var photo28: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo28)
#else
        .init()
#endif
    }

    /// The "photo29" asset catalog image.
    static var photo29: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo29)
#else
        .init()
#endif
    }

    /// The "photo3" asset catalog image.
    static var photo3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo3)
#else
        .init()
#endif
    }

    /// The "photo30" asset catalog image.
    static var photo30: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo30)
#else
        .init()
#endif
    }

    /// The "photo31" asset catalog image.
    static var photo31: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo31)
#else
        .init()
#endif
    }

    /// The "photo32" asset catalog image.
    static var photo32: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo32)
#else
        .init()
#endif
    }

    /// The "photo33" asset catalog image.
    static var photo33: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo33)
#else
        .init()
#endif
    }

    /// The "photo34" asset catalog image.
    static var photo34: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo34)
#else
        .init()
#endif
    }

    /// The "photo35" asset catalog image.
    static var photo35: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo35)
#else
        .init()
#endif
    }

    /// The "photo36" asset catalog image.
    static var photo36: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo36)
#else
        .init()
#endif
    }

    /// The "photo37" asset catalog image.
    static var photo37: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo37)
#else
        .init()
#endif
    }

    /// The "photo38" asset catalog image.
    static var photo38: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo38)
#else
        .init()
#endif
    }

    /// The "photo39" asset catalog image.
    static var photo39: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo39)
#else
        .init()
#endif
    }

    /// The "photo4" asset catalog image.
    static var photo4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo4)
#else
        .init()
#endif
    }

    /// The "photo5" asset catalog image.
    static var photo5: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo5)
#else
        .init()
#endif
    }

    /// The "photo6" asset catalog image.
    static var photo6: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo6)
#else
        .init()
#endif
    }

    /// The "photo7" asset catalog image.
    static var photo7: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo7)
#else
        .init()
#endif
    }

    /// The "photo8" asset catalog image.
    static var photo8: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo8)
#else
        .init()
#endif
    }

    /// The "photo9" asset catalog image.
    static var photo9: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .photo9)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

