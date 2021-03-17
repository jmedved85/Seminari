using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Seminari.Models
{
    public partial class BazaSeminariContext : DbContext
    {
        public BazaSeminariContext()
        {
        }

        public BazaSeminariContext(DbContextOptions<BazaSeminariContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Predavac> Predavacs { get; set; }
        public virtual DbSet<Predbiljezba> Predbiljezbas { get; set; }
        public virtual DbSet<Seminar> Seminars { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=DESKTOP-MAN7GV7\\SQLEXPRESS;Database=BazaSeminari;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Croatian_CI_AS");

            modelBuilder.Entity<Predavac>(entity =>
            {
                entity.HasKey(e => e.IdPredavac);

                entity.ToTable("predavac");

                entity.Property(e => e.IdPredavac).HasColumnName("ID_predavac");

                entity.Property(e => e.Ime)
                    .HasMaxLength(50)
                    .HasColumnName("ime");

                entity.Property(e => e.Prezime)
                    .HasMaxLength(50)
                    .HasColumnName("prezime");
            });

            modelBuilder.Entity<Predbiljezba>(entity =>
            {
                entity.HasKey(e => e.IdPredbiljezba);

                entity.ToTable("predbiljezba");

                entity.Property(e => e.IdPredbiljezba).HasColumnName("ID_predbiljezba");

                entity.Property(e => e.Adresa)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("adresa");

                entity.Property(e => e.Datum)
                    .HasColumnType("date")
                    .HasColumnName("datum");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("email");

                entity.Property(e => e.IdSeminar).HasColumnName("ID_seminar");

                entity.Property(e => e.Ime)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("ime");

                entity.Property(e => e.Prezime)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("prezime");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Telefon)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("telefon");

                entity.HasOne(d => d.IdSeminarNavigation)
                    .WithMany(p => p.Predbiljezbas)
                    .HasForeignKey(d => d.IdSeminar)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_predbiljezba_seminar");
            });

            modelBuilder.Entity<Seminar>(entity =>
            {
                entity.HasKey(e => e.IdSeminar);

                entity.ToTable("seminar");

                entity.Property(e => e.IdSeminar).HasColumnName("ID_seminar");

                entity.Property(e => e.Datum)
                    .HasColumnType("date")
                    .HasColumnName("datum");

                entity.Property(e => e.IdPredavac).HasColumnName("ID_predavac");

                entity.Property(e => e.Naziv)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("naziv");

                entity.Property(e => e.Opis)
                    .HasMaxLength(250)
                    .HasColumnName("opis");

                entity.Property(e => e.Popunjen).HasColumnName("popunjen");

                entity.HasOne(d => d.IdPredavacNavigation)
                    .WithMany(p => p.Seminars)
                    .HasForeignKey(d => d.IdPredavac)
                    .HasConstraintName("FK_seminar_predavac");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
