class Review < ApplicationRecord
    belongs_to :tweet
     belongs_to :user

    # ここはユーザーが任意にデータを作成するmodelだと思うので、validationをもっと書こう
end
