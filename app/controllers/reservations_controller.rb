class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path
    else
      render "rooms/show"
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      @room = Room.find(@reservation.room_id)
      render "rooms/show" if @reservation.id.nil?
      render :edit unless @reservation.id.nil?
    end

    if @reservation.id.nil?
      @reservation_confirm = Reservation.new(reservation_params)
    else
      @reservation_confirm = Reservation.find(reservation_params[:id])
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:checkin_date, :checkout_date, :people_num, :id, :user_id, :room_id)
  end

end
