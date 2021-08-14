function [X,NFE]=Marquardts(fun,R,x,NFE)
%out2=fopen("output4.dat","w");
out1=fopen("output4.txt","w");
M=200;

X=x;

lambda=1000;
tol=1e-3;      %Tolerance for norm of gradient
K=0;
I=eye(length(X));
h=1e-4;
while(K<M)
%K=K+1;
[G,NFE]=grad(fun,R,X,h,NFE);
N=norm(G);
%fprintf(out1,"%d\t%0.4f\t%0.4f\n",K,N,fun(X));  %printing on output file
%fprintf(out2,"%d\t%0.4f\t%0.4f\n",K,N,fun(X));
 if (N>tol)
      tempX=X;
      [H,NFE]=hes(fun,R,X,h,NFE);
      if(abs(det(H))<0.1)
          fprintf(out1,"Hessian is singular at\n%lf\t%lf\n",X(1),X(2));
      end
      s=-inv(H+lambda*I)*G;
      %if(K~=0)
         % unitVecS_old=(1/norm(tempS))*tempS;
          %unitVecS_new=(1/norm(s))*s;
          %theta=acosd(unitVecS_old'*unitVecS_new)      %Restart
              %if (theta<10)
                     %[X,F]=Restart(X);
                     %return;
              %end
      %end
      %tempS=s;
      [alpha,NFE]=interval_halving(fun,R,X,s,NFE);
      X=X+alpha*s; 
      %plot([tempX(1);X(1)],[tempX(2);X(2)],'k-o','MarkerSize',10 ,'LineWidth',2);
     
      [fold,NFE]=fun(tempX,R,NFE);
      [fnew,NFE]=fun(X,R,NFE);
 
           while fnew>fold
                 lambda=2*lambda ;
                 s=-inv(H+lambda*I)*G;
                 [alpha,NFE]=interval_halving(fun,R,tempX,s,NFE);            
                 X=tempX+alpha*s;
                 %plot([tempX(1);X(1)],[tempX(2);X(2)],'k-o','MarkerSize',10 ,'LineWidth',2);
                 [fold,NFE]=fun(tempX,R,NFE);
                 [fnew,NFE]=fun(X,R,NFE);          
           end
   
       lambda=0.5*lambda;
       K=K+1;
      else
       break;    % if N< tol Terminate
  end

end

%f=fun(X,R);
fclose(out1);
%fclose(out2);
end










