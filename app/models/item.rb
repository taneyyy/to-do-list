
# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  date       :date
#  done       :boolean
#

class Item < ApplicationRecord
    validates :name, presence: {message: "To-do item cannot be empty"}
end
