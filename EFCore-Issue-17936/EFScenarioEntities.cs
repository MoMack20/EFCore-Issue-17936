using EFCore_Issue_17936.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCore_Issue_17936;
public class EFScenarioEntities: DbContext
{
    public EFScenarioEntities(DbContextOptions<EFScenarioEntities> options): base(options)
    {
    }

    public DbSet<MainEntity> MainEntities { get; set; } = null!;
    public DbSet<RelatedEntity> RelatedEntities { get; set; } = null!;
    public DbSet<MainEntityStatus> MainEntityStatuses { get; set; } = null!;

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(EFScenarioEntities).Assembly);
    }
}
