class VacationPdf < Prawn::Document
  def initialize(vacation)
    super()
    @vacation = vacation
    text_content
  end

  def text_content
    image_logo = "#{Rails.root}/app/assets/images/" + @vacation.user.business_id.to_s + '.jpg'
    header = [
      [
        {
          content: I18n.t('gui.formats.vacations.headers.vacation').html_safe, align: :center, font_style: :bold, colspan: 2, size: 10
        },
        {
          content: I18n.t('gui.formats.vacations.headers.code_format_pdf').html_safe, align: :center, font_style: :bold, size: 10
        },
        {
          image: image_logo, image_width: 100, position: :center, vposition: :center, rowspan: 2, width: 160
        }
      ],
      [
        {
          content: I18n.t('gui.formats.process').html_safe, align: :center, font_style: :bold, size: 10
        },
        {
          content: I18n.t('gui.formats.vacations.headers.issue_date_pdf').html_safe, align: :center, font_style: :bold, size: 10
        },
        {
          content: I18n.t('gui.formats.vacations.headers.version_date_pdf').html_safe, align: :center, font_style: :bold, size: 10
        }
      ]
    ]
    month = I18n.l(@vacation.created_at, format: :longyy)
    date_create = [
      [
        {
          content: '', align: :center, font_style: :bold, borders: %i[top bottom], rowspan: 2, width: 370, size: 10
        },
        {
          content: I18n.t('gui.formats.vacations.body.day'), align: :center, font_style: :bold, borders: [:top], width: 40, size: 10, height: 19
        },
        {
          content: I18n.t('gui.formats.vacations.body.month'), align: :center, font_style: :bold, borders: [:top], width: 90, size: 10, height: 19
        },
        {
          content: I18n.t('gui.formats.vacations.body.year'), align: :center, font_style: :bold, borders: [:top], width: 40, size: 10, height: 19
        }
      ],
      [
        {
          content: @vacation.created_at.strftime('%d'), align: :center, valign: :top, borders: [:bottom], size: 10, height: 19
        },
        {
          content: month, align: :center, borders: [:bottom], size: 10, height: 19
        },
        {
          content: @vacation.created_at.strftime('%Y'), align: :center, borders: [:bottom], size: 10, height: 19
        }
      ]
    ]

    text_period_one = I18n.t('gui.formats.vacations.body.text_period_one').html_safe

    of_the = I18n.t('gui.formats.vacations.body.of_the').html_safe

    initial_date_first_period = @vacation.initial_date_first_period.nil? ? I18n.t('gui.formats.vacations.body.text_null') : I18n.l(@vacation.initial_date_first_period, format: :long).html_safe

    until_the = I18n.t('gui.formats.vacations.body.until_the').html_safe

    finality_date_first_period = @vacation.finality_date_first_period.nil? ? I18n.t('gui.formats.vacations.body.text_null') : I18n.l(@vacation.finality_date_first_period, format: :long).html_safe

    text_period_two = I18n.t('gui.formats.vacations.body.text_period_two').html_safe

    initial_date_second_period = @vacation.initial_date_second_period.nil? ? I18n.t('gui.formats.vacations.body.text_null') : I18n.l(@vacation.initial_date_second_period, format: :long).html_safe

    finality_date_second_period = @vacation.finality_date_second_period.nil? ? I18n.t('gui.formats.vacations.body.text_null') : I18n.l(@vacation.finality_date_second_period, format: :long).html_safe

    text_period_requested_one = I18n.t('gui.formats.vacations.body.text_period_requested_one').html_safe

    days_paid = @vacation.days_paid.to_s

    text_period_requested_two = I18n.t('gui.formats.vacations.body.text_period_requested_two').html_safe

    initial_date_first_pay = @vacation.initial_date_first_pay.nil? ? I18n.t('gui.formats.vacations.body.text_null').html_safe : I18n.l(@vacation.initial_date_first_pay, format: :long).html_safe

    text_period_requested_tree = I18n.t('gui.formats.vacations.body.text_period_requested_tree').html_safe

    finality_date_first_pay = @vacation.finality_date_first_pay.nil? ? I18n.t('gui.formats.vacations.body.text_null').html_safe : I18n.l(@vacation.finality_date_first_pay, format: :long).html_safe

    firms = [
      [
        {
          content: "\n \n \n ____________________________________ \n " + I18n.t('gui.formats.vacations.body.employee') + "\n \n" + I18n.t('gui.formats.vacations.body.name_firms') + "______________________________  \n \n C.C No.: ____________________________", align: :center, borders: [:top], font_style: :bold, size: 10
        },
        {
          content: "\n \n \n ____________________________________ \n " + I18n.t('gui.formats.vacations.body.coordinator_project') + "\n \n" + I18n.t('gui.formats.vacations.body.name_firms') + "______________________________ \n ", align: :center, borders: [:top], font_style: :bold, size: 10
        }
      ],
      [
        {
          content: "\n \n ____________________________________ \n \n " + I18n.t('gui.formats.vacations.body.manager') + "\n \n" + I18n.t('gui.formats.vacations.body.name_firms') + '____________________________ ', align: :center, borders: [:bottom], font_style: :bold, size: 10
        },
        {
          content: "\n \n ____________________________________ \n \n " + I18n.t('gui.formats.vacations.body.coordinator_contracting') + "\n \n" + I18n.t('gui.formats.vacations.body.name_firms') + "______________________________ \n ", align: :center, borders: [:bottom], font_style: :bold, size: 10
        }
      ]
    ]
    table [
      [
        {
          content: header, colspan: 3
        }
      ]
    ]
    table [
      [
        {
          content: "\n", colspan: 3, borders: %i[top bottom]
        }
      ],
      [
        {
          content: date_create, colspan: 3
        }
      ],
      [
        {
          content: I18n.t('gui.formats.vacations.body.name').html_safe, colspan: 3, align: :center, font_style: :bold, borders: %i[left right], size: 10
        }
      ],
      [
        {
          content: @vacation.user.name, colspan: 3, align: :center, borders: %i[left right bottom], size: 10
        }
      ],
      [
        {
          content: I18n.t('gui.formats.vacations.body.identification').html_safe, align: :center, font_style: :bold, borders: %i[left right], size: 10
        },
        {
          content: I18n.t('gui.formats.vacations.body.area_project').html_safe, align: :center, font_style: :bold, borders: %i[left right], size: 10
        },
        {
          content: I18n.t('gui.formats.vacations.body.charge').html_safe, align: :center, font_style: :bold, borders: %i[left right], size: 10
        }
      ],
      [
        {
          content: @vacation.user.documentation, align: :center, borders: %i[left right], size: 10
        },
        {
          content: @vacation.user.analytical_account, align: :center, borders: %i[left right], size: 10
        },
        {
          content: @vacation.user.position, align: :center, borders: %i[left right], size: 10
        }
      ],
      [
        {
          content: I18n.t('gui.formats.vacations.body.holiday_dates').html_safe, colspan: 3, font_style: :bold, borders: %i[top left right], size: 10
        }
      ],
      [
        {
          content: I18n.t('gui.formats.vacations.body.text_holiday_dates').html_safe, colspan: 3, size: 10
        }
      ],
      [
        {
          content: text_period_one + of_the + initial_date_first_period + until_the + finality_date_first_period, inline_format: true, size: 10, borders: %i[left right], colspan: 3
        }
      ],
      [
        {
          content: text_period_two + of_the + initial_date_second_period + until_the + finality_date_second_period, inline_format: true, size: 10, borders: %i[bottom left right], colspan: 3
        }
      ],
      [
        {
          content: I18n.t('gui.formats.vacations.body.title_period_requested').html_safe, colspan: 3, font_style: :bold, size: 10
        }
      ],
      [
        {
          content: text_period_requested_one + days_paid + text_period_requested_two + initial_date_first_pay + text_period_requested_tree + finality_date_first_pay, inline_format: true, colspan: 3, size: 10
        }
      ],
      [
        {
          content: firms, colspan: 3
        }
      ],
      [
        {
          content: I18n.t('gui.formats.vacations.body.observations'), colspan: 3, font_style: :bold, size: 10
        }
      ],
      [
        {
          content: @vacation.observations, colspan: 3, size: 10, height: 60
        }
      ]
    ]
  end
end
