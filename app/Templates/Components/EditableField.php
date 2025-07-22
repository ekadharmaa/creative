<?php

namespace App\Templates\Components;

class EditableField
{
    public $type;
    public $label;

    public function __construct($type, $label)
    {
        $this->type = $type;
        $this->label = $label;
    }
}
