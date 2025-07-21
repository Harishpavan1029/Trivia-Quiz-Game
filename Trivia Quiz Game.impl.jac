impl TriviaQuiz.start {
    if not [root --> (`?question)] {
        next = root ++> question();
    } else {
        next = [root --> (`?question)];
    }
    visit next;
}

impl TriviaQuiz.process_answer {
    if [-->] {
        visit [-->];
    } else {
        if self.answer == here.correct_answer {
            print("Correct! Well done.");
            disengage;
        } else {
            print(give_feedback(self.answer, here.correct_answer, here.question_text));
            here ++> question();
        }
    }
}
