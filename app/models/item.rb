class Item < ApplicationRecord
    validates :name, presence: {message: "To-do item cannot be empty"}
end
