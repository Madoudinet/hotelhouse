<?php

namespace App\Controller\Admin;

use App\Entity\Chambre;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class ChambreCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Chambre::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('titre'),
            TextField::new('description_courte'),
            TextEditorField::new('description_longue')->onlyOnForms(),
            TextField::new('description_longue')->hideOnForm()->setMaxlength(20),
            ImageField::new('photo')->setUploadDir('public/img/upload/')->setUploadedFileNamePattern('[timestamp]-[slug].[extension]')->onlyWhenCreating(),
            ImageField::new('photo')->setUploadDir('public/img/upload/')->setUploadedFileNamePattern('[timestamp]-[slug].[extension]')->setFormTypeOptions(['required' => false])->onlyWhenUpdating(),
            ImageField::new('photo')->setBasePath('img/upload/')->hideOnForm(),
            IntegerField::new('prix_journalier'),
            DateTimeField::new('date_enregistrement')->hideOnForm()->setFormat('d/MM/Y'),

        ];
    }
        
    public function createEntity(string $entityFqcn)
    {
        $chambre = new $entityFqcn; 
        $chambre->setDateEnregistrement(new \DateTime());
        return $chambre;
    }
    
}
