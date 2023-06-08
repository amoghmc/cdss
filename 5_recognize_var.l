%{
    #include "y.tab.h"
%}

%%
[a-zA-Z_] 	{return L;}
[0-9]  		{return D;}
%%

