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
        
        // Relations
        modelBuilder.Entity<Product>()
            .HasOne<Category>()
            .WithMany()
            .HasForeignKey(i => i.CategoryId);
    }
    
    public DbSet<Product> Products { get; set; }
}