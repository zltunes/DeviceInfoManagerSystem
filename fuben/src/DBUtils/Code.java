package DBUtils;

public class Code {
    public Code() {
    }
    public String codeString(String s){
        String str=s;
        if(str == null){
            str = "";
        }
        try{
            byte b[]=str.getBytes("ISO-8859-1");
            str=new String(b);
            return str;
        }
        catch(Exception e){
            return str;
        }
    }
    public static void main(String[] args) {
        Code code = new Code();
    }
}
