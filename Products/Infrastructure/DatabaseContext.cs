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
        modelBuilder.Entity<Product>()
            .HasKey(i => i.Id)
            .HasName("PK_Product");
        
        modelBuilder.Entity<Product>()
            .Property( i => i.Id)
            .ValueGeneratedOnAdd();
    }
    
    public DbSet<Product> Products { get; set; }
}