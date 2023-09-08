<?php

namespace App\Controller\Admin;

use App\Entity\Commande;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TelephoneField;

class CommandeCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Commande::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            AssociationField::new('chambre')->hideOnForm(),
            TextField::new('prenom'),
            TextField::new('nom'),
            TelephoneField::new('telephone'),
            TextField::new('email'),
            DateTimeField::new('date_arrivee', 'Date d\'arrivée')->hideOnForm()->setFormat('d/MM/Y'),
            DateTimeField::new('date_depart', 'Date de départ')->hideOnForm()->setFormat('d/MM/Y'),
            IntegerField::new('prix_total'),
            DateTimeField::new('date_enregistrement')->hideOnForm()->setFormat('d/MM/Y à H:mm:s'),
        ];
    }
    
}
