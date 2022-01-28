# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog, type: :model do
  context 'On creation' do
    it 'should be draft' do
      blog = Blog.create!
      expect(blog.draft?).to eq(true)
      expect(blog.published?).to eq(false)
    end
  end
end
