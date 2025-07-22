<?php

namespace App\Templates\Components;

class Background
{
    public $background;
    public $opacity;
    public $backgroundSize;
    public $backgroundPosition;

    public function __construct($background, $opacity, $backgroundSize, $backgroundPosition)
    {
        $this->background = "url(" . $background . ")";
        $this->opacity = $opacity;
        $this->backgroundSize = $backgroundSize;
        $this->backgroundPosition = $backgroundPosition;
    }

    public function render()
    {
        return [
            "background" => $this->background,
            "opacity" => $this->opacity,
            "backgroundSize" => $this->backgroundSize,
            "backgroundPosition" => $this->backgroundPosition
        ];
    }
}
