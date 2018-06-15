function [isPerco, F, pOSites] = percolation(L,p) 
% Inputs
% L: the size of lattices
% p: the probability
% Outputs
% isPerco: judge whether procolates or not
% F: number of sites in spanning cluster divided bu occupied sites
% pOSites: probability of a site being occupied

% Setup
   RN = rand(L,L);
   u = zeros(L,L);
   u(RN < p) =  1;
   isPerco = 0;
   F = 0;
% clusters:  cls = cluster labels 1, 2, ...   numC = number of clusters 
   [cls, numC] = bwlabel(u,4);
% number of sites
   nSites  = L*L; 
% number of occupied sites
   nOSites = sum(sum(u == 1));
% probability of a site being occupied
   pOSites  = nOSites/nSites;     
% number of occupied sites in each cluster   
   nC = zeros(numC,1);  
   for c = 1 : numC
     nC(c) = length(cls(cls == c)); 
   end
    
% CHECKING FOR SPANNING CLUSTERS
   isSpanX = zeros(numC,1); isSpanY = isSpanX;
    
for c = 1 : numC
    col1 = isempty(find(cls(cls(:,1)==c), 1));
    colN = isempty(find(cls(cls(:,end)==c), 1));
    col1N = col1 + colN;
    if col1N == 0; isSpanX(c) = 1;end
    col1 = isempty(find(cls(cls(1,:)==c), 1));
    colN = isempty(find(cls(cls(end,:)==c), 1));
    col1N = col1 + colN;
    if col1N == 0; isSpanY(c) = 1;end
    if any(isSpanX) || any(isSpanY)
        isPerco = 1;        % 判断是否渗透
        F = nC(c) / nOSites;    % 第三问中的F值
        break;
    end
end