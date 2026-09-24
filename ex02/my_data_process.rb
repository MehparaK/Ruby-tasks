require 'json'

def my_data_process(param_1)                         

  headers = param_1[0].split(',')                     
  discard = ["FirstName", "LastName", "UserName", "Coffee Quantity"]
  
  keep_indices = []
  headers.each_with_index do |h, i|                   
    if !discard.include?(h)
      keep_indices << i
    end
  end                                                 
  
  result = {}
  keep_indices.each do |i|
    result[headers[i]] = {}
  end


  param_1[1..-1].each do |line|
    values=line.split(',')
    keep_indices.each do |i|
      col=headers[i];
      val=values[i];
      if col=="Email" && val && val.include?("@")
        val=val.split("@")[1]
      end
      next if val.nil?

      if result[col].key?(val)
        result[col][val]+=1
      else
         result[col][val]=1
      end
    end
  end


  result.to_json                                       
end      