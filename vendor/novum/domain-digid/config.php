<?php

if(isset($_SERVER['IS_DEVEL']))
{
    $aConfig = [
        'PROTOCOL' => 'http',
        'ADMIN_PROTOCOL' => 'http',
        'CUSTOM_FOLDER' => 'NovumDigid',
        'ABSOLUTE_ROOT' => $_SERVER['SYSTEM_ROOT'],
        'DOMAIN' => 'digid.demo.novum.nuidev.nl',
        /* Je zoekt waarschijnlijk Config::getDataDir() */
        'DATA_DIR' => '../'
    ];
}
else
{
    $aConfig = [
        'PROTOCOL' => 'https',
        'ADMIN_PROTOCOL' => 'https',
        'CUSTOM_FOLDER' => 'NovumDigid',
        'DOMAIN' => 'digid.demo.novum.nu',
        'ABSOLUTE_ROOT' => '/home/novum/platform/system',
        'DATA_DIR' => '/home/novum/platform/data'
    ];
}

$aConfig['CUSTOM_NAMESPACE'] = 'NovumDigid';

return $aConfig;

