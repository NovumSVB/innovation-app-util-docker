<?php
function getSiteSettings()
{

    return [
        'api_version' => 2,
        'config_dir' => 'novum.repository',
        'namespace' => 'ApiNovumRepository',
	    'protocol' => isset($_SERVER['IS_DEVEL']) ? 'http' : 'https',
        'live_domain' => 'api.Environment is live, domain name = repository.demo.novum.nuapi.repository.demo.novum.nu',
        'dev_domain' => 'api.Environment is dev, domain name = repository.demo.novum.nuapi.demo.novum.nu',
        'test_domain' => 'api.Environment is test, domain name = repository.demo.novum.nuapi.repository.demo.novum.nu',
    ];
}


