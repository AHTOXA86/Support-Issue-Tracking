class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.order(:status)
    init_models
  end

  def search
    # Searching ticket by id
    @ticket = Ticket.find_by(unique: params[:id])
    if @ticket.nil?
      @tickets = Ticket.where("lower(text) LIKE ?", "%#{params[:id].downcase}%")
      if @tickets.nil?
        redirect_to new_ticket_path, notice: 'Ticket not found'
      else
        init_models
        @notice = 'Found those tickets:'
        render 'index'
      end
    else
      @answers = Answer.where(ticket_id: @ticket.id)
      render 'show'
    end
  end

  def answer
    @answer = Answer.new(answer_params)
    @answer.save
    @ticket = Ticket.find(@answer.ticket_id)
    UserMailer.answer(@ticket, @answer).deliver
    redirect_to @ticket
  end
  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @status = Status.find(@ticket.status)
    @user = User.find_by(@ticket.ownership)
    @department = Department.find_by(@ticket.department)
    @customer = Customer.find(@ticket.customer_id)
    @answers = Answer.where(ticket_id: @ticket.id)
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @ticket.department = 1
    @department = Department.all
  end

  # GET /tickets/1/edit
  def edit
    @department = Department.all
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @customer = Customer.find_or_create_by(email: params[:email])
    @customer.name = params[:name]
    @customer.save

    @ticket.department = params[:department]
    @ticket.customer_id = @customer.id
    respond_to do |format|
      if @ticket.save
        UserMailer.new_ticket_email(@customer, @ticket).deliver
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    @ticket.department = params[:department]
    respond_to do |format|
      if @ticket.update(ticket_params)
        UserMailer.change_ticket(@ticket).deliver
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:subject, :text, :department, :status, :ownership, :customer_id, :unique)
    end

    def answer_params
      params.require(:answer).permit(:text, :ticket_id)
    end

    def init_models
      @statuses = Status.all
      @users = User.all
      @departments = Department.all
      @customers = Customer.all
    end
end
