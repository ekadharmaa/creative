<?php

namespace App\Templates\Data;

use App\Models\Template;
use App\Templates\Components\Background;
use App\Templates\Components\Button;
use App\Templates\Components\EditableField;
use App\Templates\Components\Text;
use App\Templates\Components\Image;

class Template03 extends Template
{
    public static $category = 'Wedding & Engagement';
    private static $partials = [
        "top" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "left" => "0",
            ],
        ],
        "bottom" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "left" => "0",
            ],
        ],
        "left" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "left" => "0",
                "height" => "100%",
            ],
            "navigation" => "h-full"
        ],
        "right" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "right" => "0",
                "height" => "100%"
            ],
            "navigation" => "h-full"
        ],
        "topLeft" => [
            "src" => "/assets/partials/template-03/tl.webp",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "left" => "0",
            ],
        ],
        "topRight" => [
            "src" => "/assets/partials/template-03/tr.webp",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "right" => "0",
            ],
        ],
        "bottomLeft" => [
            "src" => "/assets/partials/template-03/bl.webp",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "left" => "0",
            ],
        ],
        "bottomRight" => [
            "src" => "/assets/partials/template-03/br.webp",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "right" => "0",
            ],
        ],
    ];
    private static $music = "/assets/sound/lovestory.mp3";
    private static $primaryColor = "#d16bb7";
    private static $secondaryColor = "#000000";

    public function __construct()
    {
        $title = new Text("Title", "Gilang & Rizka", 36, self::$primaryColor, "Kaushan Script");
        $subtitle = new Text("Subtitle", "The Wedding", 18, "#000000", "Merienda");
        $opening_image = new Image(self::$gallery[0], "180px", "230px", ["margin" => "2rem auto", "object-fit" => "cover", "border-radius" => "100px 100px 20px 20px"]);
        $open_button = new Button("Open Button", "Open Invitation", 12, "#ffffff", self::$primaryColor);
        $groom_name = new Text("Nama Pengantin", "Gilang Rahardian Surya", 24, self::$primaryColor, "Dancing Script");
        $groom_description = new Text("Deskripsi Pengantin", "Putra pertama dari Bapak Budi dan Ibu Siti", 12, self::$secondaryColor, "Merienda");
        $social_button = new Button("Social Button", "Tombol Instagram", 12, "#000000", self::$primaryColor);
        $bride_name = new Text("Nama Pengantin", "Rizka Nurul Azizah", 24, self::$primaryColor, "Dancing Script");
        $bride_description = new Text("Deskripsi Pengantin", "Putri pertama dari Bapak Joko dan Ibu Sari", 12, self::$secondaryColor, "Merienda");
        $quotes = new Text("Quotes", '"Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu cenderung dan merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang. Sungguh, pada yang demikian itu benar-benar terdapat tanda-tanda (kebesaran Allah) bagi kaum yang berpikir."', 16, self::$secondaryColor, "Merienda");
        $author = new Text("Author", "QS. Ar-Rum: 21", 12, self::$secondaryColor, "Merienda");
        $background = new Background('/assets/partials/template-03/bg.webp', 1, "cover", "center");
        $account_number = new Text("Account Number", "12345678", 36, self::$primaryColor, "Kaushan Script");
        $account_name = new Text("Account Name", "BCA (Balicreative)", 36, self::$primaryColor, "Kaushan Script");

        $data = [
            "date" => now()->setDay(30),
            "location" => "Jl. Raya Bogor, Jakarta",
            "navigation" => [
                "primary" => "#506c99",
                "secondary" => "#dfe6f2",
            ],
            "opening" => [
                "title" => $title->render(),
                "subtitle" => $subtitle->render(),
                "button" => $open_button->render(),
                "image" => $opening_image->render(),
            ],
            "quotes" => [
                "text" => $quotes->render(),
                "author" => $author->render(),
            ],
            "couple" => [
                "groom_photo" => "/assets/partials/mempelai/pria.jpg",
                "groom_name" => $groom_name->render(),
                "groom_description" => $groom_description->render(),
                "groom_link" => "https://instagram.com/gilang",
                "bride_photo" => "/assets/partials/mempelai/wanita.jpg",
                "bride_name" => $bride_name->render(),
                "bride_description" => $bride_description->render(),
                "bride_link" => "https://instagram.com/rizka",
                "social_button" => $social_button->render(),
            ],
            "background" => $background->render(),
            "gift" => [
                "account_number" => $account_number->render(),
                "account_name" => $account_name->render()
            ]
        ];

        $this->setOption("backgroundColor", "#e6ecf5");
        $this->setOption("primaryColor", self::$primaryColor);
        $this->setOption("secondaryColor", self::$secondaryColor);

        $data['options'] = self::$options;
        $data['gallery'] = self::$gallery;
        $data['partials'] = self::$partials;
        $data['music'] = self::$music;

        $editableFields = [
            "opening.title.value" => new EditableField("text", "Judul Opening"),
            "opening.subtitle.value" => new EditableField("text", "Subtitle Opening"),
            "opening.button.value" => new EditableField("text", "Teks Tombol Opening"),
            "opening.image.src" => new EditableField("image", "Foto Opening"),
            "quotes.text.value" => new EditableField("textarea", "Teks Quotes"),
            "quotes.author.value" => new EditableField("text", "Teks Author"),
            "couple.groom_name.value" => new EditableField("text", "Nama Pengantin Pria"),
            "couple.bride_name.value" => new EditableField("text", "Nama Pengantin Wanita"),
            "couple.groom_description.value" => new EditableField("textarea", "Deskripsi Pengantin Pria"),
            "couple.bride_description.value" => new EditableField("textarea", "Deskripsi Pengantin Wanita"),
            "couple.groom_link" => new EditableField("text", "Link Instagram Pengantin Pria"),
            "couple.bride_link" => new EditableField("text", "Link Instagram Pengantin Wanita"),
            'couple.groom_photo' => new EditableField("image", "Foto Pengantin Pria"),
            'couple.bride_photo' => new EditableField("image", "Foto Pengantin Wanita"),
            "gift.account_number.value" => new EditableField("text", "Nomor Rekening"),
            "gift.account_name.value" => new EditableField("text", "Atas Nama Rekening"),
            "date" => new EditableField("date", "Tanggal Acara"),
            "location" => new EditableField("text", "Link Google Maps Lokasi Acara"),
            "gallery" => new EditableField("gallery", "Galeri Foto"),
            "music" => new EditableField("file", "Musik"),
        ];

        $this->update($data);
        $this->setEditableField($editableFields);
    }
}
