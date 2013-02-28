function WebmailViewModel() {
    // Data
    var self = this;
    self.folders = ['inbox', 'archive', 'sent', 'spam'];
    self.chosenFolderId = ko.observable();
    self.chosenFolderData = ko.observable();
    self.chosenMailData = ko.observable();

    // Behaviours
    self.goToFolder = function(folder) {
        self.chosenFolderId(folder);
        self.chosenMailData(null);
        $.ajax({ url: '/mails/'+folder, success: self.chosenFolderData, dataType: "json"});
        console.log("Going to folder: " + folder);
    };
    self.goToMail = function(mail) {
        self.chosenFolderId(mail.folder);
        self.chosenFolderData(null); // Stop showing a folder
        $.ajax({url:"/mails/"+mail.id, success:self.chosenMailData, dataType: "json"});
        console.log("Going to mail");
    };
    self.goToFolder('inbox');
};
$(document).ready(function(){
    if ($("#mail_reader").length > 0) {
        console.log("Activating js");
        window.mailViewModel = new WebmailViewModel();
        ko.applyBindings(mailViewModel);
    }
});
