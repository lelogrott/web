module ApplicationHelper
	def flash_messages
    {
      error:   { icon: 'atsicon-lineicon-25-error',  box_class: 'error-box'   },
      warning: { icon: 'atsicon-lineicon-25-alert',  box_class: 'warning-box' },
      notice:  { icon: 'atsicon-lineicon-25-confirmation', box_class: 'success-box' },
      info:    { icon: 'atsicon-lineicon-25-info',       box_class: 'info-box'    },
      success_box:  { icon: 'atsicon-lineicon-25-confirmation', box_class: 'success-box' },
      warning_box:  { icon: 'atsicon-lineicon-25-alert', box_class: 'warning-box' }
    }
  end
end
