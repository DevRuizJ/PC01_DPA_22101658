using Microsoft.AspNetCore.Mvc;
using TALLER.MECANICO.CORE;

namespace TALLER.MECANICO.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdenServicioController : ControllerBase
    {
        private readonly IOrdenServicioService _ordenServicioService;
        public OrdenServicioController(IOrdenServicioService ordenServicioService)  
        {
            _ordenServicioService = ordenServicioService;
        }
    }
}
