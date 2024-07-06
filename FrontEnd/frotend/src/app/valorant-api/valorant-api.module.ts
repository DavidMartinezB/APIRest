import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ValorantApiRoutingModule } from './valorant-api-routing.module';
import { SharedModule } from "../shared/shared.module";

import { HomePageComponent } from './pages/home-page/home-page.component';
import { FeaturesComponent } from './components/features/features.component';
import { IntroComponent } from './components/intro/intro.component';
import { TrialComponent } from './components/trial/trial.component';

import { NgxJsonViewerModule } from 'ngx-json-viewer';

import {MatSelectModule} from '@angular/material/select';
import {MatInputModule} from '@angular/material/input';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatCardModule} from '@angular/material/card';
import {MatIconModule} from '@angular/material/icon';
import { FooterComponent } from './components/footer/footer.component';



@NgModule({
    declarations: [
        HomePageComponent,
        IntroComponent,
        TrialComponent,
        FeaturesComponent,
        FooterComponent,
    ],
    exports: [
        HomePageComponent,
    ],
    imports: [
        CommonModule,
        ValorantApiRoutingModule,
        SharedModule,
        NgxJsonViewerModule,
        MatSelectModule,
        MatInputModule,
        MatFormFieldModule,
        MatCardModule,
        MatIconModule,
    ]
})
export class ValorantApiModule { }
