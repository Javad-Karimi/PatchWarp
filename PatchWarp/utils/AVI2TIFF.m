function AVI2TIFF(source_path,fileneame, block_size, Matlab_FastTiffReadWrite_path)
addpath(genpath(Matlab_FastTiffReadWrite_path));

obj_avi= VideoReader([source_path, fileneame]);
avi_stack = read(obj_avi);
clear obj_avi

avi_stack = squeeze(avi_stack);
block_quant = ceil(size(avi_stack,3) / block_size);

for ii = 1:block_quant
    stk_name = [source_path, fileneame, '_' , num2str(ii), '.tif'];
    if ii < block_quant
        FastTiffSave(avi_stack(:, :, (ii-1)*block_size+(1:block_size)),stk_name);
    else
        FastTiffSave(avi_stack(:,:, (ii-1)*block_size+1:end),stk_name);
    end
end

rmpath(genpath(Matlab_FastTiffReadWrite_path));

end