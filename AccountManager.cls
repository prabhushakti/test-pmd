public class AccountManager {
    // Method to create a new Account
    public static Account__c createAccount(String name, String email) {
        Account__c newAccount = new Account__c();
        newAccount.Name = name;
        newAccount.Email__c = email;
        insert newAccount;
        return newAccount;
    }

    // Method to retrieve an Account by Id
    public static Account__c getAccountById(Id accountId) {
        return [SELECT Id, Name, Email__c FROM Account__c WHERE Id = :accountId LIMIT 1];
    }

    // Method to update an Account
    public static void updateAccount(Id accountId, String newName, String newEmail) {
        Account__c accountToUpdate = getAccountById(accountId);
        accountToUpdate.Name = newName;
        accountToUpdate.Email;
	}
}
