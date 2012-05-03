module ApplicationHelper
  def title
    base_title = "Study LU "
     appender = ""
    if @title.nil?
      base_title
     
    else 
      appender << base_title
      appender << " | "
      appender << @title
    end
  end
end
