﻿namespace Domain;

public class Category
{
    public int Id { get; set; }
    public int ProductId { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
}