function bild = getImagesOfSeq( iseq, t )
% gets images of a sequence (again an image sequence)
% 
% returns
%   iseq(t,...) for a list of indexes
%
% Arguments:
%   iseq : image sequence according to readImageSequence
%   t    : index list
%
%   Copyright 2004 ClS 
%   $Revision: 1.0 $  $Date: 20040907 $


if t < 1 | t > size(iseq,1)
    error( 'getImagesOfSeq(): idex t not in range' );
end

switch ndims(iseq)
    case 3, rgb = false;,
    case 4, rgb = true;,
    otherwise error( 'getImagesOfSeq(): image class not supported' )
end

if ~rgb
    bild = iseq(t,:,:);
else
    bild = iseq(t,:,:,:);
end
