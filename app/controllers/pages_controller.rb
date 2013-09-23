class PagesController < ApplicationController
  # before_filter - calls the method that initializes global instance variables that is 
  # available across all methods for that one instance during the call into PagesController
  # so all of the instance variables are accessible throughout
  before_filter :home
  def home
    @categories = %w(finance retail energy technology biotech real_estate industrial beverage)
    @selected_category = params[:categories]
  end

  def ideas
    @topics = Topic.all
  end

  def login

  end

  def new_idea
  end

  def contact_us
    # correct syntax for hash with two words: @contact = params[:"contact us"] - put "contact us" in the field_tag name too.
    @name = params[:name]
    @email = params[:"email address"]
    if params[:commit]
      flash[:error] = ""
      if @name.nil? || @name.empty?
        flash.now[:error] << "name can't be blank.<br/>"
      end
      if @email.nil? || @email.empty?
        flash.now[:error] << "email can't be blank.<br/>"
      end
    end
    # flash[:notice] = "there might be a problem"

  end
end
