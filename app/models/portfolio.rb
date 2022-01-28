# frozen_string_literal: true

class Portfolio < ApplicationRecord
  validates :title, :main_image, presence: true
end
