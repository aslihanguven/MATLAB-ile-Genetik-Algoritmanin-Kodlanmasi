clc
clear
close all;

%definition problem
costfunction=@(x) toplam(x);
Npop=20;
Nvar=20;

birey.pozisyon=[];
birey.maliyet=[];

pop=repmat(birey,Npop,1);

for i =1:Npop
    pop(i).pozisyon=randi([0 1] , 1 , Nvar);
    pop(i).maliyet=costfunction(pop(i).pozisyon);
end

cost=[pop.maliyet];
[cost, y]=sort(cost);
pop=pop(y);
best.sol=pop(1);

%main Loop
iterasyon=100;
pc=0.7;
Npopc=round(pc*Npop);
pm=0.5;
Npopm=round(pm*Npop);

for it=1:iterasyon
    %crossover
    popc=repmat(birey,Npop/2,2);
    for k=1:Npop/2
        %selection
        i1=randi([1 Npop]);
        pop1=pop(i1);
        
        i2=randi([1 Npop]);
        pop2=pop(i2);
         
        pop(k,1).maliyet=costfunction(popc(k,1).pozisyon);
        pop(k,2).maliyet=costfunction(popc(k,2).pozisyon);
       
    end
    popc=popc(:);
    
    %mutation
    popm=repmat(birey,Npop,1);
    for j=1:Npopm
        %selection
        i1=randi([1 Npop]);
        pop1=pop(i1);
        popm(j).pozisyon=mutation(pop1.pozisyon);
        popm(j).maliyet=costfunction(popm(j).pozisyon);
        
    end
    
    
end
figure;
plot(cost , y);




