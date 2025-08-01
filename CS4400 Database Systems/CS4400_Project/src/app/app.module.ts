import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';
import { WelcomeComponent } from './pages/welcome/welcome.component';
// For Nathan
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
// Jim 
import { StudentViewTestResultsComponent } from './student-view-test-results/student-view-test-results.component'
import { ExploreTestResultComponent } from './explore-test-result/explore-test-result.component'
import { AggregateTestResultsComponent } from './aggregate-test-results/aggregate-test-results.component'
import { SignUpForATestComponent } from './sign-up-for-a-test/sign-up-for-a-test.component'
import { LabTechTestsProcessedComponent } from './lab-tech-tests-processed/lab-tech-tests-processed.component'
import { ViewPoolsComponent } from './view-pools/view-pools.component'
import { CreateAPoolComponent } from './create-a-pool/create-a-pool.component'

import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { IconsProviderModule } from './icons-provider.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NZ_I18N } from 'ng-zorro-antd/i18n';
import { en_US } from 'ng-zorro-antd/i18n';

import { registerLocaleData } from '@angular/common';

import { NzAffixModule } from 'ng-zorro-antd/affix';
import { NzAlertModule } from 'ng-zorro-antd/alert';
import { NzAnchorModule } from 'ng-zorro-antd/anchor';
import { NzAutocompleteModule } from 'ng-zorro-antd/auto-complete';
import { NzAvatarModule } from 'ng-zorro-antd/avatar';
import { NzBackTopModule } from 'ng-zorro-antd/back-top';
import { NzBadgeModule } from 'ng-zorro-antd/badge';
import { NzBreadCrumbModule } from 'ng-zorro-antd/breadcrumb';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzCalendarModule } from 'ng-zorro-antd/calendar';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NzCarouselModule } from 'ng-zorro-antd/carousel';
import { NzCascaderModule } from 'ng-zorro-antd/cascader';
import { NzCheckboxModule } from 'ng-zorro-antd/checkbox';
import { NzCollapseModule } from 'ng-zorro-antd/collapse';
import { NzCommentModule } from 'ng-zorro-antd/comment';
import { NzNoAnimationModule } from 'ng-zorro-antd/core/no-animation';
import { NzTransButtonModule } from 'ng-zorro-antd/core/trans-button';
import { NzWaveModule } from 'ng-zorro-antd/core/wave';
import { NzDatePickerModule } from 'ng-zorro-antd/date-picker';
import { NzDescriptionsModule } from 'ng-zorro-antd/descriptions';
import { NzDividerModule } from 'ng-zorro-antd/divider';
import { NzDrawerModule } from 'ng-zorro-antd/drawer';
import { NzDropDownModule } from 'ng-zorro-antd/dropdown';
import { NzEmptyModule } from 'ng-zorro-antd/empty';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzGridModule } from 'ng-zorro-antd/grid';
import { NzI18nModule } from 'ng-zorro-antd/i18n';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzInputModule } from 'ng-zorro-antd/input';
import { NzInputNumberModule } from 'ng-zorro-antd/input-number';
import { NzHeaderComponent, NzLayoutModule } from 'ng-zorro-antd/layout';
import { NzListModule } from 'ng-zorro-antd/list';
import { NzMentionModule } from 'ng-zorro-antd/mention';
import { NzMenuModule } from 'ng-zorro-antd/menu';
import { NzMessageModule } from 'ng-zorro-antd/message';
import { NzModalModule } from 'ng-zorro-antd/modal';
import { NzNotificationModule } from 'ng-zorro-antd/notification';
import { NzPageHeaderModule } from 'ng-zorro-antd/page-header';
import { NzPaginationModule } from 'ng-zorro-antd/pagination';
import { NzPopconfirmModule } from 'ng-zorro-antd/popconfirm';
import { NzPopoverModule } from 'ng-zorro-antd/popover';
import { NzProgressModule } from 'ng-zorro-antd/progress';
import { NzRadioModule } from 'ng-zorro-antd/radio';
import { NzRateModule } from 'ng-zorro-antd/rate';
import { NzResultModule } from 'ng-zorro-antd/result';
import { NzOptionComponent, NzSelectModule } from 'ng-zorro-antd/select';
import { NzSkeletonModule } from 'ng-zorro-antd/skeleton';
import { NzSliderModule } from 'ng-zorro-antd/slider';
import { NzSpinModule } from 'ng-zorro-antd/spin';
import { NzStatisticModule } from 'ng-zorro-antd/statistic';
import { NzStepsModule } from 'ng-zorro-antd/steps';
import { NzSwitchModule } from 'ng-zorro-antd/switch';
import { NzTableModule } from 'ng-zorro-antd/table';
import { NzTabsModule } from 'ng-zorro-antd/tabs';
import { NzTagModule } from 'ng-zorro-antd/tag';
import { NzTimePickerModule } from 'ng-zorro-antd/time-picker';
import { NzTimelineModule } from 'ng-zorro-antd/timeline';
import { NzToolTipModule } from 'ng-zorro-antd/tooltip';
import { NzTransferModule } from 'ng-zorro-antd/transfer';
import { NzTreeModule } from 'ng-zorro-antd/tree';
import { NzTreeSelectModule } from 'ng-zorro-antd/tree-select';
import { NzTypographyModule } from 'ng-zorro-antd/typography';
import { NzUploadModule } from 'ng-zorro-antd/upload';
import { NzResizableModule } from 'ng-zorro-antd/resizable';
import { NzTableSortFn, NzTableSortOrder } from 'ng-zorro-antd/table';

import en from '@angular/common/locales/en';

registerLocaleData(en);

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    CreateAppointmentComponent,
    ViewAppointmentComponent,
    ReassignTesterComponent,
    CreateTestingSiteComponent,
    ExplorePoolResultComponent,
    TesterChangeTestingSiteComponent,
    ViewDailyResultsComponent,
    ProcessPoolComponent,
    StudentHomeComponent,
    SiteTestHomeComponent,
    LabSiteHomeComponent,
    LabTechHomeComponent,
    AdminHomeComponent,
    StudentViewTestResultsComponent,
    ExploreTestResultComponent,
    AggregateTestResultsComponent,
    SignUpForATestComponent,
    LabTechTestsProcessedComponent,
    ViewPoolsComponent,
    CreateAPoolComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    IconsProviderModule,
    NzLayoutModule,
    NzMenuModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    NzFormModule,
    NzInputModule,
    NzButtonModule,
    NzSelectModule,
    ReactiveFormsModule,
    NzRadioModule,
    NzDropDownModule,
    NzSelectModule,
    NzTableModule,
    NzDividerModule,
    NzTimePickerModule,
    NzMentionModule,
    NzDatePickerModule,
  ],
  providers: [{ provide: NZ_I18N, useValue: en_US }],
  bootstrap: [AppComponent]
})
export class AppModule { }
