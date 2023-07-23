class RoomsController < ApplicationController
  before_action :set_q, only: [:index]

  def index
    @rooms = @q.result(distinct: true)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_url(@room.id)
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_url(@room.id)
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def own
    @rooms = current_user.rooms
  end

  private
  def set_q
    @q = Room.ransack(params[:q])
  end

  def room_params
    params.require(:room).permit(:name, :price, :address, :explanation, :room_image, :user_id)
  end

end
