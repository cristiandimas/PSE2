using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Codigo : System.Web.UI.Page
{
    private static int _admin = 2;
    private static int _cliente = 1;
    private string correoUsuario = "";
    private string correoEncriptado = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Correo"] != null)
        {
            correoUsuario = Session["Correo"] as string;
            correoEncriptado = EncriptarCorreo(correoUsuario);
            LabelCorreo.Text = correoEncriptado;
        }
        
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            USUARIOSWEB usuario = (USUARIOSWEB)Session["usuario"];
            TERCEROS cliente = (TERCEROS)Session["cliente"];
            fed_usuarios admin = (fed_usuarios)Session["admin"];

            if (admin != null) Response.Redirect("Admin/Inicio.aspx");
            else if (usuario == null || cliente == null)
            {
                return; 
            }
            else
            {
                if (usuario.IDTIPOUSUARIOWEB == _cliente)
                    Response.Redirect("Interno/Inicio.aspx");
            }
        }
        if (Session["tipo"] as string == null) Response.Redirect("Index.aspx");
    }

    public static string EncriptarCorreo(string correo)
    {
        string[] partes = correo.Split('@'); // Dividir el correo en nombre de usuario y dominio
        string nombreUsuario = partes[0];
        string dominio = partes[1];

        // Encriptar el nombre de usuario
        string nombreUsuarioEncriptado = nombreUsuario.Substring(0, Math.Min(3, nombreUsuario.Length)) + new string('*', Math.Max(0, nombreUsuario.Length - 3));

        // Devolver el correo encriptado
        string correoEncriptado = nombreUsuarioEncriptado + "@" + dominio;
        return correoEncriptado;
    }
    public static string CalculateMD5Hash(string input)
    {
        // step 1, calculate MD5 hash from input
        MD5 md5 = System.Security.Cryptography.MD5.Create();
        byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
        byte[] hash = md5.ComputeHash(inputBytes);

        // step 2, convert byte array to hex string
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hash.Length; i++)
        {
            sb.Append(hash[i].ToString("X2"));
        }

        return sb.ToString();
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        div_error.Visible = false;
        Label2.Text = "";

        string password = Login1.Password.Trim();
        string pass = "";
        if ("admin" == Session["tipo"] as string)
            pass = CalculateMD5Hash(password).ToLower();
        else
            pass = password;

        if (pass == Session["CodigoVerificacion"] as string)
        {
            e.Authenticated = true;
        }
        else
        {
            div_error.Visible = true;
            Label2.Text = "Su Codigo es incorrecto por favor valide nuevamente";
            e.Authenticated = false;
        }
    }
}