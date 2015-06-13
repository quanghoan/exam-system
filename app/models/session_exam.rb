class SessionExam < ActiveRecord::Base
	belongs_to :exam 
	has_many :users, through: :user_session_exams
	has_many :user_session_exams, dependent: :destroy
	validates :exam_id, presence:true
	validates :name, presence:true
	has_one :answer_sheet
end
