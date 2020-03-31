module RecordHelper
  def is_number?(object)
    true if Float(object) rescue false
  end

  def empty_contents(value)
    new_value = nil

    if value.is_a?(String)
      new_value = ""
    elsif value.is_a?(Array)
      cleared_list = value.map{ |x| empty_contents(x) }
      cleared_list = cleared_list.select { |item| item != "" }
      cleared_list = "" if cleared_list.empty?
      new_value = cleared_list
    elsif value.is_a?(Hash)
      new_value = {}
      value.each do |key, sub_value|
        new_value[key] = empty_contents(sub_value)
      end
    end

    new_value
  end

  def script_test(value)
    if value.nil? || value == ""
      return false
    end

    !(value.start_with?("OK", "ok", "Ok"))
  end

  def completed_reviews(reviews)
    reviews.reduce(0) { |sum, review| sum + review.review_state.to_i }
  end

  def reviewer_ok?(record)
    can?(:review_state, record.state.to_sym)
  end

  def complete_button_text(record)
    if record.ready_for_daac_review?
      "RELEASE TO DAAC"
    elsif record.in_daac_review?
      "CMR UPDATED"
    else
      "MARK AS DONE"
    end
  end

  def disable_complete_button?(reviews, record)
    completed_reviews(reviews) <= 1 || record.closed? || !reviewer_ok?(record)
  end

  def script_class(field)
    field[:script] && current_user.arc? ? "script" : "no_script"
  end

  def script_text_class(field)
    field[:script] && current_user.arc? ? "script_text" : "no_script_text"
  end

  def record_in_progress?(record)
    [Record::STATE_OPEN.to_s,
     Record::STATE_IN_ARC_REVIEW.to_s,
     Record::STATE_READY_FOR_DAAC_REVIEW.to_s].include?(record.state)
  end

  def should_show_copy_recommendations_button?(record)
    can?(:copy_recommendations, record) && !record.prior_revision_record.nil? && record_in_progress?(record)
  end

  def copy_recommendations_active_class(record)
    record.copy_recommendations_note.nil? ? 'eui-btn--green' : 'eui-btn--disabled'
  end

  # When a record has multiples, Dashboard stores them in the value field
  # formatted like: "• <value1>\n• <value2>\n ..."
  # Returns an array like: [value1, value2, ...]
  def clean_up_campaign(campaign)
    return [] if campaign.nil?

    campaign.tr('•', '').split("\n").each(&:strip!)
  end
end
