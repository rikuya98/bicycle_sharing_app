class Prefecture < ApplicationRecord
    include JpPrefecture
    has_many :articles
end
