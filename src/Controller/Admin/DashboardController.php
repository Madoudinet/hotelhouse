<?php

namespace App\Controller\Admin;

use App\Entity\Avis;
use App\Entity\Chambre;
use App\Entity\Commande;
use App\Entity\Slider;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route('/dofustemporis', name: 'admin')]
    public function index(): Response
    {
        // return parent::index();

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        // $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        // return $this->redirect($adminUrlGenerator->setController(OneOfYourCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        //! Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        //! (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        
        return $this->render('admin/my-dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Hotel House');
    }

    public function configureMenuItems(): iterable
    {
        return [
            MenuItem::linkToDashboard('Dashboard', 'fa fa-home'),
            MenuItem::subMenu('Gestion', 'fa fa-newspaper')->setSubItems([

                MenuItem::linkToCrud('Chambre', 'fas fa-bed', Chambre::class),
                MenuItem::linkToCrud('Caroussel', 'far fa-image', Slider::class),
                MenuItem::linkToCrud('Commande', 'far fa-calendar-days', Commande::class),
                MenuItem::linkToCrud('Membre', 'fas fa-user', User::class),
                MenuItem::linkToCrud('Avis', 'fas fa-star', Avis::class),
            ]),
            MenuItem::linkToRoute('Retour au site', 'fas fa-igloo', 'home')

        ];
        // yield MenuItem::linkToCrud('The Label', 'fas fa-list', EntityClass::class);
    }
}
