DESC PF0645.CEP;

SELECT * FROM PF0645.CEP;

--Exercicio 

/*utilizando a tabela pf0645.cep, construa um programa que receba o cep e retorne o nome do logradouro, o complemento,  bairro, cidade e o uf*/

/*nome do programa: consulta CEP*/

SET SERVEROUT ON

DECLARE

    V_CEP PF0645.CEP.CEP%TYPE:= 01243912;
    REG_CEP PF0645.CEP%ROWTYPE;
    
BEGIN 
    SELECT *
    INTO REG_CEP
    FROM PF0645.CEP
    WHERE CEP = V_CEP;
    
    DBMS_OUTPUT.PUT_LINE(REG_CEP.CEP||CHR(10)||
                        REG_CEP.LOGRADOURO||CHR(10)||
                        REG_CEP.COMPLEMENTO||CHR(10)||
                        REG_CEP.BAIRRO||CHR(10)||
                        REG_CEP.UF);
                        

EXCEPTION
WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('CEP NÂO EXISTE');
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('CEP DUPLICADO');
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERRO');

END;
/

    
END;

/