def my_csv_parser(param_1, param_2)
 result=[];
 row=[];
 cell="";
 for i in 0... param_1.length
    char=param_1[i]
    if char==param_2
        row<<cell
        cell=""
       
    elsif char=="\n"
            row<<cell
            result<<row
            row=[]
            cell=""

        
    else
            cell+=char
    end
end
    return result

end