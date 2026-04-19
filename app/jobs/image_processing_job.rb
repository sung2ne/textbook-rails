class ImageProcessingJob < ApplicationJob
  include ActiveJob::Continuable

  queue_as :default

  def perform(batch_id)
    @batch = ImageBatch.find(batch_id)

    # 1단계: 원본 이미지 검증
    step :validate do
      @batch.images.each(&:validate_format!)
    end

    # 2단계: 썸네일 생성
    step :generate_thumbnails do
      @batch.images.each(&:generate_thumbnail!)
    end

    # 3단계: CDN 업로드
    step :upload do
      @batch.images.each { |image| CdnUploader.upload(image) }
    end

    @batch.mark_complete!
  end
end