class CreateAnswerSheets < ActiveRecord::Migration
  def change
    create_table :answer_sheets do |t|
    	t.integer :user_id
    	t.integer :session_exam_id
    	t.integer :question_id
      t.timestamps null: false
    end
  end
end
