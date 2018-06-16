class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # flashをクリアーする
  def flash_clear
    keys = ["danger", "success"]
    keys.each do |key|
      if flash[key].present?
        flash.delete(key)
      end
    end
  end

  # flashをsetする
  def set_flash(alert_type,text)
    flash[alert_type]="#{text}"
  end
end
