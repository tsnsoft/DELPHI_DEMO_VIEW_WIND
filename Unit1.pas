unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, shellapi, ExtCtrls, XPMan;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    XPManifest1: TXPManifest;
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    t1,t2: string;
    l1,l2: Longint;
  public
    { Public declarations }
  end;

const mark1 = ' -> ';
var
  Form1: TForm1;

implementation

{$R *.dfm}

function GetWText(h: HWND): string; { Получение текста в окне }
var i: longword; s: string;
begin
  i:=GetWindowTextLength(h)+1; SetLength(s, i);
   GetWindowText(h,pchar(s),i); SetLength(s, i-1);  GetWText:=s;
end;

function GetClass(h: HWND): string; { Получение класса окна }
var i: longword; s: string;
begin
   i:=255; SetLength(s, i);
   i:=GetClassName(h,pchar(s),i); SetLength(s, i);  GetClass:=s;
end;

procedure TForm1.Button1Click(Sender: TObject);
var s,ss: string; h: HWND; i, k: longword;
begin
  { Запоминание выбранной строки ListBox1 }
   ss:='';
   if listbox1.ItemIndex>=0 then begin
      ss:=listbox1.Items[listbox1.ItemIndex];
     delete(ss,1, pos(') ',ss)+1);
   end;

   { Регенерация изображения ListBox1 }
   listbox1.Enabled:=false;
   listbox1.Sorted:=CheckBox1.Checked;
   listbox1.Enabled:=true;


   { Движняк }
   h:=FindWindow(nil, nil); listbox1.Clear; k:=1;

   if not listbox1.Sorted then begin
     while (h<>0) do begin
       if (CheckBox2.Checked and IsWindowVisible(h)) or
          (not CheckBox2.Checked) then begin
             s:=inttostr(k)+') '+GetClass(h)+mark1+GetWText(h);
             listbox1.Items.Add(s); inc(k);
       end; h:=GetWindow(h,GW_HWNDNEXT);
     end;
   end;

   if listbox1.Sorted then begin
       while (h<>0) do begin
         if (CheckBox2.Checked and IsWindowVisible(h)) or
            (not CheckBox2.Checked) then begin
             s:=GetClass(h)+mark1+GetWText(h); listbox1.Items.Add(s);
         end; h:=GetWindow(h,GW_HWNDNEXT);
       end;
       for i:=0 to listbox1.Items.Count-1 do begin
         listbox1.Items[i]:=inttostr(k)+') '+listbox1.Items[i]; inc(k);
       end;
   end;

   { Восстановление предыдущей позиции ListBox1 }
   if ss<>'' then begin
      for i:=0 to listbox1.Items.Count-1 do begin
        s:=listbox1.Items[i]; delete(s,1, pos(') ',s)+1);
        if ss=s then begin listbox1.ItemIndex:=i; break; end;
     end;
   end;

   try if listbox1.ItemIndex<0 then begin
     listbox1.ItemIndex:=0; ListBox1Click(nil); end; except end;

   try ListBox1Click(nil); except end;

end;

procedure TForm1.ListBox1Click(Sender: TObject);
var i,k: integer; s,ss: string; h: HWND;
begin
try
   { Поиск чилдренов для выбранного окна }
   s:=listbox1.Items[listbox1.itemindex];
   if s<>'' then begin
     listbox2.Clear; delete(s,1, pos(') ',s)+1);  k:=pos(mark1,s);
     ss:=copy(s,k+4,length(s)-k+6); s:=copy(s,1,k-1); i:=1;
     h:=FindWindow(pchar(s),pchar(ss)); h:=GetWindow(h,GW_CHILD);
     while h<>0 do begin
       ss:=inttostr(i)+') '+GetClass(h)+mark1+GetWText(h);
      listbox2.Items.Add(ss); inc(i);
      h:=GetWindow(h,GW_HWNDNEXT);
    end;
  end;
except
  listbox2.Clear;
end;
end;

end.
