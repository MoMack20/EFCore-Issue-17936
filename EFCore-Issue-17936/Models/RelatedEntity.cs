using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCore_Issue_17936.Models;
public class RelatedEntity: IEntityTypeConfiguration<RelatedEntity>
{
    public int Id { get; set; }
    public int MainEntityId { get; set; }
    public string Name { get; set; } = null!;
    public DateTimeOffset DateCreated { get; set; }
    public bool IsComplete { get; set; }

    public MainEntity MainEntity { get; set; }
    
    public void Configure(EntityTypeBuilder<RelatedEntity> builder)
    {
        builder.ToTable("RelatedEntity", "dbo")
            .HasKey(re => re.Id);

        builder.Property(re => re.Id).ValueGeneratedOnAdd();
        
        builder.HasOne(re => re.MainEntity)
            .WithMany(me => me.RelatedEntities)
            .HasForeignKey(re => re.MainEntityId);
    }
}

