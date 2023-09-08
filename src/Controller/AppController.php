<?php

namespace App\Controller;

use App\Entity\Avis;
use App\Entity\Chambre;
use App\Entity\Commande;
use App\Form\AvisType;
use App\Form\CommandeType;
use App\Repository\AvisRepository;
use App\Repository\ChambreRepository;
use App\Repository\SliderRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AppController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(SliderRepository $repo): Response
    {
        
        $sliders = $repo->findBy([],['ordre'=> 'ASC']);

        return $this->render('app/index.html.twig', [
            'sliders' => $sliders,
        ]);
    }

    #[Route('/chambre', name:'app_chambre')]
    public function chambre(ChambreRepository $repo): Response
    {
        $chambres = $repo->findAll();

        return $this->render('app/chambres.html.twig', [
            'chambres'=> $chambres,
        ]);
    }

    // #[Route('chambre/show/{id}', name:'app_chambre_show')]
    // public function show($id, ChambreRepository $repo)
    // {
    //     $chambre = $repo->find($id);
    //     return $this->render('app/commande.html.twig', [
    //         'chambre'=> $chambre,
    //     ]);
    // }

    #[Route('chambre/commande/{id}', name:'app_chambre_commande')]
    public function commande(Chambre $chambre = null, Request $rq, EntityManagerInterface $manager)
    {
        $commande = new Commande;

        $form = $this->createForm(CommandeType::class, $commande);
        $form->handleRequest($rq);

        if($form->isSubmitted() && $form->isValid())
        {
            $commande->setDateEnregistrement(new \DateTime());
            $commande->setChambre($chambre);
            
            
            $arrivee = $commande->getDateArrivee();
            if ($arrivee->diff($commande->getDateDepart())->invert == 1) {
                return $this->redirectToRoute('app_chambre_commande', [
                    'id' => $chambre->getId()
                ]);
            }
            $jours = $arrivee->diff($commande->getDateDepart())->days;
            $prixTotal = ($commande->getChambre()->getPrixJournalier() * $jours) + $commande->getChambre()->getPrixJournalier();

            $commande->setPrixTotal($prixTotal);

            $manager->persist($commande);
            $manager->flush();
            return $this->redirectToRoute('home');
        }

        return $this->render('app/commande.html.twig', [
            'chambre' => $chambre,
            'commande' => $form,
        ]);
    }

    #[Route('/restaurant', name:'app_restaurant')]
    public function restaurant()
    {
        return $this->render('app/restaurant.html.twig');
    }

    #[Route('/spa', name:'app_spa')]
    public function spa()
    {
        return $this->render('app/spa.html.twig');
    }

    #[Route('/avis', name:'app_avis')]
    public function avis(AvisRepository $repo): Response
    {
        $avis = $repo->findAll();

        return $this->render('app/avis.html.twig', [
            'avis'=> $avis,
        ]);
    }

    #[Route('/avis/commentaire', name:'app_avis_commentaire')]
    public function commentaire(EntityManagerInterface $manager, Request $rq)
    {
        $avis = new Avis;

        $form = $this->createForm(AvisType::class, $avis);
        $form->handleRequest($rq);

        if($form->isSubmitted() && $form->isValid())
        {
            $avis->setDateEnregistrement(new \DateTime());

            $manager->persist($avis);
            $manager->flush();
            return $this->redirectToRoute('home');
        }
        return $this->render('app/commentaire.html.twig', [
            'form'=> $form,
        ]);
    }

    #[Route('/information', name:'app_information')]
    public function information()
    {
        return $this->render('app/information.html.twig');
    }

    #[Route('/acces', name:'app_acces')]
    public function acces()
    {
        return $this->render('app/acces.html.twig');
    }

    #[Route('/contact', name:'app_contact')]
    public function contact()
    {
        return $this->render('app/contact.html.twig');
    }

    #[Route('/mentionlegales', name:'app_mentionlegales')]
    public function mentionlegales()
    {
        return $this->render('app/mentionlegales.html.twig');
    }


}
