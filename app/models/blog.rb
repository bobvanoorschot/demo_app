# frozen_string_literal: true

class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :image

  after_save :set_comment_show

  CATEGORIES = %w[news updates].freeze

  has_many :comments, dependent: :destroy
  belongs_to :user, optional: true

  enum status: { draft: 0, published: 1 }

  validates :category, inclusion: CATEGORIES

  CATEGORIES.each do |cat|
    define_method "#{cat}?" do
      category == cat
    end
  end

  def set_comment_show
    service = CommentService.new(self)

    service.update_comments_show
  end
end
