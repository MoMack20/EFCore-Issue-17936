﻿
using EFCore_Issue_17936;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Diagnostics;

var dbContextOptions = new DbContextOptionsBuilder<EFScenarioEntities>()
    .UseSqlServer("Server=.;Database=EFScenario;Trusted_Connection=True;Integrated Security=true;TrustServerCertificate=true;")
    .EnableSensitiveDataLogging()
    .LogTo(s => Trace.WriteLine(s), LogLevel.Information)
    .Options;

await using var ctx = new EFScenarioEntities(dbContextOptions);

var windowedQueryable = ctx.MainEntities
    .Where(me => me.StatusId == 1)
    .Select(me => new
    {
        me.Id,
        me.Name,
        RelatedEntityInfo = me.RelatedEntities
            .OrderByDescending(re => re.DateCreated)
            .Select(re => new
            {
                re.Id,
                re.DateCreated,
                re.IsComplete
            }).FirstOrDefault()
    });

var windowedSql = windowedQueryable.ToQueryString();

var windowedWithExtraWhereQueryable = ctx.MainEntities
    .Where(me => me.StatusId == 1)
    .Select(me => new
    {
        me.Id,
        me.Name,
        RelatedEntityInfo = me.RelatedEntities
            .Where(re => me.Id == re.MainEntityId)
            .OrderByDescending(re => re.DateCreated)
            .Select(re => new
            {
                re.Id,
                re.DateCreated,
                re.IsComplete
            }).FirstOrDefault()
    });

var windowedWithExtraWhereSql = windowedWithExtraWhereQueryable.ToQueryString();

var applyQueryable = ctx.MainEntities
    .Where(me => me.StatusId == 1)
    .Select(me => new
    {
        me.Id,
        me.Name,
        RelatedEntityInfo = me.RelatedEntities
            .OrderByDescending(re => re.DateCreated)
            .Select(re => new
            {
                re.Id,
                re.DateCreated,
                re.IsComplete
            }).Take(1)
            .FirstOrDefault()
    });

var applySql = applyQueryable.ToQueryString();

var path = AppContext.BaseDirectory;
await File.WriteAllTextAsync($"{path}../../../windowed.sql", windowedSql);
await File.WriteAllTextAsync($"{path}../../../apply.sql", applySql);

await applyQueryable.ToListAsync(); await applyQueryable.ToListAsync(); // execute the query a couple times before timings to get the startup time out of the way

var stopwatch = new Stopwatch();
var averageApplyTime = Enumerable.Range(0, 5)
    .Select(i =>
    {
        stopwatch.Restart();
        var _ = applyQueryable.ToList();
        return stopwatch.ElapsedMilliseconds;
    }).Average();

var averageWindowedTime = Enumerable.Range(0, 5)
    .Select(i =>
    {
        stopwatch.Restart();
        var _ = windowedQueryable.ToList();
        return stopwatch.ElapsedMilliseconds;
    }).Average();

var averageWindowedWithExtraWhereTime = Enumerable.Range(0, 5)
    .Select(i =>
    {
        stopwatch.Restart();
        var _ = windowedWithExtraWhereQueryable.ToList();
        return stopwatch.ElapsedMilliseconds;
    }).Average();

Trace.WriteLine($"\n\nAverage Windowed Time: {averageWindowedTime}ms");
Trace.WriteLine($"Average Windowed with extra where Time: {averageWindowedWithExtraWhereTime}ms");
Trace.WriteLine($"Average Apply Time: {averageApplyTime}ms");