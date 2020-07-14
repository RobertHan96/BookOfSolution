import Foundation

let widoms : [String] = [
    "wisdom1".localized, "wisdom2".localized, "wisdom3".localized, "wisdom4".localized,
    "wisdom5".localized, "wisdom6".localized, "wisdom7".localized, "wisdom8".localized,
    "wisdom9".localized, "wisdom10".localized, "wisdom11".localized,
    "wisdom12".localized, "wisdom13".localized, "wisdom14".localized,
    "wisdom15".localized, "wisdom16".localized, "wisdom17".localized,
    "wisdom18".localized, "wisdom19".localized, "wisdom20".localized

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
