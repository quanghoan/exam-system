class AnswerSheet < ActiveRecord::Base
	has_many :answers, dependent: :destroy
	belongs_to :user_session_exam
	belongs_to :user 
	
	accepts_nested_attributes_for :answers
	has_one :session_exam

	def get_time_limit
		user_session_exam = UserSessionExam.find(self.user_session_exam_id)
		user_session_exam.session_exam.exam.time_limit.minutes.to_i
	end
end
