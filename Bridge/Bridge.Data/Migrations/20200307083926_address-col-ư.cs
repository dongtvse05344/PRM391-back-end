using Microsoft.EntityFrameworkCore.Migrations;

namespace Bridge.Data.Migrations
{
    public partial class addresscolư : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserAddresses_AspNetUsers_BuyerId",
                table: "UserAddresses");

            migrationBuilder.DropIndex(
                name: "IX_UserAddresses_BuyerId",
                table: "UserAddresses");

            migrationBuilder.DropColumn(
                name: "BuyerId",
                table: "UserAddresses");

            migrationBuilder.AlterColumn<string>(
                name: "UserId",
                table: "UserAddresses",
                nullable: true,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserAddresses_UserId",
                table: "UserAddresses",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserAddresses_AspNetUsers_UserId",
                table: "UserAddresses",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserAddresses_AspNetUsers_UserId",
                table: "UserAddresses");

            migrationBuilder.DropIndex(
                name: "IX_UserAddresses_UserId",
                table: "UserAddresses");

            migrationBuilder.AlterColumn<string>(
                name: "UserId",
                table: "UserAddresses",
                nullable: true,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "BuyerId",
                table: "UserAddresses",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserAddresses_BuyerId",
                table: "UserAddresses",
                column: "BuyerId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserAddresses_AspNetUsers_BuyerId",
                table: "UserAddresses",
                column: "BuyerId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
