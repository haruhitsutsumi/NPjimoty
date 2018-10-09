class DealsController < ApplicationController
  before_action:authenticate_user,{only:[:new,:edit,:update]}


  def index
    @deals =Deal.all.order(created_at: :desc)
  #  @user = @deals.user
  end

  def show
    @deal = Deal.find_by(id: params[:id])
    @user = @deal.user
  end
  def new
    @deal=Deal.new
  end

  def create
    @deal = Deal.new
    @deal.user_id = @current_user.id
    @deal.category = params[:category]
    @deal.title = params[:title]
    @deal.deal_detail = params[:deal_detail]
    if @deal.save
      if params[:photo1]
        @deal.photo1="#{@deal.id}_1.jpg"
        photo = params[:photo1]
        File.binwrite("public/deal_photoes/#{@deal.photo1}",photo.read)
      end
      if params[:photo2]
        @deal.photo2="#{@deal.id}_2.jpg"
        photo = params[:photo2]
        File.binwrite("public/deal_photoes/#{@deal.photo2}",photo.read)
      end
      if params[:photo3]
        @deal.photo3="#{@deal.id}_3.jpg"
        photo = params[:photo3]
        File.binwrite("public/deal_photoes/#{@deal.photo3}",photo.read)
      end
      if params[:photo4]
        @deal.photo4="#{@deal.id}_4.jpg"
        photo = params[:photo4]
        File.binwrite("public/deal_photoes/#{@deal.photo4}",photo.read)
      end
      @deal.save
      flash[:notice]="取引が登録されました"
      redirect_to("/deals/index")
    else
      render("/deals/new")
    end
  end



  def edit
    @deal = Deal.find_by(id: params[:id])
  end

  def update
    @deal = Deal.find_by(id: params[:id])
    @deal.category = params[:category]
    @deal.title = params[:title]
    @deal.deal_detail = params[:deal_detail]
  if params[:photo1]
    @deal.photo1="#{@deal.id}_1.jpg"
    photo = params[:photo1]
    File.binwrite("public/deal_photoes/#{@deal.photo1}",photo.read)
  end
  if params[:photo2]
    @deal.photo2="#{@deal.id}_2.jpg"
    photo = params[:photo2]
    File.binwrite("public/deal_photoes/#{@deal.photo2}",photo.read)
  end
  if params[:photo3]
    @deal.photo3="#{@deal.id}_3.jpg"
    photo = params[:photo3]
    File.binwrite("public/deal_photoes/#{@deal.photo3}",photo.read)
  end
  if params[:photo4]
    @deal.photo1="#{@deal.id}_4.jpg"
    photo = params[:photo4]
    File.binwrite("public/deal_photoes/#{@deal.photo4}",photo.read)
  end
    if @deal.save
      redirect_to("/deals/#{@deal.id}")
    else
      render("/deals/edit")
    end
  end

  def destroy
    @deal = Deal.find_by(id: params[:id])
    @deal.destroy
    redirect_to("/deals/index")
  end
end
