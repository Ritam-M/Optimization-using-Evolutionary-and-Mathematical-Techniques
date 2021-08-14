function[X,F]=Restart(x)
M=200;
%i=2;%No. of variables
X=x;
%X=[-10;5;-5;8;6];
lambda=1000;
tol=1e-6;      %Tolerance for norm of gradient
K=0;
I=eye(length(X));
h=1e-4;
while(K<M)
%K=K+1;
G=grad(X, h);
N=norm(G);
 if (N>tol)
      tempX=X;
      H=hes(X,h);
      s=-inv(H+lambda*I)*G;     
      tempS=s;
      alpha=interval_halving(X,s);   
      X=X+alpha*s;         
      plot([tempX(1);X(1)],[tempX(2);X(2)],'k-o','MarkerSize',10 ,'LineWidth',2)
      fold=fun(tempX);
      fnew=fun(X);
          while fnew>fold
                 lambda=2*lambda ;
                 s=-inv(H+lambda*I)*G;
                 alpha=interval_halving(tempX,s);               
                 X=tempX+alpha*s;
                 %plot([tempX(1);X(1)],[tempX(2);X(2)],'k-o','MarkerSize',10 ,'LineWidth',2)
                 fold=fun(tempX);
                 fnew=fun(X);          
          end   
       lambda=0.5*lambda;
       K=K+1;
      else
       break;    % if N< tol Terminate
   end

end
%grid on;
% hold off; 

F=fun(X)

end










