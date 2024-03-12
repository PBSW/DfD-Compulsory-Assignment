﻿using Domain;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure;

public class DatabaseContext : DbContext
{
    public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
    {
    }
    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Primary keys
        modelBuilder.Entity<Product>()
            .HasKey(i => i.Id)
            .HasName("PK_Product");
        
        modelBuilder.Entity<Product>()
            .Property( i => i.Id)
            .ValueGeneratedOnAdd();

        modelBuilder.Entity<Category>()
            .HasKey(i => i.Id)
            .HasName("PK_Category");
        
        modelBuilder.Entity<Rating>()
            .HasKey(i => i.Id)
            .HasName("PK_Rating");

        // Relations
        modelBuilder.Entity<Product>()
            .HasOne<Category>()
            .WithMany()
            .HasForeignKey(i => i.CategoryId);
        
        modelBuilder.Entity<Rating>()
            .HasOne<Product>()
            .WithMany()
            .HasForeignKey(i => i.ProductId);
    }
    
    public DbSet<Product> Products { get; set; }
}