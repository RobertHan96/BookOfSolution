import UIKit
import GoogleMobileAds
let interstitialID = "ca-app-pub-3940256099942544/4411468910"

class SolutionViewController: UIViewController, GADInterstitialDelegate {
    @IBOutlet weak var wisdomLabel: UILabel!
    var bannerView : GADBannerView!
    var interestitial : GADInterstitial!

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.interestitial = self.createAndLoadInterstitial()
        }
        solutionCount += 1
        let randomIndex = makeRandomNum()
        wisdomLabel.adjustsFontSizeToFitWidth = true
        wisdomLabel.text = widoms[randomIndex]
        wisdomLabel.alpha = 0.0
        makeAndPresentBanner()

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            if checkAdsPopup(widsomCount: solutionCount) == true {
                self.interestitial.present(fromRootViewController: self)
            }
        }
    }
    
    // 해결문구가 서서히 나타나도록 애니메이션을 적용한 부분
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3) {
            self.wisdomLabel.alpha = 1.0
        }
    }
   
    // 하단 배너뷰 생성 함수
    func makeAndPresentBanner() {
        bannerView = GADBannerView(adSize: kGADAdSizeLargeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    // 전명광고 로드 및 객체 생성 함수
    func createAndLoadInterstitial() -> GADInterstitial {
      let interstitial =
          GADInterstitial(adUnitID: interstitialID )
      interstitial.delegate = self
      interstitial.load(GADRequest())
      return interstitial
    }
    // 전면광고 수신 완료여부를 트래킹하는 함수
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
          print("interstitial Ads DidReceiveAd")
      }
    // 전면광고 수신 실패시 실행되는 함수, 에러 코드 출력용
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("Fail to load interestitial Ads : \(error.localizedDescription)")
    }
    // 전면광고 시청 후 창을 닫았을때 출력되는 함수, 이 함수를 기점으로 새로운 전면광고 객체를 생성
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("play interestitial is finished")
        self.interestitial = createAndLoadInterstitial()
    }
    
    // 광고배너의 위치를 지정하는 함수
    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
      view.addConstraints(
        [NSLayoutConstraint(item: bannerView,
                            attribute: .bottom,
                            relatedBy: .equal,
                            toItem: bottomLayoutGuide,
                            attribute: .top,
                            multiplier: 1,
                            constant: 0),
         NSLayoutConstraint(item: bannerView,
                            attribute: .centerX,
                            relatedBy: .equal,
                            toItem: view,
                            attribute: .centerX,
                            multiplier: 1,
                            constant: 0)
        ])
     }
}
