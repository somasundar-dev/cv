import { CommonModule } from '@angular/common';
import { Component, input, Input } from '@angular/core';

@Component({
  selector: 'app-summary',
  imports: [CommonModule],
  templateUrl: './summary.component.html',
  styleUrl: './summary.component.css'
})
export class SummaryComponent {
  @Input() name: string = '';
  @Input() initials: string = '';
  @Input() location: string = '';
  @Input() locationLink: string = '';
  @Input() summary: string = '';
  @Input() about: string = '';
  @Input() avatarUrl: string = '';
  @Input() personalWebsiteUrl: string = '';
  @Input() email: string = '';
  @Input() tel: string = '';
  @Input() githubUrl: string = '';
  @Input() linkedinUrl: string = '';
}
