class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end
  #limit_size 1000x1000
  process resize_to_limit: [1000,1000]
  #保存形式
  process convert: 'jpg'
  
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :create_square
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

 # ファイル名は日本語が入ってくると嫌なので、下記のようにしてみてもいい。
 # 日付(20131001.jpgみたいなファイル名)で保存する
  def filename
    time = Time.now
    if original_filename.present?
      name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
      name.downcase
    end
  end
  def create_square
    manipulate! do |img|
      narrow = img.columns > img.rows ? img.rows : img.columns
      img.crop(Magick::CenterGravity, narrow, narrow).resize(50, 50)
    end
end
end
