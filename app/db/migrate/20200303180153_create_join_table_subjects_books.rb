class CreateJoinTableSubjectsBooks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subjects, :books do |t|
      t.index [:subject_id, :book_id]
      t.index [:book_id, :subject_id]
    end
  end
end
