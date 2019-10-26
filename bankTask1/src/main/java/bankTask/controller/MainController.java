package bankTask.controller;

import java.security.Principal;
import java.util.*;

import bankTask.entity.Account;
import bankTask.entity.Client;
import bankTask.entity.Transaction;
import bankTask.service.BankTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {
    @Autowired
    BankTaskService bankTaskService;

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        model.addAttribute("title", "Welcome");
        model.addAttribute("message", "This is welcome page!");
        return "welcomePage";
    }

    @RequestMapping(value = "/admin/add", method = {RequestMethod.PUT, RequestMethod.POST})
    public String addClient(@ModelAttribute("client") Client theClient,
                            BindingResult result) {
        bankTaskService.saveClients(theClient);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/clients/{clientId}/accounts/add",
            method = {RequestMethod.PUT, RequestMethod.POST})
    public String addAccount(@PathVariable("clientId") Long clientId,
                             @ModelAttribute("account") Account account, BindingResult result) {
        Client client = bankTaskService.getClient(clientId);
        account.setClient(client);
        bankTaskService.saveAccount(account);
        return "redirect:/admin/clients/{clientId}/accounts";
    }

    @RequestMapping(value = "/admin/clients/{clientId}/transaction/add/{outAccountId}",
            method = {RequestMethod.PUT, RequestMethod.POST})
    public String addTransaction(@RequestParam(value = "mInAccountId", required = false) Long mInAccountId,
                                 @PathVariable("clientId") Long clientId,
                                 @PathVariable("outAccountId") Long outAccountId,
                                 @ModelAttribute("transaction") Transaction transaction, BindingResult result) {
        transaction.setInAccount(bankTaskService.getAccount(mInAccountId));
        transaction.setOutAccount(bankTaskService.getAccount(outAccountId));
        bankTaskService.saveTransaction(transaction);
        return "redirect:/admin/clients/{clientId}/transactions";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(@RequestParam(value = "filter", required = false) String filter, Model model) {
        List<Client> clients = null;
        if (filter == null) {
            clients = bankTaskService.getClients();
            model.addAttribute("filter", "");
        } else {
            clients = bankTaskService.getClientsLike(filter);
            model.addAttribute("filter", filter);
        }
        model.addAttribute("clients", clients);
        return "adminPage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(Model model) {
        return "loginPage";
    }

    @RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
    public String logoutSuccessfulPage(Model model) {
        model.addAttribute("title", "Logout");
        return "logoutSuccessfulPage";
    }

    @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
    public String userInfo(Model model, Principal principal) {
        String userName = principal.getName();
        System.out.println("User Name: " + userName);
        return "userInfoPage";
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {

        if (principal != null) {
            model.addAttribute("message", "Hi " + principal.getName()
                    + "<br> You do not have permission to access this page!");
        } else {
            model.addAttribute("msg",
                    "You do not have permission to access this page!");
        }
        return "403Page";
    }

    @RequestMapping(value = "/admin/add", method = RequestMethod.GET)
    public String ShowFormForUpdate(Model model) {
        Client client = new Client();
        model.addAttribute("client", client);
        return "addClient";
    }

    @RequestMapping(value = "/admin/clients/{clientId}/accounts/add", method = RequestMethod.GET)
    public String ShowFormForAddingAccount(@PathVariable("clientId") Long clientId, Model model) {
        Account account = new Account();
        model.addAttribute("account", account);
        Client client = bankTaskService.getClient(clientId);
        model.addAttribute("client", client);
        return "addAccount";
    }

    @RequestMapping(value = "/admin/clients/{clientId}/accounts/{accountId}/add", method = RequestMethod.GET)
    public String ShowFormForAddingTransaction(@PathVariable("clientId") Long clientId,
                                               @PathVariable("accountId") Long accountId, Model model) {
        Transaction transaction = new Transaction();
        model.addAttribute("transaction", transaction);
        Client client = bankTaskService.getClient(clientId);
        model.addAttribute("client", client);
        Account account = bankTaskService.getAccount(accountId);
        model.addAttribute("account", account);
        List<Account> accountList = bankTaskService.getAccounts();
        model.addAttribute("accountList", accountList);
        return "addTransaction";
    }

    @RequestMapping(value = "/admin/clients/{clientId}/accounts", method = RequestMethod.GET)
    public String ShowFormForAccounts(@PathVariable("clientId") Long clientId, Model model) {
        Client client = bankTaskService.getClient(clientId);
        model.addAttribute("client", client);
        model.addAttribute("accounts", client.getAccountList());
        return "clientAccounts";
    }

    @RequestMapping(value = "/admin/clients/{clientId}/transactions", method = RequestMethod.GET)
    public String ShowFormForTransactions(@PathVariable("clientId") Long clientId, Model model) {
        Client client = bankTaskService.getClient(clientId);
        model.addAttribute("client", client);
        List<Account> accounts = client.getAccountList();
        Set<Transaction> transactionsSet = new HashSet<>();
        for (Account ac : accounts
        ) {
            transactionsSet.addAll(ac.getInTransactionList());
            transactionsSet.addAll(ac.getOutTransactionList());
        }
        List<Transaction> transactions = new ArrayList<Transaction>(transactionsSet);
        model.addAttribute("transactions", transactions);
        return "clientTransactions";
    }


}
