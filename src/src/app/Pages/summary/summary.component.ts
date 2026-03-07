import { CommonModule } from '@angular/common';
import { Component, input, Input } from '@angular/core';

@Component({
  selector: 'app-summary',
  imports: [CommonModule],
  templateUrl: './summary.component.html',
  styleUrl: './summary.component.css',
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
  @Input() startDate: string = '';

  get yearsOfExperience(): string {
    const start = new Date(this.startDate);
    const now = new Date();
    let years = now.getFullYear() - start.getFullYear();
    let months = now.getMonth() - start.getMonth();
    // Adjust months and years if the end month is before the start month
    if (months < 0) {
      years--;
      months += 12;
    }
    let yoe_string =
      months < 6 ? `${years}+ years` : `around ${years + 1} years`;
    return yoe_string;
  }

  get summaryWithExperience(): string {
    return this.about.replace(
      '{yearsOfExperience}',
      this.yearsOfExperience.toString(),
    );
  }
}
