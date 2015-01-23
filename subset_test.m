function[final_matrix] = subset_test(data,time,interval)
%run variable=subset_test(arguments)
%arguments:
%data = S(1).dataC1Raw for example
%time = array of indices
%interval= the threshold before and after your 0th point

[m,n] = size(time)

final_matrix=[];
for i = 1:length(time)
   output=[];
   %disp(output)
   
   if n == 2
        real_time_1 = round(time(i,1)* 381.6793893,0);
        real_time_2 = round(time(i,2)* 381.6793893,0);
      
      for k = real_time_1:real_time_2
          output = [output;data(real_time_1+k)] 
      end
   end

   if n == 1
    real_time = time(i)* 381.6793893;
 
    real_time =round(real_time,0);

    idx=real_time;
    
 for j =-interval:interval
  if idx+j < 0
       %disp(idx+j)
       output=[output;nan];
  elseif idx+j > length(data)
      % disp(idx+j)
       output=[output;nan];
  elseif idx+j > 0 && idx+j<length(data)
     %  disp(idx+j)
       output=[output;data(idx+j)];
   
  elseif idx+j ==0
       output=[output;nan];
  end

end

end
 final_matrix=[output final_matrix];

end
%final_matrix;
end