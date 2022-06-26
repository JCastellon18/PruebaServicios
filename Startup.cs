using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PruebaServicios.Startup))]
namespace PruebaServicios
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
