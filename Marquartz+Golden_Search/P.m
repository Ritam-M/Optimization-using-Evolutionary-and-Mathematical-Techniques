function [p,NFE] = P(x,R,NFE)
p= F(x) + R*((bracket(G1(x)))^2 + (bracket(G2(x)))^2 + (bracket(G3(x)))^2 + (bracket(G4(x)))^2 + (bracket(G5(x)))^2 + (bracket(G6(x)))^2);% + (bracket(G7(x)))^2 + (bracket(G8(x)))^2 + (bracket(G9(x)))^2 + (bracket(G10(x)))^2 + (bracket(G11(x)))^2 + (bracket(G12(x)))^2 + (bracket(G13(x)))^2 + (bracket(G14(x)))^2 + (bracket(G15(x)))^2 + (bracket(G16(x)))^2 + (bracket(G17(x)))^2 + (bracket(G18(x)))^2 + (bracket(G19(x)))^2 + (bracket(G20(x)))^2 + (bracket(G21(x)))^2 + (bracket(G22(x)))^2);
NFE=NFE+1;
end