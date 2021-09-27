class Question:
     def __init__(self, prompt, answer):
          self.prompt = prompt
          self.answer = answer

question_prompts = [
     "What is a function of OSPF hello packets?\n1: to send specifically requested link-state records \n2: to discover neighbors and build adjacencies between them\n3: to ensure database synchronization between routers \n4: to request specific link-state records from neighbor routers\n ",
     "What color are bananas?\n(a) Red/Green\n(b)Yellow",
     "Which OPSF packet contains the different types of link-state advertisements?\n1: hello\n2: DBD\n3: LSR\n4: LSU\n5: LSAck"
]

questions = [
     Question(question_prompts[0], "2"),
     Question(question_prompts[1], "b"),
     Question(question_prompts[2], "4"),
]

def run_quiz(questions):
     score = 0
     for question in questions:
          answer = input(question.prompt)
          if answer == question.answer:
               score += 1
          else:
              print("That was incorrect")
     print("you got", score, "out of", len(questions))

run_quiz(questions)
