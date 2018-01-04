/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 *
 * @author zappi
 */
public class Encrypt {

    public Encrypt() {
    }

    public byte[] encode(int id) {
        byte[] token = Integer.toString(id).getBytes(StandardCharsets.ISO_8859_1);
        return token;
    }

    public int decode(String token) {
        byte[] decode = Base64.getDecoder().decode(token);
        return Integer.parseInt(new String(decode, StandardCharsets.ISO_8859_1));
    }

}
