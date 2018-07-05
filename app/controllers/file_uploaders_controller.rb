class FileUploadersController < ApplicationController
  require 'digest/sha1'
  def create
    @uploaded_file = file_param[:file]
    rename(@uploaded_file)
    output_path = Rails.root.join('public/article_files', @uploaded_file.original_filename)
	
	  File.open(output_path, 'w+b') do |fp|
	    fp.write  @uploaded_file.read
    end
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end
  private 
  def file_param
    params.require(:file_uploaders).permit(:file)
  end
  def rename(file)
    file.original_filename = current_user.id.to_s + Digest::SHA1.hexdigest(file.original_filename) + ".jpeg"
  end
end
