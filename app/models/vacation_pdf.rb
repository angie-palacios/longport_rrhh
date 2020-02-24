class VacationPdf < Prawn::Document
  def initialize(vacation)
    super()
    @vacation = vacation
    text_content
  end

  def text_content
    image_logo = "#{Rails.root}/app/assets/images/" + @vacation.user.business_id.to_s + ".jpg"
    image_firm = "#{Rails.root}/app/assets/images/firm_vacation.png"
    month = I18n.l(@vacation.created_at, :format =>:longyy)
    date_create = [
      [
        {
          content: "", align: :center, font_style: :bold, borders: [:top, :bottom], :rowspan => 2, :width => 370
        },
        {
          content: "D\xC3\xADa", align: :center, font_style: :bold, borders: [:top], :width => 30
        },
        {
          content: 'Mes', align: :center, font_style: :bold, borders: [:top], :width => 90
        },
        {
          content: "A\xC3\xB1o", align: :center, font_style: :bold, borders: [:top], :width => 50
        }
      ],
      [
        {
          content: @vacation.created_at.strftime('%d'), align: :center, borders: [:bottom]
        },
        {
          content: month, align: :center, borders: [:bottom]
        },
        {
          content: @vacation.created_at.strftime('%Y'), align: :center, borders: [:bottom]
        }
      ]
    ]
    
    table [
      [
        {
          image: image_logo, image_width: 100, position: :center, vposition: :center, rowspan: 3, width: 160
        },
        {
          content: 'Proceso', align: :center, font_style: :bold, size: 10
        },
        {
          content: "GESTI\xC3\x93N HUMANA", align: :center, font_style: :bold, size: 10
        }
      ],
      [
        {
          content: "Fecha de emisión: \n 21-Octubre-2016", align: :center, font_style: :bold, size: 10
        },
        {
          content: 'Solicitud de vacaciones', align: :center, font_style: :bold, size: 10
        }
      ],
      [
        {
          content: "Código: GH - A3-P2-F12 \n Versión:09", align: :center, font_style: :bold, size: 10
        },
        {
          content: "Fecha de versión:\n 07-Marzo-2019", align: :center, font_style: :bold, size: 10
        }
      ],
      [
        {
          content: "\n \n \n", colspan: 3, size: 10, borders: %i[top bottom]
        }
      ],
      [
        {
          content: date_create, colspan: 3
        }
      ],
      [
        {
          content: 'NOMBRES Y APELLIDOS', colspan: 3, align: :center, font_style: :bold, size: 10, borders: %i[left right]
        }
      ],
      [
        {
          content: @vacation.user.name, colspan: 3, align: :center, size: 10, borders: %i[left right bottom]
        }
      ],
      [
        {
          content: "No. IDENTIFICACI\xC3\x93N", align: :center, font_style: :bold, size: 10, borders: %i[left right]
        },
        {
          content: "\xC3\x81REA - PROYECTO", align: :center, font_style: :bold, size: 10, borders: %i[left right]
        },
        {
          content: 'CARGO ACTUAL', align: :center, font_style: :bold, size: 10, borders: %i[left right]
        }
      ],
      [
        {
          content: @vacation.user.documentation, align: :center, size: 10, borders: %i[left right]
        },
        {
          content: @vacation.user.analytical_account, align: :center, size: 10, borders: %i[left right]
        },
        {
          content: @vacation.user.position, align: :center, size: 10, borders: %i[left right]
        }
      ],
      [
        {
          content: 'FECHAS DE DISFRUTE DE VACACIONES', colspan: 3, font_style: :bold, size: 10, borders: %i[top left right]
        }
      ],
      [
        {
          content: "PERIODO 1: Del " + l(@vacation.initial_date_first_period, :format =>:long) + "\t hasta el " + l(@vacation.finality_date_first_period, :format =>:long), size: 10, borders: %i[bottom left right], colspan: 3
        }
      ],
      [
        {
          content: "PERIODO 2: Del " + l(@vacation.initial_date_second_period, :format =>:long) + "\t hasta el " + l(@vacation.finality_date_second_period, :format =>:long), size: 10, borders: %i[bottom left right], colspan: 3
        }
      ],
      [
        {
          content: 'PERIODO SOLICITADO PARA PAGO', colspan: 3, font_style: :bold, size: 10
        }
      ],
      [
        {
          content: 'Me sean cancelados en en dinero ' + @vacation.days_paid + " d\xC3\xADas, correspondientes a mis vacaciones del / los periodos(s) entre el " + l(@vacation.initial_date_first_pay, :format =>:long) + " y del " + l(@vacation.finality_date_first_pay, :format =>:long), colspan: 3
        }
      ],
      [
        {
          image: image_firm, image_width: 520, position: :center, vposition: :center, colspan: 3
        }
      ],
      [
        {
          content: 'OBSERVACIONES', colspan: 3, font_style: :bold, size: 10
        }
      ],
      [
        {
          content: @vacation.observations, colspan: 3
        }
      ]
    ]
  end
end
