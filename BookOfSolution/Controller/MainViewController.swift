import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "title".localized
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
        upSwipeGesture.direction = .left
        view.addGestureRecognizer(upSwipeGesture)
    }
    
    @IBAction func swipeAction (_ sender : UISwipeGestureRecognizer) {
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let wisdomVC = self.storyboard?.instantiateViewController(identifier: "wisdomVC") else {return}
        wisdomVC.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        if sender.direction == .left {
            self.present(wisdomVC, animated: true, completion: nil)
        }
    }

}
