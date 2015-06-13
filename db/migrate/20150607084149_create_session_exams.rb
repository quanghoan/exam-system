class CreateSessionExams < ActiveRecord::Migration
  def change
    create_table :session_exams do |t|
    	t.integer :exam_id
    	t.string :name
    	t.timestamps null: false
    end
  end
end
