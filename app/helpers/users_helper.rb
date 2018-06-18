module UsersHelper
  def user_image_for(user, option={size: 35, class: ""})
    size = option[:size]
    cls = option[:class]
    if user.image.file.nil?
      image_tag("NoImage.jpg", alt: "default", size: "#{size}x#{size}", class: "icon_image #{cls}")
    else
      image_tag(user.image, alt: user.email, size: "#{size}x#{size}", class: "icon_image #{cls}")
    end
  end
end
