program KelulusanMahasiswa;

var
  nilai : array[1..5, 1..4] of real;  //kolom: 1=tugas, 2=kuis, 3=UTS, 4=UAS 
  rata  : array[1..5] of real;
  lulus : array[1..5] of boolean;
  n, i, j : integer;
  total : real;
  ket : string;

begin
  //Input jumlah mahasiswa, ulangi sampai 1 <= n <= 5 
  repeat
    write('Masukkan jumlah mahasiswa (1-5): ');
    readln(n);
    if (n < 1) or (n > 5) then
      writeln('Jumlah harus antara 1 sampai 5!');
  until (n >= 1) and (n <= 5);

  //Input nilai tiap mahasiswa 
  for i := 1 to n do
  begin
    writeln;
    writeln('Mahasiswa ke-', i);
    for j := 1 to 4 do
    begin
      case j of
        1: write('  Nilai tugas : ');
        2: write('  Nilai kuis  : ');
        3: write('  Nilai UTS   : ');
        4: write('  Nilai UAS   : ');
      end;
      readln(nilai[i, j]);
    end;
  end;

  //Hitung rata-rata dan tentukan kelulusan 
  for i := 1 to n do
  begin
    total := 0;
    for j := 1 to 4 do
      total := total + nilai[i, j];
    rata[i] := total / 4;
    lulus[i] := rata[i] >= 70;
  end;

  //Tampilkan output 
  writeln;
  writeln('=========== HASIL ===========');
  for i := 1 to n do
  begin
    writeln('Mahasiswa ke-', i);
    writeln('  Tugas     : ', nilai[i, 1]:0:2);
    writeln('  Kuis      : ', nilai[i, 2]:0:2);
    writeln('  UTS       : ', nilai[i, 3]:0:2);
    writeln('  UAS       : ', nilai[i, 4]:0:2);
    writeln('  Rata-rata : ', rata[i]:0:2);
    if lulus[i] then
      ket := 'LULUS'
    else
      ket := 'TIDAK LULUS';
    writeln('  Keterangan: ', ket);
    writeln;
  end;

  readln;
end.