# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :blog

  scope :desc, -> { order(created_at: :desc) }

  enum show: { hide: 0, visible: 1 }
end
