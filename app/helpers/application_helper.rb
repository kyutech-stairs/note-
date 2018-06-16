module ApplicationHelper
  # flashを表示する
  def show_flash
    html = ""
    flash.each do |message_type, messages|
      if message_type == "notice"
        messages.split("¥n").each { |msg| html += "<div class='alert alert-success' style='margin-bottom:0px'>#{msg}</div>" }
      elsif message_type == "alert"
        messages.split("¥n").each { |msg| html += "<div class='alert alert-danger' style='margin-bottom:0px'>#{msg}</div>" }
      else
        messages.split("¥n").each { |msg| html += "<div class='alert alert-#{message_type}' style='margin-bottom:0px'>#{msg}</div>" }
      end
    end
    return html.html_safe
  end

end
