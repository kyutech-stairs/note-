module ApplicationHelper
  def current_user?(user)
    current_user == user
  end
  
  def qiita_markdown(markdown)
    processor = Qiita::Markdown::Processor.new
    processor.call(markdown)[:output].to_s.html_safe
  end
end
