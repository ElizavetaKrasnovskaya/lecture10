import UIKit

class SecondStoryboardViewController: UIViewController {
    
    var name: String = ""
    var user = User() {
        didSet {
            closeController()
        }
    }
    
    // MARK: - Override methods
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        
        guard let destinationViewController = self.presentingViewController as? SegueViewController
        else { return }
        
        destinationViewController.user = user
    }
    
    // MARK: - Private methods
    private func closeController() {
        self.dismiss(animated: false)
    }
    
    // MARK: - IBActions
    @IBAction func goToNext(_ sender: UIButton) {
        performSegue(withIdentifier: "toLast", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueViewController = segue.destination as? LastViewController {
            segueViewController.name = name
        }
    }
}
