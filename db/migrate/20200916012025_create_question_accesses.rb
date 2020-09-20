class CreateQuestionAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :question_accesses do |t|
      t.datetime :date
      t.integer :times_accessed
      t.references :question, null: false, foreign_key: true

    end
  end
end
