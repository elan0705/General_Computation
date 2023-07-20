%working MCMC

d = input("enter an initial value"); %taking input
chain = zeros(1,2000);  %size of chain
g_mn = 0;               %guassian_mean_prior
g_sd = 0.2;             %guassian_sd_prior
pr_mn = 1.5;            %normal_mean
pr_sd = 1.5;            %normal_sd
proposed_sd = 0.2;      % proposed_sd
prior = normrnd(g_mn, g_sd, 10); %prior_distribution

chain(1) = d;               %setting user input as initial value

% loop for 2000 iterations

for i = 2:length(chain)
    current_val = chain(i-1); %taking initial_value as currrent value
    
    proposed_val = current_val + normrnd(g_mn, proposed_sd, 44); %proposed distribution
    
    maxi = proposed_val(randi(numel(proposed_val)));
    if maxi > current_val                                         %accepting_the_proposed_value
        chain(i)= maxi;
    else
        if (normpdf(g_mn, proposed_val, g_sd).* normpdf(proposed_val, pr_mn, pr_sd))> (normpdf(g_mn, current_val, g_sd).* normpdf(current_val, pr_mn, pr_sd)) %accepting the proposed_value
            chain(i) = maxi;
        else
            if (rand) < (normpdf(g_mn, proposed_val, g_sd).* normpdf(proposed_val, pr_mn, pr_sd))/(normpdf(g_mn, current_val, g_sd).* normpdf(current_val, pr_mn, pr_sd)) %accepting the proposed_value with probability
                chain(i) = maxi;
            else                                                %updating the previous chain value
                chain(i) = chain(i-1);
            end
        end
    end
end



figure;
plot(proposed_val);
title('Subplot 1: proposed');
xlabel('samples');
ylabel('values');

figure;
plot(prior);
title('Subplot 2: prior');
xlabel('samples');
ylabel('values');



figure;       %a better posterior can be obtained by changing the  posterior sd and initial value
yyaxis left
b = bar(chain);
yyaxis right
p = plot(chain);

p.LineWidth = 2;
b.FaceColor = [ 0 0.5 0.5];






%simple MCMC method 


%stv =10; %mean
%sdpd = 0.2; %sd
%gpr_mn =1.5; %guass mean
%gpr_sd = 1.5; %guass sd
%chain= 2000; %size
%chain(1)=200; %starting val
%current = zeros(1, chain);
%for i = 2:chain
    %current(i)= chain(i-1); %current value
    %proposal(i)= current(i) + normrnd(0, 0.2, 1); %proposed value
    
   % aln= normpdf(stv, proposal, sdpd);
   
    %bln= normpdf(stv, current, sdpd);
    
    %if aln < bln
     %   chain(i)= proposal;
    %else
   %     kd = aln/bln; %ratio(loglikelihood values)
    %    lo = rand(1);
   %         chain(i)= proposal;
  %     else
  %          chain(i)= chain(i-1);
 %       end
 %   end
            
%end


