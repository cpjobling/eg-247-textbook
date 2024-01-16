function [fc,GdB] = personalize(student_number)
%PERSONALIZE return personsalized parameters for an online assessment.
dB = -12:12;
fc = 31.25*2^(mod(student_number,10));% Hz
GdB = dB(mod(student_number,length(dB))+1);% dB
end

