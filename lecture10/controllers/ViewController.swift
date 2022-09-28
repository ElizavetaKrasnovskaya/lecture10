import UIKit

class ViewController: UIViewController {
    
    // MARK: - Public properties
    var user = User() {
        didSet {
            initView(isFirstLoad: false)
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var etName: UITextField!
    @IBOutlet weak var tvName: UILabel!
    @IBOutlet weak var tvEmail: UILabel!
    @IBOutlet weak var tvPassword: UILabel!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initView(isFirstLoad: true)
    }
    
    // MARK: - Private methods
    private func initView(isFirstLoad: Bool) {
        if isFirstLoad {
            etName.alpha = 1
            tvName.alpha = 0
            tvEmail.alpha = 0
            tvPassword.alpha = 0
        } else {
            etName.alpha = 0
            tvName.alpha = 1
            tvEmail.alpha = 1
            tvPassword.alpha = 1
            setUserData()
        }
    }
    
    private func setUserData() {
        tvName.text = user.name
        tvEmail.text = user.email
        tvPassword.text = user.password
    }
    
    // MARK: - IBActions
    @IBAction func toNextScreen(_ sender: UIButton) {
        let etName: String = etName.text ?? ""
        if etName.isEmpty == false {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "PresentViewController") as? PresentViewController
            else { return }
            
            destinationViewController.name = etName
            
            present(destinationViewController, animated: false)
        } else {
            self.showToast(message: "Enter your name!")
        }
    }
}
