<?php

namespace App\Form;

use App\Entity\Commande;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;

class CommandeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('date_arrivee', DateType::class, [
                // renders it as a single text box
                'widget' => 'single_text',])
            ->add('date_depart', DateType::class, [
                // renders it as a single text box
                'widget' => 'single_text',])
            // ->add('prix_total')
            ->add('prenom')
            ->add('nom')
            ->add('telephone')
            ->add('email')
            // ->add('date_enregistrement')
            // ->add('chambre')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Commande::class,
        ]);
    }
}
