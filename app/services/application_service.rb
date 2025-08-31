class ApplicationService
  def self.call(*args, **kwargs)
    new(*args, **kwargs).call
  end

  protected

  def success(data = nil)
    ServiceResult.new(success: true, data: data)
  end

  def failure(errors)
    ServiceResult.new(success: false, errors: errors)
  end
end
