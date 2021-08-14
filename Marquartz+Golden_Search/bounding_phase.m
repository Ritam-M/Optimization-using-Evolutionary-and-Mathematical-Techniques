function [a,b,NFE]=bounding_phase(fun,R,X,s,NFE)
        x0 = -5 + 10.*rand;  %random no. between -5 to 5 Initial guess value for alpha
        delta =rand;         %random no. between 0 to 1
        isDeltaWrong = 1;   % 1 means TRUE
                            % 0 means FALSE
        
        while(isDeltaWrong)
            if (fun(X+(x0-delta)*s,R,NFE)>=fun(X+x0*s,R,NFE)&&fun(X+x0*s,R,NFE)>=fun(X+(x0+delta)*s,R,NFE))
                delta=abs(delta);
                isDeltaWrong= 0;
            elseif (fun(X+(x0-delta)*s,R,NFE)<=fun(X+x0*s,R,NFE)&&fun(X+x0*s,R,NFE)<=fun(X+(x0+delta)*s,R,NFE))
                delta=-abs(delta);
                isDeltaWrong=0;
            else
                x0 = -5 + 10.*rand;
                delta =rand;
            end
            
        end
        NFE=NFE+3;
        
        k=0;
        xi=x0;
        xii=xi+(2^k)*delta;
        
        while(fun(X+xii*s,R,NFE)<fun(X+xi*s,R,NFE))  
            NFE=NFE+2;
            k=k+1;
            x0=xi;
            xi=xii;
            xii=xi+(2^k)*delta;
        end
        if(x0>xii)
            a=xii;
            b=x0;
        else
            a=x0;
            b=xii;
        end
end
            