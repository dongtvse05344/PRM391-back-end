using Microsoft.EntityFrameworkCore.Migrations;

namespace Bridge.Data.Migrations
{
    public partial class colorcodeswift : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Code",
                table: "Colors");

            migrationBuilder.AddColumn<int>(
                name: "B",
                table: "Colors",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "G",
                table: "Colors",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "O",
                table: "Colors",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "R",
                table: "Colors",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "B",
                table: "Colors");

            migrationBuilder.DropColumn(
                name: "G",
                table: "Colors");

            migrationBuilder.DropColumn(
                name: "O",
                table: "Colors");

            migrationBuilder.DropColumn(
                name: "R",
                table: "Colors");

            migrationBuilder.AddColumn<long>(
                name: "Code",
                table: "Colors",
                nullable: false,
                defaultValue: 0L);
        }
    }
}
