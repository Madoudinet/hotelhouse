<?php

namespace App\Controller\Admin;

use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;

class UserCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return User::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('email', 'E-mail'),
            TextField::new('password', 'Mot de passe')->setFormType(PasswordType::class)->onlyWhenCreating(),
            TextField::new('pseudo', 'Pseudo'),
            TextField::new('nom', 'Nom'),
            TextField::new('prenom', 'Prénom'),
            TextField::new('civilite', 'Sexe'),
            CollectionField::new('roles')->setTemplatePath('admin/field/roles.html.twig'),
            DateTimeField::new('date_enregistrement')->hideOnForm()->setFormat('d/MM/Y'),
        ];
    }

    public function createEntity(string $entityFqcn)
    {
        $user = new $entityFqcn;
        $user->setDateEnregistrement(new \DateTime());
        return $user;
    }
    
}
