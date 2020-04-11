<?php

namespace App\Http\Web\Controllers;

use App\Models\ContentImage as ContentImageModel;
use App\Services\Storage as StorageService;
use App\Traits\Response as ResponseTrait;
use PHPQRCode\QRcode;

class PublicController extends \Phalcon\Mvc\Controller
{

    use ResponseTrait;

    /**
     * @Get("/content/img/{id:[0-9]+}", name="web.content.img")
     */
    public function contentImageAction($id)
    {
        $image = ContentImageModel::findFirst($id);

        if (!$image) {

            $this->response->setStatusCode(404);

            return $this->response;
        }

        $storageService = new StorageService();

        $location = $storageService->getCiImageUrl($image->path);

        $this->response->redirect($location);
    }

    /**
     * @Get("/qr/img", name="web.qr.img")
     */
    public function qrImageAction()
    {
        $text = $this->request->getQuery('text');
        $level = $this->request->getQuery('level', 'int', 0);
        $size = $this->request->getQuery('size', 'int', 3);

        $url = urldecode($text);

        QRcode::png($url, false, $level, $size);

        $this->response->send();

        exit;
    }

}
