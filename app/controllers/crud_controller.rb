# frozen_string_literal: true

class CrudController < ApplicationController
  before_action :resource, only: %i[show edit update destroy]

  def index
    instance_variable_set("@#{model_name.pluralize}", model.all)
  end

  def create
    @resource = model.new(default_params)
    instance_variable_set("@#{model_name}", @resource)

    respond_to do |format|
      if @resource.save
        format.html do
          redirect_to send("#{model_path}_url", @resource), notice: "#{model_name.capitalize} was successfully created."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def new
    instance_variable_set("@#{model_name}", model.new)
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @resource.update(default_params)
        format.html do
          redirect_to send("#{model_path}_url", @resource), notice: "#{model_name.capitalize} was successfully updated."
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource.destroy

    respond_to do |format|
      format.html do
        redirect_to send("#{model_path.pluralize}_url", @resource),
                    notice: "#{model_name.capitalize} was successfully destroyed."
      end
    end
  end

  def model_path
    model_name
  end

  def friendly
    false
  end

  protected

  def resource
    @resource ||= model.friendly.find(params[:id]) if friendly
    @resource ||= model.find(params[:id]) unless friendly
    instance_variable_set("@#{model_name}", @resource)
  end

  def model
    model_name.capitalize.constantize
  end

  def default_params
    params.require(model_name).permit(model.column_names)
  end
end
