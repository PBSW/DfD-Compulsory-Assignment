using Application.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
public class ProductController
{
    private readonly IProductService _productService;

    private ProductController(IProductService productService)
    {
        _productService = productService;
    }
}