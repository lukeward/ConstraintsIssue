import UIKit

/*
 A simple single-view app. The view contains one button and one label.
 Tapping the button will display a UIAlertController action sheet.
 The issue happens the moment when the action sheet appears from the bottom
 of the iPhone screen, some constraint warnings appear in the debug output.
      - It works fine on the iPad, as the action sheet does not slide up from
        the bottom of the screen like the iPhone.
      - .alert works fine, as it displays in the center of the screen.
 
 https://stackoverflow.com/questions/44425217/basic-uialertcontroller-unable-to-satisfy-constraints
 Someone had posted this on Stack Overflow, but got no helpful responses.
 Only accusations of doing something wrong.
 */
class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!

    @IBAction func displayAlert_Tapped(_ sender: UIButton) {
        let handler: (UIAlertAction) -> Void = { action in self.label.text = action.title }
        
        let firstAction = UIAlertAction(title: "First Action", style: .default, handler: handler)
        let secondAction = UIAlertAction(title: "Second Action", style: .default, handler: handler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: handler)
        
        // If the preferredStyle is set to .alert, the constraint issues go away.
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(cancelAction)
        
        alert.modalPresentationStyle = .popover
        
        // For the iPad. Popover will only have a value if alert is a .actionSheet.
        if let popover = alert.popoverPresentationController {
            popover.sourceView = button
            popover.sourceRect = button.bounds
            popover.permittedArrowDirections = .up
        }
        
        present(alert, animated: true, completion: nil)
    }
}
