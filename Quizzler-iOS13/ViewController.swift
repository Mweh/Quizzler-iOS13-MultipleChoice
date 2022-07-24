import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var trueButtonLabel: UIButton!
    @IBOutlet weak var falseButtonLabel: UIButton!
    @IBOutlet weak var progressBarLabel: UIProgressView!
    
    let quiz = [["Four + Two is equal to Six.", "True"],
                ["Five - Three is greater than One.", "True"],
                ["Three + Eight is less than Ten.", "False"]]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonAction(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        
        if userAnswer == quiz[questionNumber][1]{
            print("Right!")
        } else {
            print("Wrong!")
        }

        if questionNumber < 2{
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        updateUI()

    }
    
    func updateUI(){
        questionTextLabel.text = quiz[questionNumber][0]
    }
    
}

