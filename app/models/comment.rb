class Comment < ApplicationRecord
    has_many: :nest_comments
    belongs_to :article
    belongs_to :user

end
