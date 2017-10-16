class RenameColumnToQuestions < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :introduction, :subject_line
  end
end
