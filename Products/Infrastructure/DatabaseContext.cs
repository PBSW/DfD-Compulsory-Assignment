using Domain;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure;

public class DatabaseContext : DbContext
{
    public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
    {
    }
    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Primary Keys
        modelBuilder.Entity<Product>()
            .HasKey(i => i.Id)
            .HasName("PK_Product");
        
        modelBuilder.Entity<Product>()
            .Property( i => i.Id)
            .ValueGeneratedOnAdd();
        
        modelBuilder.Entity<Category>()
            .HasKey(i => i.Id)
            .HasName("PK_Category");

        modelBuilder.Entity<Category>()
            .Property(i => i.Id)
            .ValueGeneratedOnAdd();
        
        modelBuilder.Entity<Rating>()
            .HasKey(i => i.Id)
            .HasName("PK_Rating");
        
        modelBuilder.Entity<Rating>()
            .Property(i => i.Id)
            .ValueGeneratedOnAdd();
        
        // Relationships
        modelBuilder.Entity<Category>()
            .HasOne<Product>()
            .WithMany()
            .HasForeignKey(i => i.ProductId);
        
        modelBuilder.Entity<Rating>()
            .HasOne<Product>()
            .WithMany()
            .HasForeignKey(i => i.ProductId);
    }
    
    public DbSet<Product> Products { get; set; }
    public DbSet<Category> Categories { get; set; }
    public DbSet<Rating> Ratings { get; set; }
}