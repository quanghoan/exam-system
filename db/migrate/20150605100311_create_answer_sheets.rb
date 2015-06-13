class CreateAnswerSheets < ActiveRecord::Migration
  def change
    create_table :answer_sheets do |t|
    	t.integer :user_session_exam_id
    	t.integer :user_id
    	t.integer :session_exam_id
    	t.integer :time_session_id
      t.timestamps null: false
    end
  end
end
