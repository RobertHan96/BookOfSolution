import UIKit

class SolutionViewController: UIViewController {
    @IBOutlet weak var wisdomLabel: UILabel!
    let randomIndex = makeRandomNum()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setGestureRecogniezer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3) {
            self.wisdomLabel.alpha = 0.0
            self.wisdomLabel.alpha = 1.0
        }
    }
    
    func setupUI() {
        wisdomLabel.adjustsFontSizeToFitWidth = true
        wisdomLabel.text = widoms[randomIndex]
    }
    
    func setGestureRecogniezer() {
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(goBackAction(_:)))
        upSwipeGesture.direction = .right
        view.addGestureRecognizer(upSwipeGesture)
    }
    
    @IBAction func goBackAction (_ sender : UISwipeGestureRecognizer) {
        if sender.direction == .right {
            self.dismiss(animated: true, completion: nil)
        }
    }
   
}
