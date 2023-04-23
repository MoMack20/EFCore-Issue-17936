using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCore_Issue_17936.Models;

public class MainEntity: IEntityTypeConfiguration<MainEntity>
{
    public MainEntity()
    {
        RelatedEntities = new HashSet<RelatedEntity>();
    }
    
    public int Id { get; set; }
    public string Name { get; set; } = null!;
    public int StatusId { get; set; }
    public DateTimeOffset DateCreated { get; set; }

    public MainEntityStatus Status { get; set; } = null!;
    public ICollection<RelatedEntity> RelatedEntities { get; set; }

    public void Configure(EntityTypeBuilder<MainEntity> builder)
    {
        builder.ToTable("MainEntity", "dbo")
            .HasKey(me => me.Id);

        builder.Property(me => me.Id).ValueGeneratedOnAdd();

        builder.HasOne(me => me.Status)
            .WithMany(mes => mes.MainEntities)
            .HasForeignKey(me => me.StatusId);
    }
}
