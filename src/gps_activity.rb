require 'ruboto/widget'
require 'ruboto/util/toast'
import "android.content.Intent"
import "android.net.Uri"
ruboto_import_widgets :Button, :LinearLayout, :TextView

# http://xkcd.com/378/

class GpsActivity
  def on_create(bundle)
    super
    set_title 'My First Ruboto Application'

    self.content_view =
        linear_layout :orientation => :vertical do
          @text_view = text_view :text => 'Call to Users', :id => 42, :width => :match_parent,
                                 :gravity => :center, :text_size => 25.0
          button :text => 'Heurion', :width => :match_parent, :id => 43, :on_click_listener => proc { heurion_msg }
          button :text => 'Subbarao', :width => :match_parent, :id => 43, :on_click_listener => proc { subarao_msg }
        end
  rescue
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end

  def on_resume

  end

  private

  def heurion_msg
    @text_view.text = 'Heurion is connecting'
    toast 'Calling...'
    intent = Intent.new(Intent::ACTION_CALL)
    intent.setData(Uri.parse("tel:08041625633"))
    startActivity(intent)
  end

  def subarao_msg
     @text_view.text = 'Subbarao is onnecting'
    toast 'Calling...'
    intent = Intent.new(Intent::ACTION_CALL)
    intent.setData(Uri.parse("tel:8970668850"))
    startActivity(intent)
  end

end
