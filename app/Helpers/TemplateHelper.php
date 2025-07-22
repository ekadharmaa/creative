<?php

namespace App\Helpers;

use App\Providers\TemplateProvider;

class TemplateHelper
{
    public static function getTemplates()
    {
        $templateProvider = new TemplateProvider();
        return $templateProvider->getTemplates();
    }

    public static function getBySlug($slug)
    {
        $templates = self::getTemplates();
        return collect($templates)->firstWhere('slug', $slug);
    }

    public static function list()
    {
        $templateProvider = new TemplateProvider();
        return $templateProvider->list();
    }
}
