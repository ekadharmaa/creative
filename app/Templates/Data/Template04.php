<?php

namespace App\Templates\Data;

use App\Models\Template;
use App\Templates\Components\Background;
use App\Templates\Components\Button;
use App\Templates\Components\EditableField;
use App\Templates\Components\Image;
use App\Templates\Components\Text;

class Template04 extends Template
{
    public static $category = 'Wedding & Engagement';

    /**
     * Partials Template
     * This partials will be displayed in the template
     */
    private static $partials = [
        "top" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "left" => "0",
                "height" => "50%",
            ],
        ],
        "bottom" => [
            "src" => "/assets/partials/template-04/tm-2.webp",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "left" => "0",
                "transform" => "rotate(180deg)",
                "opacity" => "0.8"
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
            "src" => "",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "left" => "0",
            ],
        ],
        "topRight" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "right" => "0",
            ],
        ],
        "bottomLeft" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "left" => "0",
            ],
        ],
        "bottomRight" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "right" => "0",
            ],
        ],
    ];

    /**
     * Music
     * This music will be played in the template
     * @var string
     * @return string
     */
    private static $music = "/assets/sound/lovestory.mp3";

    private static $primaryColor = "#ba492b";
    private static $secondaryColor = "#000000";
    private static $fontPrimary = "Platypi";
    private static $fontSecondary = "Zilla Slab";

    public function __construct()
    {
        /**
         * Background
         * This background will be displayed in the template
         */
        $background = new Background('/assets/partials/template-04/bg.webp', 0.5, "cover", "center");

        /**
         * Navigation Style
         * This navigation style will be displayed in the template
         */
        $navigation = [
            "primary" => "#5d7499",
            "secondary" => "#e6e9eb",
        ];

        /**
         * Set default options
         * This options will be used in the template
         */
        $buttonOptions = new Button("Button", "Tombol", 12, "#ffffff", self::$primaryColor);
        $this->setOption("backgroundColor", "#000000");
        $this->setOption("primaryColor", self::$primaryColor);
        $this->setOption("secondaryColor", self::$secondaryColor);
        $this->setOption("fontPrimary", self::$fontPrimary);
        $this->setOption("fontSecondary", self::$fontSecondary);
        $this->setOption("partials", self::$partials);
        $this->setOption("music", self::$music);
        $this->setOption("button", $buttonOptions->render());

        /**
         * Set default data
         * This data will be displayed in the template
         */
        $title = new Text("Title", "Gilang & Rizka", 36, self::$primaryColor);
        $subtitle = new Text("Subtitle", "The Wedding", 18, "#000000", "Merienda");
        $opening_image = new Image(self::$gallery[0], "180px", "230px", ["margin" => "2rem auto", "object-fit" => "cover", "border-radius" => "100px 100px 5px 5px", "padding" => "10px", "border" => "2px solid" . self::$primaryColor]);
        $open_button = new Text("Button", "Open Invitation", 16);
        $groom_name = new Text("Nama Pengantin", "Gilang Rahardian Surya", 24);
        $groom_description = new Text("Deskripsi Pengantin", "Putra pertama dari Bapak Budi dan Ibu Siti", 12);
        $bride_name = new Text("Nama Pengantin", "Rizka Nurul Azizah", 24);
        $bride_description = new Text("Deskripsi Pengantin", "Putri pertama dari Bapak Joko dan Ibu Sari", 12);
        $quotes = new Text("Quotes", '"Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu cenderung dan merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang. Sungguh, pada yang demikian itu benar-benar terdapat tanda-tanda (kebesaran Allah) bagi kaum yang berpikir."', 16);
        $author = new Text("Author", "QS. Ar-Rum: 21", 12);
        $account_number = new Text("Account Number", "12345678", 36, self::$primaryColor, "Kaushan Script");
        $account_name = new Text("Account Name", "BCA (Balicreative)", 36, self::$primaryColor, "Kaushan Script");

        $data = [
            "date" => now()->setDay(30),
            "location" => "Jl. Raya Bogor, Jakarta",
            "navigation" => $navigation,
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
            ],
            "gift" => [
                "account_number" => $account_number->render(),
                "account_name" => $account_name->render()
            ],
            "background" => $background->render(),
            "gallery" => self::$gallery,
            "options" => array_merge(self::$options, [
                "music" => self::$music
            ]),
            "music" => self::$music,
        ];

        /**
         * Set editable fields
         * This fields will be editable in the admin panel
         */
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
            // "music" => new EditableField("file", "Musik"),
            "options.music" => new EditableField("file", "Musik"),
        ];

        /**
         * Initialize the template
         */
        $this->update($data);
        $this->setEditableField($editableFields);
    }
}
