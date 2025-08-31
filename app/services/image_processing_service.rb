class ImageProcessingService < ApplicationService
  MAX_FILE_SIZE = 5.megabytes
  ALLOWED_TYPES = %w[image/jpeg image/png image/gif image/webp].freeze

  def initialize(image_file)
    @image_file = image_file
  end

  def call
    return failure(['No image provided']) unless @image_file

    validate_file_size
    validate_file_type

    return failure(@errors) if @errors.any?

    process_image
  end

  private

  def validate_file_size
    @errors ||= []
    return unless @image_file.size > MAX_FILE_SIZE

    @errors << "Image file size must be less than #{MAX_FILE_SIZE / 1.megabyte}MB"
  end

  def validate_file_type
    @errors ||= []
    return if @image_file.content_type.in?(ALLOWED_TYPES)

    @errors << 'Image must be JPEG, PNG, GIF, or WebP format'
  end

  def process_image
    # Here you could add image processing logic like resizing, optimization, etc.
    success(@image_file)
  rescue StandardError => e
    failure(["Image processing failed: #{e.message}"])
  end
end