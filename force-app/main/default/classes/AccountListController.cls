public with sharing class AccountListController {

    public Integer limitSize { get; set; }   // how many accounts to show
    public List<AccountWrapper> accounts { get; set; }

    public AccountListController() {
        limitSize = 10; // assign default here

        // Query Accounts and related Opportunities
        List<Account> accList = [
            SELECT Id, Name, Industry, 
                   (SELECT Id FROM Opportunities)
            FROM Account
            LIMIT :limitSize
        ];

        accounts = new List<AccountWrapper>();

        for (Account acc : accList) {
            Integer oppCount = acc.Opportunities != null ? acc.Opportunities.size() : 0;
            accounts.add(new AccountWrapper(acc, oppCount));
        }
    }

    // Wrapper class
    public class AccountWrapper {
        public Account acc { get; set; }        // full Account object
        public String safeIndustry { get; set; }
        public Integer oppCount { get; set; }

        public AccountWrapper(Account acc, Integer oppCount) {
            this.acc = acc;
            this.oppCount = oppCount;
            this.safeIndustry = String.isNotBlank(acc.Industry) ? acc.Industry : '—';
        }
    }
}
