using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EFCore_Issue_17936.Models;

public class MainEntityStatus: IEntityTypeConfiguration<MainEntityStatus>
{
    public MainEntityStatus()
    {
        MainEntities = new HashSet<MainEntity>();
    }
    
    public int Id { get; set; }
    public string StatusName { get; set; } = null!;

    public ICollection<MainEntity> MainEntities { get; set; }

    public void Configure(EntityTypeBuilder<MainEntityStatus> builder)
    {
        builder.ToTable("MainEntityStatus", "dbo")
            .HasKey(mes => mes.Id);
    }
}