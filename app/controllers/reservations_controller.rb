class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to action: :index
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
      redirect_to action: :index
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
    transition_source = Rails.application.routes.recognize_path(request.referrer)
    @reservation_input = params[:reservation]

    if transition_source[:controller] == "rooms"
      @reservation = Reservation.new
    else
      @reservation = Reservation.find(transition_source[:id])
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:checkin_date, :checkout_date, :people_num, :user_id, :room_id)
  end

end
