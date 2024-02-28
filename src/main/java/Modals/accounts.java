/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modals;

import java.sql.Date;

/**
 *
 * @author Group_3_SE1709
 */
public class accounts {

      private int accountID;
      private String accountEmail;
      private String accountPassword;
      private String accountName;
      private Date accountDateOfBirth;
      private String Phone;
      private String Address;
      private int roleID;

    public accounts() {
    }

    public accounts(int accountID, String accountEmail, String accountPassword, String accountName, Date accountDateOfBirth, String Phone, String Address, int roleID) {
        this.accountID = accountID;
        this.accountEmail = accountEmail;
        this.accountPassword = accountPassword;
        this.accountName = accountName;
        this.accountDateOfBirth = accountDateOfBirth;
        this.Phone = Phone;
        this.Address = Address;
        this.roleID = roleID;
    }

    public accounts(String accountEmail, String accountPassword, String accountName, Date accountDateOfBirth, String Phone, String Address, int roleID) {
        this.accountEmail = accountEmail;
        this.accountPassword = accountPassword;
        this.accountName = accountName;
        this.accountDateOfBirth = accountDateOfBirth;
        this.Phone = Phone;
        this.Address = Address;
        this.roleID = roleID;
    }
    

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getAccountEmail() {
        return accountEmail;
    }

    public void setAccountEmail(String accountEmail) {
        this.accountEmail = accountEmail;
    }

    public String getAccountPassword() {
        return accountPassword;
    }

    public void setAccountPassword(String accountPassword) {
        this.accountPassword = accountPassword;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public Date getAccountDateOfBirth() {
        return accountDateOfBirth;
    }

    public void setAccountDateOfBirth(Date accountDateOfBirth) {
        this.accountDateOfBirth = accountDateOfBirth;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

     

}