class PostingPagesController < ApplicationController
  before_action :set_posting_page, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @posting_pages = PostingPage.all
  end

  def show
  end

  def new
    @posting_page = PostingPage.new
  end

  def edit
  end

  def create
    @posting_page = current_user.posting_pages.build(posting_page_params)
    respond_to do |format|
      if @posting_page.save
        format.html { redirect_to @posting_page, notice: 'Posting page was successfully created.' }
        format.json { render :show, status: :created, location: @posting_page }
      else
        format.html { render :new }
        format.json { render json: @posting_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @posting_page.update(posting_page_params)
        format.html { redirect_to @posting_page, notice: 'Posting page was successfully updated.' }
        format.json { render :show, status: :ok, location: @posting_page }
      else
        format.html { render :edit }
        format.json { render json: @posting_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @posting_page.destroy
    respond_to do |format|
      format.html { redirect_to posting_pages_url, notice: 'Posting page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_posting_page
    @posting_page = PostingPage.find(params[:id])
  end

  def ensure_correct_user
    @posting_page = Post.find_by(params[:id])
    if @posting_page.user_id != @current_user.id
      flash[:notice] = "No authority"
      redirect_to posting_pages_url
    end
  end

  def posting_page_params
    params.require(:posting_page).permit(:content, :image, :image_cache)
  end
end
