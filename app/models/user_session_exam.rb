class UserSessionExam < ActiveRecord::Base
	belongs_to :user 
	belongs_to :session_exam 
	has_many :answer_sheets

	def get_questions
		self.session_exam.exam.get_questions
	end
end
