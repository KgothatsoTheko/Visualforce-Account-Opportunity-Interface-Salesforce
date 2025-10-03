public with sharing class OpportunityStageController {
    public class StageCount {
        @AuraEnabled public String stageName;
        @AuraEnabled public Integer count;

        public StageCount(String s, Integer c) {
            stageName = s;
            count = c;
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<StageCount> getOpportunityStageCounts() {
        List<StageCount> results = new List<StageCount>();

        // ✅ Check CRUD before query
        if (Schema.sObjectType.Opportunity.isAccessible()) {
            for (AggregateResult ar : [
                SELECT StageName stg, COUNT(Id) cnt
                FROM Opportunity
                GROUP BY StageName
                ORDER BY COUNT(Id) DESC
            ]) {
                String s = (String) ar.get('stg');
                Integer c = Integer.valueOf(String.valueOf(ar.get('cnt')));
                results.add(new StageCount(s, c));
            }
        }

        return results;
    }
}
