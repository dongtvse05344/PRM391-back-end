using Microsoft.EntityFrameworkCore.Migrations;

namespace Bridge.Data.Migrations
{
    public partial class huy2008201 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "GenderId",
                table: "Products");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<long>(
                name: "GenderId",
                table: "Products",
                nullable: false,
                defaultValue: 0L);
        }
    }
}
