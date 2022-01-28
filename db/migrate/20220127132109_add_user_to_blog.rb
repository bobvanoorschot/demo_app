# frozen_string_literal: true

class AddUserToBlog < ActiveRecord::Migration[7.0]
  def change
    add_reference :blogs, :user, foreign_key: true
  end
end
