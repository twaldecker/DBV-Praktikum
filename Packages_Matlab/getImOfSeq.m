function bild = getImOfSeq( iseq, t )
% gets a single image out of a sequence
% 
% returns
%   iseq(t,...) for a single index t (an image)
%
% Arguments:
%   iseq : image sequence according to readImageSequence
%   t    : index
%
%   Copyright 2004 ClS 
%   $Revision: 1.0 $  $Date: 20040907 $


if t < 1 | t > size(iseq,1)
    error( 'getImOfSeq(): idex t not in range' );
end

switch ndims(iseq)
    case 3, rgb = false;,
    case 4, rgb = true;,
    otherwise error( 'getImOfSeq(): image class not supported' )
end

if ~rgb
    bild = squeeze( iseq(t,:,:) );
else
    bild = squeeze( iseq(t,:,:,:) );
end
