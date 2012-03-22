function [res,nfactor] = Binomialfilter( n_k_list, norm, opt )
%Binomialfilter calculates filtermasks
% approximating Gauss-functions and its derivatives in any dimensions
%
% Arguments:
% n_k_list: a list of pairs of numbers: [n1,k1, n2,k2, ...]
% ni:       mask size in i-direction (>=1)
% ki:       k-th derivative in i-direction (must be <= floor(n/2))
% norm:     normalization? (1/0)
% opt:      Binomial-Operator ('corr') or -impulse response ('conv')
%
% Default-Arguments:
% norm:     1
% opt:      'corr'
%
% Return:
% res:      filter mask (operator or impulse response), multiplied by
%           nfactor, depending on norm
% nfactor:  normalization factor
%
% Examples:
%   Binomialfilter( [3,0], 0 ):      [[1,2,1],1/4]
%   Binomialfilter( [3,1], 0 ):      [[-1,0,1],1/2]
%   Binomialfilter( [3,0,1,0], 0 ):  [[1;2;1],1/4]
%   Binomialfilter( [5,0, 5,1], 0 ): [[...],1/128]
%
%   Copyright 2004 ClS
%   $Revision: 1.3 $  $Date: 2004/12/05 $

len = length( n_k_list );
if len/2 ~= floor(len/2)
    error( 'Binomialfilter(): n_k_list not a list with an even count of numbers' );
end
for i=1:2:len
    n = n_k_list(i); k = n_k_list(i+1);
    if n ~= floor(n),       error( 'Binomialfilter(): n not integer' );
    elseif n < 1,           error( 'Binomialfilter(): n not >= 2' );
    %elseif k > floor(n/2),  error( 'Binomialfilter(): k not <= floor(n/2)' );
    end
end

if nargin < 3, opt = 'corr';, end
if nargin < 2, norm = 1;, end

if strcmp( opt, 'corr' ), diff = [-1,1];, else diff = [1,-1];, end

res = 1; nfactor = 1;
for j=1:2:len
    mask = 1;
    n = n_k_list(j); k = n_k_list(j+1);
    for i = 1:n-k-1
        mask = conv( mask, [1,1] );
    end
    for i = 1:k
        mask = conv( mask, diff );
    end
    res = kron( mask, res );
    nfactor = nfactor * 2^(-n+k+1);
end

indexes = n_k_list(1:2:len);
if length(indexes) == 1, indexes = [1,indexes];, end      %mind. 1,n für Vektor
res = reshape( res, indexes );

if norm, res = res * nfactor;, end
