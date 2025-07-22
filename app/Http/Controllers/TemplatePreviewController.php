<?php

namespace App\Http\Controllers;

use App\Helpers\TemplateHelper;
use Illuminate\Http\Request;
use Inertia\Inertia;

class TemplatePreviewController extends Controller
{
    public function index($template_slug, Request $request)
    {
        $name = $request->get('for');

        $template = TemplateHelper::getBySlug($template_slug);
        $data = $template['data'];
        $data['name'] = $name;

        return Inertia::render('Templates/' . $template['template_name'], $data);
    }
}
