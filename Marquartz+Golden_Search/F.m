function y = F(x)
%y = (x(1)^2+x(2)-11)^2 + (x(1)+x(2)^2-7)^2;
%y = (x(1)-10)^3 + (x(2)-20)^3 ;   %%%%%%%%% Q1 %%%%%
y = -((sin(2*pi*x(1))^3 * sin(2*pi*x(2)))/(x(1)^3 * (x(1)+x(2)))); %%%% Q2 %%%
%y = x(1) + x(2) + x(3);   %%%%%%%%%5 Q3 %%%%%%
end
