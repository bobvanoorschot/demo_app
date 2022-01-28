# frozen_string_literal: true

class AddShowToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :show, :integer, default: 0
  end
end
