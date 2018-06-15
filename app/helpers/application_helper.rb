module ApplicationHelper
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end
  def current_user?(user)
    current_user == user
  end
  
  def qiita_markdown(markdown)
    processor = Qiita::Markdown::Processor.new
    processor.call(markdown)[:output].to_s.html_safe
  end
end
