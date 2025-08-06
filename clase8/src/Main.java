import io.javalin.Javalin;
import java.util.Map;
public class Main {
    public static void main(String[] args) {
    Javalin app = Javalin.create().start(8080);
    app.get("/suma/{a}/{b}", ctx -> {
        String a = ctx.pathParam("a");
        int aa = Integer.parseInt(a);
        String b = ctx.pathParam("b");
         int bb = Integer.parseInt(b);
        ctx.json(Map.of("resultado",aa+bb));
    });
        app.get("/resta/{a}/{b}", ctx -> {
      String a = ctx.pathParam("a");
        int aa = Integer.parseInt(a);
        String b = ctx.pathParam("b");
         int bb = Integer.parseInt(b);
        ctx.json(Map.of("resultado",aa-bb));
    });
        app.get("/suma/{a}/{b}", ctx -> {
      String a = ctx.pathParam("a");
        int aa = Integer.parseInt(a);
        String b = ctx.pathParam("b");
         int bb = Integer.parseInt(b);
        ctx.json(Map.of("resultado",aa*bb));
    });
    }
}

