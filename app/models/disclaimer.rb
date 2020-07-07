class Disclaimer < ApplicationRecord
  belongs_to :employee, class_name: User
  belongs_to :city
  belongs_to :business
  belongs_to :creator, class_name: User
  has_many :disclaimer_quiz_defaults
  has_many :quizzes

  def add_quiz_default(oParams)
    oParams.each do | qd |
      self.disclaimer_quiz_defaults << DisclaimerQuizDefault.new({:quiz_default_id => qd["id"], :response_content => qd["response"]})
    end
  end

  def add_quiz(oParams)
    oParams.each do | qd |
      self.quizzes << Quiz.new({:content => qd["quiz"], :response_content => qd["response"]})
    end
  end
end
