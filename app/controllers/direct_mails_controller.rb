class DirectMailsController < ApplicationController
  layout 'admin_common'
  before_action :set_direct_mail, only: [:show, :edit, :update, :destroy, :send_all_users]
  
  # GET /direct_mails
  # GET /direct_mails.json
  def index
    @direct_mails = DirectMail.all
  end
  
  # GET /direct_mails/1
  # GET /direct_mails/1.json
  def show
  end
  
  # GET /direct_mails/new
  def new
    @direct_mail = DirectMail.new
  end
  
  # GET /direct_mails/1/edit
  def edit
  end
  
  # POST /direct_mails
  # POST /direct_mails.json
  def create
    @direct_mail = DirectMail.new(direct_mail_params)
    
    respond_to do |format|
      if @direct_mail.save
        format.html { redirect_to @direct_mail, notice: 'Direct mail was successfully created.' }
        format.json { render :show, status: :created, location: @direct_mail }
      else
        format.html { render :new }
        format.json { render json: @direct_mail.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /direct_mails/1
  # PATCH/PUT /direct_mails/1.json
  def update
    respond_to do |format|
      if @direct_mail.update(direct_mail_params)
        format.html { redirect_to @direct_mail, notice: 'Direct mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @direct_mail }
      else
        format.html { render :edit }
        format.json { render json: @direct_mail.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /direct_mails/1
  # DELETE /direct_mails/1.json
  def destroy
    @direct_mail.destroy
    respond_to do |format|
      format.html { redirect_to direct_mails_url, notice: 'Direct mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def send_all_users
    users = User.all
    @addresses = []
    users.each do |user|
      @addresses << user.email
    end
      ApplicationMailer.send_dm(@addresses, @direct_mail).deliver
    # users.each do |user|
    #   ApplicationMailer.send_dm(user.email, mail).deliver
    # end
    redirect_to(direct_mails_path, notice: "メールを送信しました")
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_direct_mail
    @direct_mail = DirectMail.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def direct_mail_params
    params.require(:direct_mail).permit(:title, :content)
  end
end
