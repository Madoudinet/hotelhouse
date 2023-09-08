<?php

namespace App\Controller\Admin;

use App\Entity\Slider;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class SliderCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Slider::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            IntegerField::new('ordre'),
            ImageField::new('photo')->setUploadDir('public/img/upload/')->setUploadedFileNamePattern('[timestamp]-[slug].[extension]')->onlyWhenCreating(),
            ImageField::new('photo')->setUploadDir('public/img/upload/')->setUploadedFileNamePattern('[timestamp]-[slug].[extension]')->setFormTypeOptions(['required' => false])->onlyWhenUpdating(),
            ImageField::new('photo')->setBasePath('img/upload/')->hideOnForm(),
            DateTimeField::new('date_enregistrement')->hideOnForm()->setFormat('d/MM/Y'),
        ];
    }

    
    public function createEntity(string $entityFqcn)
    {
        $slide = new $entityFqcn; 
        $slide->setDateEnregistrement(new \DateTime());
        return $slide;
    }
    
}
