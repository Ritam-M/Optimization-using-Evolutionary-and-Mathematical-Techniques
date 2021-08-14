function [alpha,NFE]=interval_halving(fun,R,X,s,NFE)
        [a,b,NFE]=bounding_phase(fun,R,X,s,NFE);
        
        L=abs(b-a);
        eps=0.001;
        iteration=0;
        xm=(a+b)/2;
        while(L>eps)
            iteration= iteration+1;
            
            x1=a+(L/4);
            x2=b-(L/4);
            
            [fxm,NFE] = fun(X+xm*s,R,NFE) ;    
            [fx1,NFE] = fun(X+x1*s,R,NFE);
            [fx2,NFE] = fun(X+x2*s,R,NFE);
            if(fx1<fxm)
                b=xm;
                xm=x1;
                L=b-a;
            elseif(fx2<fxm)
                a=xm;
                xm=x2;
                L=b-a;
             else
                a=x1;
                b=x2;
                L=b-a;
             end
            
        end
        alpha=xm;
end
           
            
        
   