# ConstraintsIssue
Small Xcode/Swift project demonstrating an issue where displaying a `UIAlertController` has constraints issues on an iPhone.

A simple single-view app. The view contains one button and one label.
Tapping the button will display a UIAlertController action sheet.
The issue happens the moment when the action sheet appears from the bottom
of the iPhone screen, some constraint warnings appear in the debug output.
* It works fine on the iPad, as the action sheet does not slide up from the bottom of the screen like the iPhone.
* `.alert` works fine, as it displays in the center of the screen.
     
https://stackoverflow.com/questions/44425217/basic-uialertcontroller-unable-to-satisfy-constraints
Someone had posted this on Stack Overflow, but got no helpful responses.
Only accusations of doing something wrong.
