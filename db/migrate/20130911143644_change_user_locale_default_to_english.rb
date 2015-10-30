class ChangeUserLocaleDefaultToEnglish < ActiveRecord::Migration
  def change
    change_column :users, :locale, :text, :default => 'en'
    User.update_all(:locale => "en")
  end
end
