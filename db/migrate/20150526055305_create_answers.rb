class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :content
      t.string :correct_answer

      t.timestamps null: false
    end
  end
end
