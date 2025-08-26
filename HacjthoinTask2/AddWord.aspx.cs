using HacjthoinTask2.Test2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HacjthoinTask2

{
    public partial class AddWord : System.Web.UI.Page
    {
        string currentWord;
        protected void Page_Load(object sender, EventArgs e)
        {
            currentWord = Request.QueryString["word"];
            lblword.Text = "Word:" + currentWord;

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string translation = txtTranslate.Text.Trim();
            Word_Dict.updateTranslation(currentWord, translation);
            Response.Redirect("MyWord.aspx");
        }
    }

}

