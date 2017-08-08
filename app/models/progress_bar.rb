class ProgressBar < ActiveRecord::Base
  def self.get_all(params)
    all.order(created_at: 'desc').page(params[:page]).per(10)
  end
end
