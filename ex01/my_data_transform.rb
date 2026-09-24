require 'date'
require 'time'

def my_age_grouper(age_string)

    age=age_string.to_i
if age>=1 && age<=20
    "1-20"

elsif age>=21 && age<=40
    "21->40"
elsif age>=41 && age<=65
    "41->65"
elsif age>=66 && age<=99
    "66->99"
else
    age_string
end  
end

def my_email_grouper(email)
    email.split('@').last
  end



def my_date_grouper(date_string)

date=DateTime.parse(date_string)
hour=date.hour

if hour>=6 && hour<12
    "morning"

elsif hour>=12 && hour<18  
"afternoon"

elsif hour>18 && hour<=22 
    "evening"
else date_string
end
end    

 
def my_data_transform(param_1)
    lines = param_1.split("\n")
    # return [] if lines.empty?
    if lines.empty?
        return []
    end

    result = [lines[0]]
  
    lines[1..-1].each do |line|
      row = line.split(',')
  
      row[5] = my_age_grouper(row[5])       
      row[4] = my_email_grouper(row[4])     
      row[9] = my_date_grouper(row[9])    
      result << row.join(',')
    end
  
    result
  end 
