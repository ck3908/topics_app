class IdeasController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  before_action :set_topic, only: [:show]
  # This controller is for user views - uses the model from Topic

  # GET /ideas
  # GET /ideas.json
  def index
    # @topics = Topic.order("sector ASC").paginate(:page => params[:page], per_page: 15)
    @topics = Topic.paginate(:page => params[:page], per_page: 15)
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @topic = Topic.find(params[:id])
  end

  # GET /ideas/new
  def new
    @topic = Topic.new
  end

  # show detailed info of list
  def list
    # @topics = Topic.all   - use will paginate gem instead
    @topics = Topic.paginate(:page => params[:page], per_page: 5)
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

  private

  # copy from Topics Controller
  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def topic_params
    params.require(:topic).permit(:title, :sector, :content, :made_by)
  end

    # Comment out auto generated
    # Use callbacks to share common setup or constraints between actions.
    #def set_idea
     # @idea = Idea.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def idea_params
     # params.require(:idea).permit(:index, :show)
    #end
end
