"""A Trivia Quiz Game with AI-Enhanced Feedback"""

import random;
import from mtllm.llm { Model }

# glob llm = Model(model_name="gpt-4o", verbose=False);
glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Provide an engaging hint or explanation for an incorrect answer"""
def give_feedback(answer: str, correct_answer: str, question_text: str) -> str by llm();

walker TriviaQuiz {
    has answer: str;

    can start with `root entry;
    can process_answer with question entry;
}

node question {
    has question_text: str = random.choice([
        "What is the capital of France?",
        "Which planet is known as the Red Planet?",
        "What is 2 + 2?"
    ]);
    has correct_answer: str = switch(question_text) {
        case "What is the capital of France?": "Paris";
        case "Which planet is known as the Red Planet?": "Mars";
        case "What is 2 + 2?": "4";
        default: "";
    };
}

# Will run when in CLI mode (not in cloud)
with entry:__main__ {
    root spawn TriviaQuiz("Paris");
    root spawn TriviaQuiz("Jupiter");
    root spawn TriviaQuiz("4");
    root spawn TriviaQuiz("Florida");
}
