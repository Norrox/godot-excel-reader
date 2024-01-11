namespace BKOrder
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
            components = new System.ComponentModel.Container();
            listBox1 = new ListBox();
            textBox1 = new TextBox();
            btnSearch = new Button();
            btnAdd = new Button();
            menuStrip1 = new MenuStrip();
            fileToolStripMenuItem = new ToolStripMenuItem();
            exitToolStripMenuItem = new ToolStripMenuItem();
            contextMenuStrip1 = new ContextMenuStrip(components);
            bindingSource1 = new BindingSource(components);
            textBox2 = new TextBox();
            cbArbetsplats = new ComboBox();
            label1 = new Label();
            dateTimePicker1 = new DateTimePicker();
            label2 = new Label();
            label3 = new Label();
            textBox203 = new TextBox();
            textBox204 = new TextBox();
            label4 = new Label();
            textBox205 = new TextBox();
            label5 = new Label();
            columnHeader1 = new ColumnHeader();
            columnHeader2 = new ColumnHeader();
            columnHeader3 = new ColumnHeader();
            columnHeader4 = new ColumnHeader();
            columnHeader5 = new ColumnHeader();
            columnHeader6 = new ColumnHeader();
            columnHeader7 = new ColumnHeader();
            columnHeader8 = new ColumnHeader();
            columnHeader9 = new ColumnHeader();
            columnHeader10 = new ColumnHeader();
            columnHeader11 = new ColumnHeader();
            columnHeader12 = new ColumnHeader();
            listView1 = new ListView();
            btnRemove = new Button();
            menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)bindingSource1).BeginInit();
            SuspendLayout();
            // 
            // listBox1
            // 
            listBox1.BackColor = SystemColors.Control;
            listBox1.FormattingEnabled = true;
            listBox1.HorizontalScrollbar = true;
            listBox1.ItemHeight = 15;
            listBox1.Location = new Point(12, 69);
            listBox1.Name = "listBox1";
            listBox1.Size = new Size(202, 349);
            listBox1.TabIndex = 0;
            // 
            // textBox1
            // 
            textBox1.Location = new Point(12, 40);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(143, 23);
            textBox1.TabIndex = 1;
            // 
            // btnSearch
            // 
            btnSearch.Location = new Point(161, 40);
            btnSearch.Name = "btnSearch";
            btnSearch.Size = new Size(53, 23);
            btnSearch.TabIndex = 2;
            btnSearch.Text = "Sök";
            btnSearch.UseVisualStyleBackColor = true;
            btnSearch.Click += btnSearch_Click;
            // 
            // btnAdd
            // 
            btnAdd.Location = new Point(12, 424);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(202, 37);
            btnAdd.TabIndex = 3;
            btnAdd.Text = "Add";
            btnAdd.UseVisualStyleBackColor = true;
            btnAdd.Click += btnAdd_Click;
            // 
            // menuStrip1
            // 
            menuStrip1.Items.AddRange(new ToolStripItem[] { fileToolStripMenuItem });
            menuStrip1.Location = new Point(0, 0);
            menuStrip1.Name = "menuStrip1";
            menuStrip1.Size = new Size(1584, 24);
            menuStrip1.TabIndex = 4;
            menuStrip1.Text = "menuStrip1";
            // 
            // fileToolStripMenuItem
            // 
            fileToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { exitToolStripMenuItem });
            fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            fileToolStripMenuItem.Size = new Size(37, 20);
            fileToolStripMenuItem.Text = "File";
            // 
            // exitToolStripMenuItem
            // 
            exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            exitToolStripMenuItem.Size = new Size(93, 22);
            exitToolStripMenuItem.Text = "Exit";
            exitToolStripMenuItem.Click += exitToolStripMenuItem_Click;
            // 
            // contextMenuStrip1
            // 
            contextMenuStrip1.Name = "contextMenuStrip1";
            contextMenuStrip1.Size = new Size(61, 4);
            // 
            // textBox2
            // 
            textBox2.Location = new Point(236, 85);
            textBox2.Name = "textBox2";
            textBox2.Size = new Size(1076, 23);
            textBox2.TabIndex = 26;
            textBox2.Text = "Rsk Nummer\tBeskrivning\tMängd\tPris\tBelopp\tSlag\tAnsvar\tVerks\tAkt\tObjekt\tProjekt\tMotp";
            // 
            // cbArbetsplats
            // 
            cbArbetsplats.FormattingEnabled = true;
            cbArbetsplats.Items.AddRange(new object[] { "SBF - Fastighetsförvaltningen", "SBF - Centralverkstan", "SBF - Gatuavdelningen", "SBF - Transportavdelningen", "SBF - Vattenverk", "SBF - Reningsverk", "Annat" });
            cbArbetsplats.Location = new Point(342, 29);
            cbArbetsplats.Name = "cbArbetsplats";
            cbArbetsplats.Size = new Size(313, 23);
            cbArbetsplats.TabIndex = 227;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(270, 32);
            label1.Name = "label1";
            label1.Size = new Size(66, 15);
            label1.TabIndex = 228;
            label1.Text = "Arbetsplats";
            // 
            // dateTimePicker1
            // 
            dateTimePicker1.Location = new Point(709, 58);
            dateTimePicker1.Name = "dateTimePicker1";
            dateTimePicker1.Size = new Size(200, 23);
            dateTimePicker1.TabIndex = 229;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(661, 61);
            label2.Name = "label2";
            label2.Size = new Size(43, 15);
            label2.TabIndex = 230;
            label2.Text = "Datum";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(261, 61);
            label3.Name = "label3";
            label3.Size = new Size(75, 15);
            label3.TabIndex = 232;
            label3.Text = "Handläggare";
            // 
            // textBox203
            // 
            textBox203.Location = new Point(342, 58);
            textBox203.Name = "textBox203";
            textBox203.Size = new Size(313, 23);
            textBox203.TabIndex = 233;
            // 
            // textBox204
            // 
            textBox204.Location = new Point(710, 29);
            textBox204.Name = "textBox204";
            textBox204.Size = new Size(338, 23);
            textBox204.TabIndex = 234;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(662, 32);
            label4.Name = "label4";
            label4.Size = new Size(42, 15);
            label4.TabIndex = 235;
            label4.Text = "Annat:";
            // 
            // textBox205
            // 
            textBox205.Location = new Point(753, 694);
            textBox205.Name = "textBox205";
            textBox205.Size = new Size(118, 23);
            textBox205.TabIndex = 236;
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(665, 697);
            label5.Name = "label5";
            label5.Size = new Size(82, 15);
            label5.TabIndex = 237;
            label5.Text = "Summa totalt:";
            // 
            // columnHeader1
            // 
            columnHeader1.Text = "Rsk Nummer";
            columnHeader1.Width = 90;
            // 
            // columnHeader2
            // 
            columnHeader2.Text = "Beskrivning";
            columnHeader2.Width = 200;
            // 
            // columnHeader3
            // 
            columnHeader3.Text = "Mängd";
            // 
            // columnHeader4
            // 
            columnHeader4.Text = "Pris";
            // 
            // columnHeader5
            // 
            columnHeader5.Text = "Belopp";
            // 
            // columnHeader6
            // 
            columnHeader6.Text = "Slag";
            // 
            // columnHeader7
            // 
            columnHeader7.Text = "Ansvar";
            // 
            // columnHeader8
            // 
            columnHeader8.Text = "Verks";
            // 
            // columnHeader9
            // 
            columnHeader9.Text = "Akt";
            // 
            // columnHeader10
            // 
            columnHeader10.Text = "Objekt";
            // 
            // columnHeader11
            // 
            columnHeader11.Text = "Projekt";
            // 
            // columnHeader12
            // 
            columnHeader12.Text = "Motp";
            // 
            // listView1
            // 
            listView1.Columns.AddRange(new ColumnHeader[] { columnHeader1, columnHeader2, columnHeader3, columnHeader4, columnHeader5, columnHeader6, columnHeader7, columnHeader8, columnHeader9, columnHeader10, columnHeader11, columnHeader12 });
            listView1.Location = new Point(236, 114);
            listView1.Name = "listView1";
            listView1.Size = new Size(1076, 460);
            listView1.TabIndex = 238;
            listView1.UseCompatibleStateImageBehavior = false;
            listView1.View = View.Details;
            // 
            // btnRemove
            // 
            btnRemove.Location = new Point(12, 467);
            btnRemove.Name = "btnRemove";
            btnRemove.Size = new Size(202, 37);
            btnRemove.TabIndex = 239;
            btnRemove.Text = "Remove";
            btnRemove.UseVisualStyleBackColor = true;
            btnRemove.Click += btnRemove_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.ControlLight;
            ClientSize = new Size(1584, 761);
            Controls.Add(btnRemove);
            Controls.Add(listView1);
            Controls.Add(label5);
            Controls.Add(textBox205);
            Controls.Add(label4);
            Controls.Add(textBox204);
            Controls.Add(textBox203);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(dateTimePicker1);
            Controls.Add(label1);
            Controls.Add(cbArbetsplats);
            Controls.Add(textBox2);
            Controls.Add(btnAdd);
            Controls.Add(btnSearch);
            Controls.Add(textBox1);
            Controls.Add(listBox1);
            Controls.Add(menuStrip1);
            MainMenuStrip = menuStrip1;
            Name = "Form1";
            Text = "CF Digital AB - Ordersoft";
            Load += Form1_Load;
            menuStrip1.ResumeLayout(false);
            menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)bindingSource1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private ListBox listBox1;
        private TextBox textBox1;
        private Button btnSearch;
        private Button btnAdd;
        private MenuStrip menuStrip1;
        private ToolStripMenuItem fileToolStripMenuItem;
        private ToolStripMenuItem exitToolStripMenuItem;
        private ContextMenuStrip contextMenuStrip1;
        private BindingSource bindingSource1;
        private TextBox textBox2;
        private ComboBox cbArbetsplats;
        private Label label1;
        private DateTimePicker dateTimePicker1;
        private Label label2;
        private Label label3;
        private TextBox textBox203;
        private TextBox textBox204;
        private Label label4;
        private TextBox textBox205;
        private Label label5;
        private ColumnHeader columnHeader1;
        private ColumnHeader columnHeader2;
        private ColumnHeader columnHeader3;
        private ColumnHeader columnHeader4;
        private ColumnHeader columnHeader5;
        private ColumnHeader columnHeader6;
        private ColumnHeader columnHeader7;
        private ColumnHeader columnHeader8;
        private ColumnHeader columnHeader9;
        private ColumnHeader columnHeader10;
        private ColumnHeader columnHeader11;
        private ColumnHeader columnHeader12;
        private ListView listView1;
        private Button btnRemove;
    }
}