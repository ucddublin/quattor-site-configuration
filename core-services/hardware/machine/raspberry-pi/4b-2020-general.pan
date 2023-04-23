structure template hardware/machine/raspberry-pi/4b-2020-general;

'model' = '4b-2020-general';
'manufacturer' = 'raspberry-pi';
'vendor' = 'farnell';
'type' = 'service';

'harddisks' = dict(
    'mmcblk0', create('hardware/harddisk/generic/sdcard', 'capacity', 29664 * MB, 'boot', true),
);
