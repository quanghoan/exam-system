class Question < ActiveRecord::Base
	has_many :exams, through: :exam_questions
	has_many :exam_questions
	has_many :answers, :dependent => :destroy
	accepts_nested_attributes_for :answers, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy =>true
	validates :content, presence: true
end
