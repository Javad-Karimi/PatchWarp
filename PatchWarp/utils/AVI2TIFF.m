tic
obj_avi= VideoReader('c:\Users\Javad\Documents\MATLAB\Quinn&Javad\RSC_rigid_corrections\animal_2\msvideo1.avi');
vid = read(obj_avi);
toc
%%
vid_squeezed = squeeze(vid);
%%
block_size = 150;
block_quant = ceil(size(vid_squeezed,3) / block_size);
%%
Matlab_FastTiffReadWrite_path = 'c:\Users\Javad\Documents\MATLAB\Matlab_FastTiffReadWrite';
addpath(genpath(Matlab_FastTiffReadWrite_path));

tic
% for ii = 1:block_quant
for ii = 1:block_quant
    if ii < block_quant
        stk_name = ['c:\Users\Javad\Documents\MATLAB\Quinn&Javad\RSC_rigid_corrections\animal_2\msvideo1_', num2str(ii), '.tif'];
        % t = Tiff(stk_name,"w");
        % setTag(t,"Photometric",Tiff.Photometric.MinIsBlack);
        % setTag(t,"Compression",Tiff.Compression.None);
        % % setTag(t, "ResolutionUnit", Tiff.ResolutionUnit.Inch);
        % % setTag(t,"XResolution",300)
        % % setTag(t,"YResolution",300)
        % setTag(t,"BitsPerSample",8);
        % % setTag(t,Tiff.TagID.RowsPerStrip,8);
        % setTag(t,"SamplesPerPixel",block_size);
        % setTag(t,"SampleFormat",Tiff.SampleFormat.UInt);
        % % setTag(t,"ExtraSamples",Tiff.ExtraSamples.Unspecified)
        % setTag(t,"RowsPerStrip",8);
        % setTag(t,"ImageLength",size(vid_squeezed,1));
        % setTag(t,"ImageWidth",size(vid_squeezed,2));
        % setTag(t,"Thresholding",1);
        % setTag(t,"FillOrder",1);
        % setTag(t,"Orientation",1);
        % write(t, vid_squeezed(:, :, (ii-1)*block_size+(1:block_size)));
        % close(t);
        % clearvars t
        % % imwrite(vid_squeezed(:, :, (ii-1)*block_size+(1:block_size)), stk_name,  'compression', 'none', 'RowsPerStrip', 8);
        FastTiffSave(vid_squeezed(:, :, (ii-1)*block_size+(1:block_size)),stk_name);
    else
        stk_name = ['c:\Users\Javad\Documents\MATLAB\Quinn&Javad\RSC_rigid_corrections\animal_2\msvideo1_', num2str(ii), '.tif'];
        % % t = Tiff(stk_name,"w");
        % % setTag(t,"Photometric",Tiff.Photometric.MinIsBlack);
        % % setTag(t,"Compression",Tiff.Compression.None);
        % % setTag(t, "ResolutionUnit", Tiff.ResolutionUnit.Inch);
        % % setTag(t,"BitsPerSample",8);
        % % setTag(t,"SamplesPerPixel",block_size);
        % % setTag(t,"SampleFormat",Tiff.SampleFormat.UInt);
        % % setTag(t,"RowsPerStrip",8);
        % % setTag(t,"ImageLength",size(vid_squeezed,1));
        % % setTag(t,"ImageWidth",size(vid_squeezed,2));
        % % setTag(t,"Thresholding",1);
        % % setTag(t,"FillOrder",1);
        % % setTag(t,"Orientation",1);
        % % setTag(t, 'GrayResponseUnit',1);
        % % write(t, id_squeezed(:,:, (ii-1)*block_size+1:end));
        % % close(t);
        % % clearvars t
        % % imwrite(vid_squeezed(:,:, (ii-1)*block_size+1:end), stk_name, 'fmt', 'tif', 'compression', 'none', 'RowsPerStrip', 8);
        FastTiffSave(vid_squeezed(:,:, (ii-1)*block_size+1:end),stk_name);
    end
end
toc
