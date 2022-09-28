import UIKit

class LastViewController: UIViewController {
    
    // MARK: - Public properties
    var name: String = ""
    var user = User()
    
    // MARK: - IBOutlets
    @IBOutlet weak var tvName: UILabel!
    @IBOutlet weak var etEmail: UITextField!
    @IBOutlet weak var etPassword: UITextField!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        
        guard let destinationViewController = self.presentingViewController as? SecondStoryboardViewController
        else { return }
        
        destinationViewController.user = user
    }
    
    // MARK: - Private methods
    private func initView() {
        tvName.text = name
    }
    
    private func isEmptyData() -> Bool {
        return tvName.text?.isEmpty ?? true ||
        etEmail.text?.isEmpty ?? true
    }
    
    // MARK: - IBActions
    @IBAction func goToStart(_ sender: UIButton) {
        if !isEmptyData() {
            user = User(
                name: tvName.text ?? "",
                email: etEmail.text ?? "",
                password: etPassword.text ?? ""
            )
            
            self.dismiss(animated: false)
        } else {
            self.showToast(message: "Enter information about you")
        }
    }
}
