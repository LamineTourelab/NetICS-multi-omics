% ========== NetICS test tutorial ===========
% This is a test of the NetICS algorithm using the source data. You can
% download all the supplementary files following the link in the readme
% file. Then you have to put all the FUN and data in the same folder. 

% ====== Files like describe in the netisc fun ===========
%  INPUTS:
%   filenameMu(varargin{1}):         input file that contains the genetically aberrant genes of each sample. 
%                                    It contains two columns that map every gene (1st column) to the samples that 
%                                    it is genetically aberrant (2nd column)
%   adj(varargin{2}):                adjacency matrix of the directed interaction network
%   restart_prob(varargin{3}):       restart probability for the insulated diffusion. For (Wu et al., 2010) network use 0.4.
%   rank_method_str(varargin{4}):    'MEDIAN' uses the median of the sample-specific ranks
%                                    'RRA' uses the Robust Rank Aggregation method to integrate sample-specific ranked lists
%                                    'SUM' uses the sum of the sample-specific ranks
%   filenameNet(varargin{5}):        input file that contains the list of the genes that are present in the network. 
%                                    They should be in the same order as in the rows of the adjacency matrix adj. 
%                                    An example file is given that contains the gene names of the network described in (Wu et al, 2010).
%   filenameRNA(varargin{6}):        tab delimited file with two columns. First column contains the genes for which differential expression 
%                                    between the tumor and normal samples at the RNA level was measured. Second column contains the p-values 
%                                    of these measurements. This file can be the result of a tool for differential expression analysis such as DESeq2. 
%                                    Each gene in this file should have only one entry.
%   filenamePR(varargin{7}):         tab delimited file with two columns. First column contains the proteins for which differential expression between 
%                                    the tumor and normal samples at the protein level was measured. Second column contains the p-values of these 
%                                    measurements. Each gene in this file should have only one entry.
%%  
load('adj_lar_com');
restart_prob=0.4;
%%%%%%ù
%% ======== Running the NetICS fun ===========
[ ranked_list_genes, ranked_scores ] = netics_fun( 'mutation_data_breast.txt', adj_lar_com, restart_prob, 'RANK_AGGREG=SUM', 'network_genes.txt', 'RNA_diff_expr_breast.txt', 'protein_diff_expr_breast.txt');
%%%%
%% results 
z = ranked_list_genes(1:10);
disp(z)
 %% 
 
