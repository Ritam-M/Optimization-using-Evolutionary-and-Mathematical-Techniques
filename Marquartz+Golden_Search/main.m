clear
clc

fp=fopen("output3.txt","a");
fp2=fopen("convergence.txt","w");
fp3=fopen("nfe.txt","w");
contourplot;
hold on;
%x= (-15)+30*rand(2,1)   %Q1
%x= (-10)+20*rand(2,1)   %Q2               % random starting point
%x= (-500)+2000*rand(8,1)
%x=[600;1300;5110;200;300;200;300;400];
x=[7.960;-3.422];
tempx=x;
fprintf(fp,"\n(%0.3f,%0.3f)\t",x(1),x(2));
R=0.1;                                         % Parameter Setting
c=10;
NFE=0;
itr=0;
fprintf(fp2,"%d\t%f\n",itr,F(x));
fprintf(fp3,"%d\t%d\n",itr,NFE);
%plot(itr,F(x),'-o','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','blue');

[x,NFE] = Marquardts(@P,R,x,NFE);
itr=itr+1;

fprintf(fp2,"%d\t%f\n",itr,F(x));
fprintf(fp3,"%d\t%d\n",itr,NFE);
plot([tempx(1);x(1)],[tempx(2);x(2)],'k-o','MarkerSize',10 ,'LineWidth',2);
hold on;
%plot(itr,F(x),'-o','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','blue');

[oldP,NFE]=P(x,R,NFE);
R=R*c;
tempx=x;
[x,NFE]=Marquardts(@P,R,x,NFE);
itr=itr+1;

plot([tempx(1);x(1)],[tempx(2);x(2)],'k-o','MarkerSize',10 ,'LineWidth',2);
%plot(itr,F(x),'-o','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','blue');
fprintf(fp2,"%d\t%f\n",itr,F(x));
fprintf(fp3,"%d\t%d\n",itr,NFE);
[newP,NFE]=P(x,R,NFE);

while (abs(newP-oldP)>1e-05)
    oldP=newP;
    R=R*c;
    tempx=x;
    [x,NFE]=Marquardts(@P,R,x,NFE);
    
    plot([tempx(1);x(1)],[tempx(2);x(2)],'k-o','MarkerSize',10 ,'LineWidth',2);
    itr=itr+1;
    %plot(itr,F(x),'-o','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','blue');
    fprintf(fp2,"%d\t%f\n",itr,F(x));
    fprintf(fp3,"%d\t%d\n",itr,NFE);
    [newP,NFE]=P(x,R,NFE);
   
  
end

x
f=F(x)
fprintf(fp,"(%0.5f,%0.5f)\t%0.10f",x(1),x(2),f);
itr
NFE
hold off;
fclose(fp);
fclose(fp2);
fclose(fp3);
