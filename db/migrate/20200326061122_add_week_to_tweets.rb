class AddWeekToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :week, :string
  end
end
