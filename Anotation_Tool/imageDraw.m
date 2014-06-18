function [ Im_sel ] = imageDraw( Rgb_Image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
acell = struct2cell(rgb);
sz = size(acell);
tr = sz(2);
acell = reshape(acell,sz(1),[]);
acell = acell';
acell = acell(1:tr);
acell = acell(3:end);
test_im = cell(1,tr-2,1);
or_im = cell(1,tr-2,1);
for i=1:tr-2
   temp_i = strtok(acell(i));
   temp_i = cellstr(cell2mat(temp_i));
   temp_i = temp_i{1}(5:end);
   test_im{i} = temp_i; 
   or_im{i} = rgb(i+2).name;
end
or_im = or_im';
sorted_im = regexp(test_im,'\d*','match');
sorted_im = str2double(cat(1,sorted_im{:}));
sorted_im = num2cell(sorted_im);
sorted_arr = [sorted_im, or_im];
sorted_arr = sortrows(sorted_arr);

end

