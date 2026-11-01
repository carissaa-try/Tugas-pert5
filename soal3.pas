program UrutNilaiUAS;

var
  nilai : array[1..10] of real;
  n, i, j : integer;

begin
  //Input jumlah mahasiswa, ulangi sampai 1 <= n <= 10 
  repeat
    write('Masukkan jumlah mahasiswa (1-10): ');
    readln(n);
    if (n < 1) or (n > 10) then
      writeln('Jumlah harus antara 1 sampai 10!');
  until (n >= 1) and (n <= 10);

  //Input nilai UAS 
  for i := 1 to n do
  begin
    write('Masukkan nilai UAS mahasiswa ke-', i, ': ');
    readln(nilai[i]);
  end;

  //Bubble sort: terendah ke tertinggi
  for i := 1 to n - 1 do
    for j := 1 to n - i do
      if nilai[j] > nilai[j + 1] then
      begin
        nilai[j]     := nilai[j] + nilai[j + 1];
        nilai[j + 1] := nilai[j] - nilai[j + 1];
        nilai[j]     := nilai[j] - nilai[j + 1];
      end;

  //Tampilkan hasil 
  writeln;
  writeln('Nilai UAS terurut (terendah ke tertinggi):');
  for i := 1 to n do
    writeln(i, '. ', nilai[i]:0:2);

  readln;
end.