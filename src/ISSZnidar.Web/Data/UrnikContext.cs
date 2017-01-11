using ISSZnidar.Web.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ISSZnidar.Web.Data
{
    public partial class UrnikDbContext : DbContext
    {
        public virtual DbSet<Predmet> Predmet { get; set; }
        public virtual DbSet<Termin> Termin { get; set; }

        public UrnikDbContext(DbContextOptions<UrnikDbContext> options) 
            : base(options)
        {
            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Predmet>(entity =>
            {
                entity.Property(e => e.PredmetId).HasColumnName("PredmetID");

                entity.Property(e => e.Naziv).HasMaxLength(500);
            });

            modelBuilder.Entity<Termin>(entity =>
            {
                entity.Property(e => e.TerminId).HasColumnName("TerminID");

                entity.Property(e => e.Konec).HasColumnType("datetime");

                entity.Property(e => e.Opis).HasMaxLength(500);

                entity.Property(e => e.PredmetId).HasColumnName("PredmetID");

                entity.Property(e => e.Zacetek).HasColumnType("datetime");

                entity.HasOne(d => d.Predmet)
                    .WithMany(p => p.Termin)
                    .HasForeignKey(d => d.PredmetId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("FK_Termin_Predmet");
            });
        }
    }
}