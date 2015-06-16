class AnswerSheet < ActiveRecord::Base
	has_many :answers, dependent: :destroy
	belongs_to :user_session_exam
	belongs_to :user 
	
	accepts_nested_attributes_for :answers
	has_one :session_exam
end
