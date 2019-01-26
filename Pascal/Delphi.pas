uses Classes, RegExpr;

var
    _word: String;
    wlen: Integer;
    maxlen: Integer = 0;
    invalid: TRegExpr;
    words: TStringList;
    longest: TStringList;

begin
    invalid := TRegExpr.Create('(?i).*[gkmqvwxzio].*');
    longest := TStringList.Create;
    words := TStringList.Create;
    words.LoadFromFile('words.txt');

    for _word in words do begin
        wlen := Length(_word);
        if (wlen = maxlen) and not invalid.Exec(_word) then begin
            longest.Append(_word);
        end else if (wlen > maxlen) and not invalid.Exec(_word) then begin
            longest.Clear();
            longest.Append(_word);
            maxlen := wlen;
        end;
    end;

    Write(longest.Text);
    longest.Free;
end.

