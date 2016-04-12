/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifsul.util;

/**
 *
 * @author Vini
 */
public class Util {

    public static String getMensagemErro(Exception e) {

        while (e.getCause() != null) {
            e = (Exception) e.getCause();
        }
        String retorno = e.getMessage();
        if (retorno.contains("foreign key") || retorno.contains(" chave estrangeira")) {
            retorno = "Registro contem ligação com outra tabela no banco de dados ";

        }
        return retorno;
    }
}
