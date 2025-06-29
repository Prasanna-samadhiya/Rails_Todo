class Todo < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  before_validation :strip_title
  before_save :set_default_description
  before_save :capitalize_title
  after_create :log_todo_created
  after_update :log_todo_updated
  before_destroy :ensure_done_before_destroy
  after_destroy :log_todo_deleted

  private

  def strip_title
    self.title = title.strip if title.present?
  end

  def set_default_description
    self.description = "No description given." if description.blank?
  end

  def capitalize_title
    self.title = title.capitalize if title.present?
  end

  def log_todo_created
    Rails.logger.info "Created Todo ##{id}: #{title}"
  end

  def log_todo_updated
    Rails.logger.info "Updated Todo ##{id}: #{title}"
  end

  def ensure_done_before_destroy
    if !done
      Rails.logger.warn "Tried to delete an incomplete Todo!"
      throw(:abort)
    end
  end

  def log_todo_deleted
    Rails.logger.info "Deleted Todo ##{id}: #{title}"
  end
end
