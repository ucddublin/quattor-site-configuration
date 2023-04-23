structure template hardware/card/gpu/nvidia/quadro_rtx8000;

'manufacturer' = 'nvidia';
'name' = 'quadro_rtx8000';
'model' = 'TU102GL';
'power' = 260; # TDP in watts
'bus' = 'PCIe';
'type' = 'turing'; # Nvidia codename
'version' = '75'; # CUDA streaming multiprocessor and compute capability x10

'ram/size' = 49152; # MB
'ram/bus' = '384-bit';
'ram/type' = 'GDDR6';

'pci/class' = 0x030000; # Display controller, VGA compatible controller.
'pci/vendor' = 0x10de; # nVidia Corporation
'pci/device' = 0x1e30;
