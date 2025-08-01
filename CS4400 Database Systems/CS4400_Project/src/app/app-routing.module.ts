import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CreateAppointmentComponent } from './create-appointment/create-appointment.component';
import { ViewAppointmentComponent } from './view-appointment/view-appointment.component';
import { ReassignTesterComponent } from './reassign-tester/reassign-tester.component';
import { CreateTestingSiteComponent } from './create-testing-site/create-testing-site.component';
import { ExplorePoolResultComponent } from './explore-pool-result/explore-pool-result.component';
import { TesterChangeTestingSiteComponent } from './tester-change-testing-site/tester-change-testing-site.component';
import { ViewDailyResultsComponent } from './view-daily-results/view-daily-results.component';
import { ProcessPoolComponent } from './process-pool/process-pool.component';
import { StudentHomeComponent } from './student-home/student-home.component';
import { SiteTestHomeComponent } from './site-test-home/site-test-home.component';
import { LabSiteHomeComponent } from './lab-site-home/lab-site-home.component';
import { LabTechHomeComponent } from './lab-tech-home/lab-tech-home.component';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { StudentViewTestResultsComponent } from './student-view-test-results/student-view-test-results.component'
import { ExploreTestResultComponent } from './explore-test-result/explore-test-result.component'
import { AggregateTestResultsComponent } from './aggregate-test-results/aggregate-test-results.component'
import { SignUpForATestComponent } from './sign-up-for-a-test/sign-up-for-a-test.component'
import { LabTechTestsProcessedComponent } from './lab-tech-tests-processed/lab-tech-tests-processed.component'
import { ViewPoolsComponent } from './view-pools/view-pools.component'
import { CreateAPoolComponent } from './create-a-pool/create-a-pool.component'

const routes: Routes = [
  { path: 'login', component: LoginComponent},
  { path: 'register', component: RegisterComponent},
  { path: 'createAppointment', component: CreateAppointmentComponent},
  { path: 'viewAppointment', component: ViewAppointmentComponent},
  { path: 'reassignTester', component: ReassignTesterComponent},
  { path: 'createTestingSite', component: CreateTestingSiteComponent},
  { path: 'explorePoolResult', component: ExplorePoolResultComponent},
  { path: 'testerChangeTestingSite', component: TesterChangeTestingSiteComponent},
  { path: 'viewDailyResults', component: ViewDailyResultsComponent},
  { path: 'processPoolPage', component: ProcessPoolComponent},
  { path: 'studentHome', component: StudentHomeComponent}, 
  { path: 'siteTestHome', component: SiteTestHomeComponent},
  { path: 'labSiteHome', component: LabSiteHomeComponent},
  { path: 'labTechHome', component: LabTechHomeComponent},
  { path: 'adminHome', component: AdminHomeComponent},
  { path: 'studentViewTestResults', component: StudentViewTestResultsComponent}, // Jim's screen4
  { path: 'exploreTestResult', component: ExploreTestResultComponent}, // Jim's screen5
  { path: 'aggregateTestResults', component: AggregateTestResultsComponent}, // Jim's screen6
  { path: 'signUpForATest', component: SignUpForATestComponent}, // Jim's screen7
  { path: 'labTechTestProcessed', component: LabTechTestsProcessedComponent}, // Jim's screen8
  { path: 'viewPools', component: ViewPoolsComponent}, // Jim's screen9
  { path: 'createAPool', component: CreateAPoolComponent}, // Jim's screen10
  { path: '', pathMatch: 'full', redirectTo: '/login' }
  // { path: 'welcome', loadChildren: () => import('./pages/welcome/welcome.module').then(m => m.WelcomeModule) },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
