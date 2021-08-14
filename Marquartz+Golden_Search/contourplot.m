function contourplot()
%%%%%%%%%%%%%%%%%   Plotting for 2D   %%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1=linspace(-10,10,100);
x2=linspace(-10,10,100);
[X1,X2] = meshgrid(x1,x2);
%Z=(X1-10).^3 + (X2-20).^3;
Z=((sin(2*pi.*X1).^3) .* (sin(2*pi.*X2)))./((X1.^3).* (X1+X2));
contour(X1,X2,Z)
hold on;
x1=linspace(-10,10,100);
x2=x1.^2 + 1;
plot(x1,x2,'r','LineWidth',2);
x2=linspace(-10,10,100);
x1=1 + (x2-4).^2;
plot(x1,x2,'r','LineWidth',2);

x1=zeros(100,1);
plot(x1,x2,'r','LineWidth',2);
x1=10*ones(100,1);
plot(x1,x2,'r','LineWidth',2);
x1=linspace(-10,10,100);
x2=zeros(100,1);
plot(x1,x2,'r','LineWidth',2);
x2=10*ones(100,1);
plot(x1,x2,'r','LineWidth',2);
grid on;
%centers=[5 5;6 5];
%radii=[10;9.1];
%viscircles(centers,radii)

%x1=13*ones(100,1);
%x2=linspace(-20,25,100);
%plot(x1,x2,'r','LineWidth',2);
%x1=20*ones(100,1);
%plot(x1,x2,'r','LineWidth',2);
%x2=zeros(100,1);
%x1=linspace(-20,25,100);
%plot(x1,x2,'r','LineWidth',2);
%x2=4*ones(100,1);
%plot(x1,x2,'r','LineWidth',2);











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end