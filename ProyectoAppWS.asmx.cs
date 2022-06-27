using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using PruebaServicios.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;


namespace PruebaServicios
{
    /// <summary>
    /// Descripción breve de ProyectoAppWS
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class ProyectoAppWS : System.Web.Services.WebService
    {
        ProyectoServiciosModelContainer db = new ProyectoServiciosModelContainer();

        public bool Login(string user, string pass)
        {
            // No cuenta los errores de inicio de sesión para el bloqueo de la cuenta
            // Para permitir que los errores de contraseña desencadenen el bloqueo de la cuenta,
            //cambie a shouldLockout: true
            // var result = SignInManager.PasswordSignInAsync(user, pass, false, shouldLockout: false);
            var result = HttpContext.Current.GetOwinContext().Get<ApplicationSignInManager>().PasswordSignIn(user, pass, false, false);
            if (result == SignInStatus.Success)
            {
                return true;
            }
            else
                return false;
        }
        [WebMethod]
        public bool AddUser(string Email, string Pass)
        {
            bool band = false;
            ApplicationDbContext context = new ApplicationDbContext();
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            //Here we create a Admin super user who will maintain the website
            var user = new ApplicationUser();
            user.UserName = Email;
            user.Email = Email;
            string userPWD = Pass;
            var chkUser = UserManager.Create(user, userPWD);

            //Add default User to Role Admin
            if (chkUser.Succeeded)
            {
                var result1 = UserManager.AddToRole(user.Id, "freemium");
                band = true;
            }
            else band = false;
            //Agregamos una persona
            return band;
        }

        public bool ResetPassword(string Email, string Pass)
        {
            bool band = false;
            ApplicationDbContext context = new ApplicationDbContext();
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            //Here we create a Admin super user who will maintain the website
            var user = new ApplicationUser();
            user.UserName = Email;
            user.Email = Email;
            string userPWD = Pass;
            var chkUser = UserManager.Create(user, userPWD);

            //Add default User to Role Admin
            if (chkUser.Succeeded)
            {
                var result1 = UserManager.AddToRole(user.Id, "freemium");
                band = true;
            }
            else band = false;
            //Agregamos una persona
            return band;
        }
        public bool AddArticulo(double precioUnidad, string descripcion, int cantidad, byte[] img, int categoria)
        {
            Articulo item = new Articulo();
            item.PrecioUnitario = precioUnidad;
            item.Descripcion = descripcion;
            item.Cantidad= cantidad;
            item.Img = img;
            item.CategoriaId= categoria;

            db.Articulos.Add(item);
            if (db.SaveChanges() > 0)
            {
                return true;
            }
            else
                return false;
        }
        public bool AddCategoria(string nombreCategoria, string descripcion)
        {
            Categoria item = new Categoria();
            item.NombreCategoria = nombreCategoria;
            item.Descripcion = descripcion;
            db.Categorias.Add(item);
            if (db.SaveChanges() > 0)
            {
                return true;
            }
            else
                return false;
        }
    }
}
