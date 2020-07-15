import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setGestureRecogniezer()
    }
    
    func setupUI() {
        titleLabel.text = "title".localized
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setGestureRecogniezer() {
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(goSolutionViewAction(_:)))
        upSwipeGesture.direction = .left
        view.addGestureRecognizer(upSwipeGesture)
    }
    
    @IBAction func goSolutionViewAction (_ sender : UISwipeGestureRecognizer) {
        guard let wisdomVC =
        self.storyboard?.instantiateViewController(withIdentifier: "wisdomVC") else {return}
        wisdomVC.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        wisdomVC.modalPresentationStyle = .fullScreen
        if sender.direction == .left {
            self.present(wisdomVC, animated: true, completion: nil)
        }
    }

}
