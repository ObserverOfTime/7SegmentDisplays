uses RegExpr;

var
    wfile: Text;
    _word: String;
    wlen: Integer;
    maxlen: Integer = 0;
    invalid: TRegExpr;
    longest: Array of String = NIL;

begin
    invalid := TRegExpr.Create('(?i).*[gkmqvwxzio].*');
    Assign(wfile, 'words.txt');
    Reset(wfile);

    while not EOF(wfile) do begin
        ReadLn(wfile, _word);
        wlen := Length(_word);
        if (wlen = maxlen) and not invalid.Exec(_word) then begin
            SetLength(longest, Length(longest) + 1);
            longest[High(longest)] := _word;
        end else if (wlen > maxlen) and not invalid.Exec(_word) then begin
            SetLength(longest, 1);
            longest[0] := _word;
            maxlen := wlen;
        end;
    end;

    for _word in longest do WriteLn(_word);
end.

