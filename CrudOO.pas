type
  TCliente = class
    Nome: string;
  end;

procedure CrudOO;
var
  Clientes: TObjectList<TCliente>;
  Opcao, Idx: Integer;
  Nome: string;
begin
  Clientes := TObjectList<TCliente>.Create;
  try
    repeat
      Opcao := StrToInt(InputBox('Menu', '1-Adicionar'#13'2-Listar'#13'3-Editar'#13'4-Remover'#13'0-Sair', '0'));
      case Opcao of
        1:
          begin
            Nome := InputBox('Adicionar', 'Nome do Cliente:', '');
            Clientes.Add(TCliente.Create);
            Clientes.Last.Nome := Nome;
          end;
        2:
          for Idx := 0 to Clientes.Count - 1 do
            ShowMessage(IntToStr(Idx) + ' - ' + Clientes[Idx].Nome);
        3:
          begin
            Idx := StrToInt(InputBox('Editar', 'Índice:', ''));
            if (Idx >= 0) and (Idx < Clientes.Count) then
              Clientes[Idx].Nome := InputBox('Editar', 'Novo Nome:', Clientes[Idx].Nome);
          end;
        4:
          begin
            Idx := StrToInt(InputBox('Remover', 'Índice:', ''));
            if (Idx >= 0) and (Idx < Clientes.Count) then
              Clientes.Delete(Idx);
          end;
      end;
    until Opcao = 0;
  finally
    Clientes.Free;
  end;
end;
