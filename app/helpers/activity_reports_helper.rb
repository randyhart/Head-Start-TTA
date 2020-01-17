module ActivityReportsHelper
  def pretend_we_have_proper_next_steps_fields(next_steps)
    if next_steps.blank?
      content_tag :p, "No next steps defined"
    else
      html = Kramdown::Document.new(next_steps).to_html
      html.gsub!(/(Grantee Next Steps?):?/i) { "<h3>#{$1.titleize}</h3>" }
      html.gsub!(/Grantee:/i, "<h3>Grantee</h3>")
      html.gsub!(/(Specialist Next Steps?):?/i) { "<h3>#{$1.titleize}</h3>" }
      html.gsub!(/(Next Steps? Grantee):?/i) { "<h3>#{$1.titleize}</h3>" }
      html.gsub!(/(Next Steps?) (TTA|GS):?/i) { "<h3>#{$1.titleize} #{$2.upcase}</h3>" }
      html.gsub!(/(Grantee will):/i) { "<h3>#{$1.titleize}</h3>" }
      html.gsub!(/(GS|ECS) will:/i) { "<h3>#{$1.upcase} Will</h3>" }
      html.html_safe
    end
  end

  def pretend_we_have_proper_narrative_fields(narrative)
    if narrative.blank?
      content_tag :p, "Notes field missing"
    else
      html = Kramdown::Document.new(narrative).to_html
      html.gsub!(/(?:[IVX]+\. )?(Progress towards? (?:Anticipated )?outcomes?):?/i) { "<h3>#{$1.titleize}</h3>" }
      html.gsub!(/(?:[IVX]+\. )?(Anticipated? Outcome\(?s?\)?):/i) { "<h3>#{$1.titleize}</h3>" }
      html.gsub!(/(?:[IVX]+\. )?Event Objectives?:?/i, "<h3>Event Objective</h3>")
      html.gsub!(/(?:[IVX]+\. )?(T{1,2}A) Provided:?/i) { "<h3>#{$1.upcase} Provided</h3>" }
      html.gsub!(/(?:[IVX]+\. )?Pre (T{1,2}A):?/i) { "<h3>Pre #{$1.upcase}</h3>" }
      html.gsub!(/(?:[IVX]+\. )?Post (T{1,2}A):?/i) { "<h3>Post #{$1.upcase}</h3>" }
      html.html_safe
    end
  end
end
