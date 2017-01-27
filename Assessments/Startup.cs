using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Assessments.Startup))]
namespace Assessments
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
