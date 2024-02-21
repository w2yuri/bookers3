class RenameSelfIntroductionToIntroduction < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :self_introduction, :introduction
  end
end
