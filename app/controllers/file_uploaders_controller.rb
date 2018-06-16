class FileUploadersController < ApplicationController
  def create
    uploaded_file = file_param[:file]
    output_path = Rails.root.join('public/article_files', uploaded_file.original_filename)
	
	  File.open(output_path, 'w+b') do |fp|
	    fp.write  uploaded_file.read
    end
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js 
    end
  end
  private 
  def file_param
    params.require(:file_uploaders).permit(:file)
  end
  def rename(file)
    id = current_user.id
    file.original_filename = id + file.original_filename
    return file
  end
end
