class Exam < ActiveRecord::Base
	has_many :questions, through: :exam_questions
  has_many :exam_questions, dependent: :destroy
	accepts_nested_attributes_for :questions, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true
	validates :name, presence: true
	has_many :session_exams, dependent: :destroy
end
