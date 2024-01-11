using OfficeOpenXml;
using System.Data;
using System.Diagnostics;
using System.IO.Packaging;
using System.Text;
using System.Windows.Forms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;

namespace BKOrder
{
    public partial class Form1 : Form
    {
        private List<(string, string, string)> excelData = new List<(string, string, string)>();
        private Dictionary<string, string> listBoxMapping = new Dictionary<string, string>();
        private bool[] isFull = new bool[5];
        private int maxRows = 15;
        string excelPath = "C:\\Users\\Chrkar01\\Documents\\GitHub\\godot-excel-reader\\Beställningar 2023.xlsx";
        public Form1() {
            InitializeComponent();
            Debug.WriteLine("Loading project");
            LoadExcelData();
        }

        private void LoadExcelData() {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Excel Files|*.xlsx;*.xls";

            if (openFileDialog.ShowDialog() == DialogResult.OK) {
                string filePath = openFileDialog.FileName;

                using (ExcelPackage package = new ExcelPackage(new FileInfo(filePath))) {
                    ExcelWorksheet worksheet = package.Workbook.Worksheets[0];

                    excelData.Clear(); // Clear the data list

                    for (int rowNum = 2; rowNum <= worksheet.Dimension.End.Row; rowNum++) {
                        string column1 = worksheet.Cells[rowNum, 1].Text;
                        string column2 = worksheet.Cells[rowNum, 2].Text;
                        string column6 = worksheet.Cells[rowNum, 6].Text;

                        excelData.Add((column1, column2, column6));
                    }
                }
            }
        }

        private void btnSearch_Click(object sender, EventArgs e) {
            string searchTerm = textBox1.Text.Trim().ToLower();

            if (string.IsNullOrEmpty(searchTerm)) {
                // If the search term is empty or whitespace, show all items from excelData.
                PopulateListBox(excelData.Select(item => item.Item2).ToList());
            }
            else {
                // Filter excelData based on the search term.
                var filteredItems = excelData
                    .Where(item => item.Item2.ToLower().Contains(searchTerm))
                    .Select(item => item.Item2)
                    .ToList();

                // Populate the ListBox with the filtered items.
                PopulateListBox(filteredItems);
            }
        }


        private void btnAdd_Click(object sender, EventArgs e) {

            /*foreach ((string column1, string column2, string column6) in excelData) {
                Debug.WriteLine($"Column1: {column1}, Column2: {column2}, Column6: {column6}");
            }*/

            string selectedItem = listBox1.SelectedItem as string;

            if (selectedItem != null) {
                var matchingRow = excelData.FirstOrDefault(item => item.Item2 == selectedItem);

                if (matchingRow != default) {
                    Debug.WriteLine($"Column1: {matchingRow.Item1}, Column2: {matchingRow.Item2}, Column6: {matchingRow.Item3}");
                    ListViewItem item = new ListViewItem(matchingRow.Item1);
                    item.SubItems.Add(matchingRow.Item2);
                    listView1.Items.Add(item);

                    return;
                    /*
                    for (int i = 0; i < maxRows; i++)
                    {
                        if (!isFull[i])
                        {
                            switch (i)
                            {
                                case 0:
                                    {
                                        tbRSK1.Text = matchingRow.Item1;
                                        tbBeskrivning1.Text = matchingRow.Item2;
                                        break;
                                    }
                                case 1:
                                    {
                                        tbRSK2.Text = matchingRow.Item1;
                                        tbBeskrivning2.Text = matchingRow.Item2;
                                        break;
                                    }
                                case 2:
                                    {
                                        tbRSK3.Text = matchingRow.Item1;
                                        tbBeskrivning3.Text = matchingRow.Item2;
                                        break;
                                    }
                                case 3:
                                    {
                                        tbRSK4.Text = matchingRow.Item1;
                                        tbBeskrivning4.Text = matchingRow.Item2;
                                        break;
                                    }
                                default:
                                    { break; }

                            }

                            isFull[i] = true;
                            break;
                        }
                        else
                        {
                            Debug.WriteLine("ALL SLOTS ARE FILLED");
                        }
                    } */
                }
            }
        }

        private void PopulateListBox(List<string> items) {
            listBox1.Items.Clear();

            foreach (string item in items) {
                listBox1.Items.Add(item);
            }
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e) {
            Application.Exit();
        }

        private void Form1_Load(object sender, EventArgs e) {

        }

        private void btnRemove_Click(object sender, EventArgs e) {
            if (listView1.Items.Count > 0) {
                try { listView1.Items.Remove(listView1.SelectedItems[0]); }
                catch { MessageBox.Show("Ingen rad vald."); }

            }
        }
    }
}

