# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @name = 'Bob'
    @blog = Blog.last
  end

  def about
    @name = 'Bob'
    @skills = Skill.all
  end

  def contact; end
end
