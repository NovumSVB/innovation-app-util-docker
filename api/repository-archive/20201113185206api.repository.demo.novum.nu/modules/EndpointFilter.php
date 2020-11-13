<?php
namespace ApiNovumRepository;

use Crud\FormManager;
use Crud\IApiEndpointFilter;
use Crud\IApiAlwaysExpose;

class EndpointFilter implements IApiEndpointFilter
{

    function filter(FormManager $oManager):bool
    {
        if($oManager instanceof \Crud\IApiAlwaysExpose)
        {
            return true;
        }

        if(!method_exists($oManager, 'getTags'))
        {
            return false;
        }
        $aTags = $oManager->getTags();

        if(!in_array('NovumRepository', $aTags))
        {
            return false;
        }

        return true;
    }
}
