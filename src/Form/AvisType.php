<?php

namespace App\Form;

use App\Entity\Avis;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AvisType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom')
            ->add('prenom')
            ->add('commantaire')
            ->add('note', ChoiceType::class, [
                'choices'=> [
                    '0'=>0,
                    '1'=>1,
                    '2'=>2,
                    '3'=>3,
                    '4'=>4,
                    '5'=>5,
                ]
            ])
            // ->add('date_enregistrement')
            ->add('category', ChoiceType::class, [
                'choices'=> [
                    'Chambre'=>'Chambre',
                    'Restaurant'=>'Restaurant',
                    'Spa'=>'Spa',
                    'Hotel'=>'Hotel',
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Avis::class,
        ]);
    }
}
