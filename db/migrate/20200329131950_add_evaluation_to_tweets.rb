class AddEvaluationToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :evaluation, :text
  end
end
