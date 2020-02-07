class PayrollDiscountPdf < Prawn::Document
  def initialize(payroll_discount)
    super()
    @payroll_discount = payroll_discount
    # header
    image
    image_width
    text_content
    
  end
  def image
  end
  def image_width
  end
  def text_content
    image_logo = "#{Rails.root}/app/assets/images/" + (@payroll_discount.user.business_id).to_s + ".jpg"
    image_paw_print = "#{Rails.root}/app/assets/images/huella.jpg"

    table [[{:image => image_logo, :image_width  => 80, :position => :center, :vposition => :center},
      {:content => "AUTORIZACION DE DESCUENTO POR NOMINA", :align => :center, :width =>  300, :padding =>[20, 10, 0, 10], :font_style => :bold, :size => 10},
    {
      :content => "CODIGO: A1-P1-F11 \n VERSION: 3 \n F.V: 22/01/2020", :width =>  150, :padding =>[10,10,10,10], :font_style => :bold, :size => 10
    }],
    [{
      :content => "FECHA: ", :borders =>[:left], :padding =>[20, 0, 10, 20], :font_style => :bold, :size => 10
    },
    {
      :content => (@payroll_discount.updated_at).to_s, :colspan => 2, :borders =>[:right], :padding =>[20, 20, 10, 0], :size => 10
    }],
    [{
      :content => "Yo, " + @payroll_discount.user.name + " identificado(a) con la cedula de ciudadania N " + @payroll_discount.user.documentation + " autorizo a la compañía para que se me sea descontado por nomina o de mi liquidacion en caso de retiro, la suma de COP $ " + @payroll_discount.value_discount + " pesos.", :colspan => 3, :borders =>[:right, :left], :padding =>[10, 20, 20, 20], :size => 10
    }],
    [{
      :content => "Solicitud sean descontados en los meses de: " + @payroll_discount.month_discount, :colspan => 3, :padding =>[20, 20, 20, 20], :size => 10
    }],
    [{
      :content => "Por concepto de " + @payroll_discount.concept, :colspan => 3, :padding =>[20, 20, 20, 20], :size => 10
    }],
    [{
      :content => "_____________________________ \n \n  FIRMA Y C.C. " + @payroll_discount.user.documentation + " \n \n PROYECTO: " + @payroll_discount.user.analytical_account, :colspan => 2, :rowspan => 2, :valign => :center, :padding =>[0, 20, 0, 20], :size => 10
    },
    {
      :image => image_paw_print, :image_width  => 70, :position => :center, :borders =>[:right, :top], :vposition => :center
    }],
    [{
      :content => "indice derecho", :borders =>[:right, :bottom], :align => :center, :valign => :center, :height => 30, :font_style => :bold, :size => 10
    }]
  ]
  end
end