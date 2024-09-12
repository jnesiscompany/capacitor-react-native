import { Component } from '@angular/core';
import RN from '../../rn/plugin';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor() {}

  async openRnView(): Promise<void> {
    await RN.openView();
  }
}
