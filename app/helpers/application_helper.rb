module ApplicationHelper
  def current_user?(user)
    current_user == user
  end

  def qiita_markdown(markdown)
    processor = Qiita::Markdown::Processor.new(hostname: "example")
    processor.filters << HTML::Pipeline::ImageMaxWidthFilter
    processor.call(markdown)[:output].to_s.html_safe
  end
  # flashを表示する
  def show_flash
    html = ""
    flash.each do |message_type, messages|
      if message_type == "notice"
        messages.split("¥n").each { |msg| html += "<div class='toast toast-#{message_type}' style='margin-bottom:0px'><div class='toast-action toast_green'>#{msg}</div></div>" }
      elsif message_type == "alert"
        messages.split("¥n").each { |msg| html += "<div class='toast toast-#{message_type}' style='margin-bottom:0px'><div class='toast-action toast_red'>#{msg}</div></div>" }
      else
        messages.split("¥n").each { |msg| html += "<div class='toast' style='margin-bottom:0px'><div class='toast-action'>#{msg}</div></div>" }
      end
    end
    return html.html_safe
  end

  def date_format(datetime)
      time_ago_in_words(datetime) + '前'
  end
end
