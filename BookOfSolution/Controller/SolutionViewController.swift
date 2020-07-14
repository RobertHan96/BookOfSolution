import UIKit

class SolutionViewController: UIViewController {
    @IBOutlet weak var wisdomLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let randomIndex = makeRandomNum()
        wisdomLabel.adjustsFontSizeToFitWidth = true
        wisdomLabel.text = widoms[randomIndex]
    }
    
    // 해결문구가 서서히 나타나도록 애니메이션을 적용한 부분
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3) {
            self.wisdomLabel.alpha = 0.0
            self.wisdomLabel.alpha = 1.0
            self.wisdomLabel.textColor = .darkText
        }
    }
   
}
