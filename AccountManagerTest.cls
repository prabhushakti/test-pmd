@isTest
public class AccountManagerTest {
    @isTest
    static void testCreateAccount() {
        // Arrange
        String testName = 'Test Account';
        String testEmail = 'test@example.com';

        // Act
        Account__c createdAccount = AccountManager.createAccount(testName, testEmail);

        // Assert
        System.assertNotEquals(null, createdAccount, 'Account should be created');
        System.assertEquals(testName, createdAccount.Name, 'Account name should match');
        System.assertEquals(testEmail, createdAccount.Email__c, 'Account email should match');
    }

    @isTest
    static void testGetAccountById() {
        // Arrange
        Account__c account = AccountManager.createAccount('Test Account', 'test@example.com');

        // Act
        Account__c retrievedAccount = AccountManager.getAccountById(account.Id);

        // Assert
        System.assertNotEquals(null, retrievedAccount, 'Account should be retrieved');
        System.assertEquals(account.Id, retrievedAccount.Id, 'Retrieved account Id should match');
    }

    @isTest
    static void testUpdateAccount() {
        // Arrange
        Account__c account = AccountManager.createAccount('Old Name', 'old@example.com');
        String newName = 'New Name';
        String newEmail = 'new@example.com';

        // Act
        AccountManager.updateAccount(account.Id, newName, newEmail);
        Account__c updatedAccount = AccountManager.getAccountById(account.Id);

        // Assert
        System.assertEquals(newName, updatedAccount.Name, 'Account name should be updated');
        System.assertEquals(newEmail, updatedAccount.Email__c, 'Account email should be updated');
    }
}

