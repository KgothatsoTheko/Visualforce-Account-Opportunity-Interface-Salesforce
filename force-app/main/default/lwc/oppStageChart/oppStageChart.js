import { LightningElement, wire, track } from 'lwc';
import getOpportunityStageCounts from '@salesforce/apex/OpportunityStageController.getOpportunityStageCounts';

export default class OppStageChart extends LightningElement {
  @track data;
  error;
  maxCount = 0;

  @wire(getOpportunityStageCounts)
  wiredCounts({ error, data }) {
    if (data) {
      this.error = undefined;
      // Add style directly for each row
      this.data = data.map(item => ({
        stage: item.stageName || '(none)',
        count: item.count || 0,
      }));
      this.maxCount = this.data.length ? Math.max(...this.data.map(d => d.count)) : 0;

      // Add barStyle property to each row
      this.data = this.data.map(d => ({
        ...d,
        barStyle: `width:${this.maxCount > 0 ? Math.round((d.count / this.maxCount) * 100) : 0}%;`
      }));
    } else if (error) {
      this.data = undefined;
      this.error = error;
    }
  }

  get isEmpty() {
    return this.data && this.data.length === 0;
  }
}
