import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var choice1ButtonLabel: UIButton!
    @IBOutlet weak var choice2ButtonLabel: UIButton!
    @IBOutlet weak var choice3ButtonLabel: UIButton!
    @IBOutlet weak var progressBarLabel: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonAction(_ sender: UIButton) {
        updateUI()
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
                
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    @objc func updateUI(){
        questionTextLabel.text = quizBrain.getQuestionText()
        progressBarLabel.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1ButtonLabel.setTitle(quizBrain.choiceInUI(order: 0), for: .normal)
        choice2ButtonLabel.setTitle(quizBrain.choiceInUI(order: 1), for: .normal)
        choice3ButtonLabel.setTitle(quizBrain.choiceInUI(order: 2), for: .normal)
        
        choice1ButtonLabel.backgroundColor = UIColor.clear
        choice2ButtonLabel.backgroundColor = UIColor.clear
        choice3ButtonLabel.backgroundColor = UIColor.clear
    }
    
}

