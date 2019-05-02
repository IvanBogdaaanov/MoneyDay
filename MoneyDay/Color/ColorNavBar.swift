//
//  ColorNavBar.swift
//  MoneyDay
//
//  Created by Иван on 15.04.2019.
//  Copyright © 2019 ivan. All rights reserved.
//


import UIKit

extension UIColor {
    static var diagramOrange2: UIColor {
        return UIColor(r: 255, g: 173, b: 140, a: 1)
    }
}

extension UIColor {
    static var diagramPurple: UIColor {
        return UIColor(r: 87, g: 87, b: 140, a: 1)
    }
}

extension UIColor {
    static var diagramBlue2: UIColor {
        return UIColor(r: 36, g: 113, b: 140, a: 1)
    }
}

extension UIColor {
    static var diagramGreen2: UIColor {
        return UIColor(r: 63, g: 190, b: 140, a: 1)
    }
}

extension UIColor {
    static var diagramPink: UIColor {
        return UIColor(r: 250, g: 146, b: 140, a: 1)
    }
}

extension UIColor {
    static var diagramGray: UIColor {
        return UIColor(r: 135, g: 135, b: 140, a: 1)
    }
}

extension UIColor {
    static var diagramOrange: UIColor {
        return UIColor(r: 255, g: 210, b: 140, a: 1)
    }
}

extension UIColor {
    static var diagramYellow: UIColor {
        return UIColor(r: 255, g: 247, b: 140, a: 1)
    }
}

extension UIColor {
    static var diagramGreen: UIColor {
        return UIColor(r: 197, g: 255, b: 140, a: 1)
    }
}

extension UIColor {
    static var diagramBlue: UIColor {
        return UIColor(r: 140, g: 235, b: 255, a: 1)
    }
}

extension UIColor {
    static var one: UIColor {
        return UIColor(r: 123, g: 123, b: 123, a: 1)
    }
}
extension UIColor {
    static var two: UIColor {
        return UIColor(r: 142, g: 142, b: 142, a: 1)
    }
}
extension UIColor {
    static var three: UIColor {
        return UIColor(r: 84, g: 87, b: 88, a: 1)
    }
}

extension UIColor {
    static var skyColor: UIColor {
        return UIColor(r: 0, g: 172, b: 238, a: 1)
    }
}

extension UIColor {
    static var colorForLabel: UIColor {
        return UIColor(r: 74, g: 74, b: 74, a: 1)
    }
}

extension UIColor {
    static var lightGray: UIColor {
        return UIColor(r: 248, g: 245, b: 246, a: 1)
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
