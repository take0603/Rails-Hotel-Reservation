module ApplicationHelper
  # ユーザー画像の登録有無を確認し、ない場合はデフォルト画像を表示するメソッド
  def user_image(user)
    if user[:user_image].nil?
      "default_user_image.png"
    else
      user.user_image.url
    end
  end

  # 施設画像の登録有無を確認し、ない場合はデフォルト画像を表示するメソッド
  def room_image(room)
    if room[:room_image].nil?
      "default_room_image.png"
    else
      room.room_image.url
    end
  end

end
