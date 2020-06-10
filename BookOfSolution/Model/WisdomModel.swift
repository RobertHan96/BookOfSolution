import Foundation
import GoogleMobileAds

let widoms : [String] = [
    "wisdom1".localized, "wisdom2".localized, "wisdom3".localized, "wisdom4".localized,
    "wisdom5".localized, "wisdom6".localized

    ]

var solutionCount = 0

func makeRandomNum() -> Int {
    let randomIndex = arc4random_uniform(UInt32(widoms.count))
    return Int(randomIndex)
}

func checkAdsPopup(widsomCount : Int) -> Bool {
    var check : Bool = false
    if widsomCount % 3 == 0 {
        check = true
    }
    return check
}
