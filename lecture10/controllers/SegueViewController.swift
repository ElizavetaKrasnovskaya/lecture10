import UIKit

class SegueViewController: UIViewController {
    
    // MARK: - Public properties
    var name: String = ""
    var user = User() {
        didSet {
            closeController()
        }
    }
    
    // MARK: - Override methods
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        
        guard let destinationViewController = self.presentingViewController as? PresentViewController
        else { return }
        
        destinationViewController.user = user
    }
    
    // MARK: - Private methods
    private func closeController() {
        self.dismiss(animated: false)
    }
    
    // MARK: - IBActions
    @IBAction func goToNext(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SecondStoryboardViewController") as? SecondStoryboardViewController
        else { return }
        
        destinationViewController.name = name
        
        present(destinationViewController, animated: false)
    }
}
