import UIKit

class PresentViewController: UIViewController {
    
    // MARK: - Public properties
    var name: String = ""
    var user = User() {
        didSet {
            closeController()
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var tvName: UILabel!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        
        guard let destinationViewController = self.presentingViewController as? ViewController
        else { return }
        
        destinationViewController.user = user
    }
    
    // MARK: - Private methods
    private func initView() {
        view.backgroundColor = .white
        tvName.text = "Hi, \(name)"
    }
    
    private func closeController() {
        self.dismiss(animated: false)
    }
    
    // MARK: - IBActions
    @IBAction func goToNext(_ sender: UIButton) {
        performSegue(withIdentifier: "toSegue", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueViewController = segue.destination as? SegueViewController {
            segueViewController.name = name
        }
    }
}
