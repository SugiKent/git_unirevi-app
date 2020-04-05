class AddFacultyToUsers < ActiveRecord::Migration[5.2]
  def change
    # facultyってstringでいいのか？
    # 任意の文字列をユーザーが保存できてしまって、データとしていろんなパターンが生まれて扱いづらそう
    # 「経営」「経営学部」「経営 学部」
    # Facultyモデルを作ってassociationを作るのが一番
    add_column :users, :faculty, :string
  end
end
