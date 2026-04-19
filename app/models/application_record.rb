class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # 모든 모델에 공통 적용할 설정을 여기에
end