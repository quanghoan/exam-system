class Answer < ActiveRecord::Base
	belongs_to :question
	validates :content, presence: true
	belongs_to :answer_sheet
end
