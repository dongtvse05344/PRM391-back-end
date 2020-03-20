using Bridge.Util;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Text;
using System.Threading.Tasks;

namespace Bridge.Service
{
    public interface IFileService
    {
        void CreateFolder(string folderName);
        string GenerateFileName(string fileName); // Random filename de khong trung
        string GetFileNameWithoutPrevious(string fileName); //Cat phan random de lay file ra
        Task<string> SaveFile(string pathFolder, IFormFile file);
        void ZipFiles(string pathFolder, string pathDestination, string fileName);
        Task<FileSupport> GetFileAsync(string pathFile);
        void DeleteFile(string pathFile);
    }

    public class FileService : IFileService
    {
        private const char CUT = '~';
        public void CreateFolder(string pathFolder)
        {
            System.IO.Directory.CreateDirectory(pathFolder);
        }

        public void DeleteFile(string pathFile)
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), pathFile);
            if (File.Exists(path))
            {
                File.Delete(path);
            }
        }

        public string GenerateFileName(string fileName)
        {
            string result = new Random().Next(0, Int32.MaxValue) + DateTime.Now.ToString("dMyyyyhmmss") + CUT + fileName;
            return result;
        }

        public string GetFileNameWithoutPrevious(string fileName)
        {
            string result = fileName.Split(CUT)[fileName.Split(CUT).Length - 1];
            return result;
        }

        public async Task<FileSupport> GetFileAsync(string pathFile)
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), pathFile);
            var memory = new MemoryStream();
            using (var stream = new FileStream(path, FileMode.Open))
            {
                await stream.CopyToAsync(memory);
            }
            memory.Position = 0;
            return new FileSupport
            {
                Stream = memory,
                FileName = GetFileNameWithoutPrevious(Path.GetFileName(pathFile)),
                ContentType = FileUtils.GetContentType(path)
            };
        }



        public async Task<string> SaveFile(string pathFolder, IFormFile file)
        {
            string filename = GenerateFileName(file.FileName);
            string path = Path.Combine(Directory.GetCurrentDirectory(),
                               pathFolder, filename);
            try
            {
                using (var bits = new FileStream(path, FileMode.Create))
                {
                    await file.CopyToAsync(bits);
                }
                return Path.Combine(pathFolder, filename);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public void ZipFiles(string pathFolder, string pathDestination, string fileName)
        {
            ZipFile.CreateFromDirectory(pathFolder, pathDestination + @"\" + fileName);
        }
    }
}
