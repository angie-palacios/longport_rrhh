class PayrollDiscountPdf < Prawn::Document
  def initialize(payroll_discount)
    super()
    @payroll_discount = payroll_discount
    # header
    image
    image_width
    text_content
  end

  def image; end

  def image_width; end

  def text_content
    image_logo = "#{Rails.root}/app/assets/images/" + @payroll_discount.user.business_id.to_s + '.jpg'
    image_paw_print = "#{Rails.root}/app/assets/images/huella.jpg"
    header = [
      [
        {
          content: I18n.t('gui.formats.payroll_discounts.headers.title').html_safe, align: :center, font_style: :bold, colspan: 2, size: 10
        },
        {
          content: I18n.t('gui.formats.payroll_discounts.headers.code_format_pdf').html_safe, align: :center, font_style: :bold, size: 10
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
          content: I18n.t('gui.formats.payroll_discounts.headers.issue_date_pdf').html_safe, align: :center, font_style: :bold, size: 10
        },
        {
          content: I18n.t('gui.formats.payroll_discounts.headers.version_date_pdf').html_safe, align: :center, font_style: :bold, size: 10
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
          content: I18n.t("gui.formats.payroll_discounts.body.date").html_safe + I18n.l(@payroll_discount.created_at, :format =>:long), colspan: 3, borders: [:right, :left], padding: [20, 20, 10, 0], size: 10, padding: [20, 0, 0, 20]
        }
      ],
      [
        {
          content: I18n.t("gui.formats.payroll_discounts.body.i").html_safe + @payroll_discount.user.name + I18n.t("gui.formats.payroll_discounts.body.text_one").html_safe +  @payroll_discount.user.documentation + I18n.t("gui.formats.payroll_discounts.body.text_two").html_safe +  @payroll_discount.value_discount + I18n.t("gui.formats.payroll_discounts.body.load").html_safe, colspan: 3, borders: %i[right left], padding: [10, 20, 20, 20], size: 10
        }
      ],
      [
        {
          content: I18n.t("gui.formats.payroll_discounts.body.discounted_pdf").html_safe + @payroll_discount.month_discount, colspan: 3, padding: [20, 20, 20, 20], size: 10
        }
      ],
      [
        {
          content: I18n.t("gui.formats.payroll_discounts.body.concept").html_safe + @payroll_discount.concept, colspan: 3, padding: [20, 20, 20, 20], size: 10
        }
      ],
      [
        {
          content: "_____________________________ \n \n " + I18n.t("gui.formats.payroll_discounts.body.firm").html_safe + @payroll_discount.user.documentation + " \n \n " +I18n.t("gui.formats.payroll_discounts.body.project").html_safe + @payroll_discount.user.analytical_account, colspan: 2, rowspan: 2, valign: :center, padding: [0, 20, 0, 20], size: 10
        },
        {
          image: image_paw_print, image_width: 70, position: :center, borders: %i[right top], vposition: :center
        }
      ],
      [
        {
          content: I18n.t("gui.formats.payroll_discounts.body.fingerprint").html_safe, borders: %i[right bottom], align: :center, valign: :center, height: 30, font_style: :bold, size: 10
        }
      ]
    ]
  end
end
