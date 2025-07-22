<?php

namespace App\Templates\Components;

class Image
{

    public $src;
    public $width;
    public $height;
    public $style = [];

    public function __construct($src, $width, $height, $style = [])
    {
        $this->src = $src;
        $this->width = $width;
        $this->height = $height;
        $this->style = $style;
    }

    public function render()
    {
        $data = [
            "src" => $this->src,
            "style" => [
                "width" => $this->width,
                "height" => $this->height,
            ]
        ];

        if (count($this->style) > 0) {
            $data['style'] = array_merge($data['style'], $this->style);
        }

        return $data;
    }
}
