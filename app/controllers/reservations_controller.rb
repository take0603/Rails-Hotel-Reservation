class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:confirm]

  def index
    @reservations = current_user.reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "施設の予約が完了しました。"
      redirect_to reservations_path
    else
      @room = Room.find(@reservation.room_id)
      render "rooms/show"
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice] = "施設の予約情報を更新しました。"
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "施設の予約情報を削除しました。"
    redirect_to reservations_path
  end

  def confirm
    @reservation = Reservation.new(reservation_params)

    if @reservation.invalid?
      @room = Room.find(@reservation.room_id)
      render "rooms/show" if @reservation.id.nil?
      render :edit unless @reservation.id.nil?
    else
      @stay_days = (@reservation.checkout_date - @reservation.checkin_date).to_i
      @payment = @reservation.room.price * @reservation.people_num * @stay_days
    end

    if @reservation.id.nil?
      @reservation_confirm = Reservation.new(reservation_params)
    else
      @reservation_confirm = Reservation.find(reservation_params[:id])
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:checkin_date, :checkout_date, :people_num, :payment, :id, :user_id, :room_id)
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
