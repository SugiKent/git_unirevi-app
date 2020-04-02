class AddDetailToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :detail, :text
  end
end
