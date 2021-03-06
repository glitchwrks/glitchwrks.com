require_relative 'glitchworks_block'

class GlitchWorks::DangerBlock < GlitchWorks::Block

  def bind_params (params)
    @add_break = params[:add_break]
  end

  def internal_render
    <<~DANGER
    #{"<div>&nbsp;</div>" if @add_break}
    <div class='error_explanation'>
      <div class='error_explanation_content'>
        #{markdown_converter.convert(@text)}
      </div>
    </div>
    DANGER
  end
end

Liquid::Template.register_tag('danger', GlitchWorks::DangerBlock)
