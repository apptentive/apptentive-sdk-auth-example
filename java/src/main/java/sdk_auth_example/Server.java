package sdk_auth_example;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Date;

import static spark.Spark.post;

public class Server {
    private static final int daysToExpiry = 3;

    public static void main(String[] args) throws UnsupportedEncodingException {
        Algorithm algorithmHS = Algorithm.HMAC512("jwt_signing_secret_from_apptentive");

        post("/:userId/authenticate", (req, res) -> {
            if (isValidUserLogin(req.queryParams("username"), req.queryParams("password"))) {
                LocalDateTime issuedAtLocal = LocalDateTime.now();
                Date issuedAt = Date.from(issuedAtLocal.toInstant(ZoneOffset.UTC));
                Date expireAt = Date.from(issuedAtLocal.plusDays(daysToExpiry).toInstant(ZoneOffset.UTC));
                String token = JWT.create()
                    .withIssuedAt(issuedAt)
                    .withExpiresAt(expireAt)
                    .withSubject("unique_user_token")
                    .sign(algorithmHS);

                res.type("application/json");
                res.status(200);
                return "{ \"token\": \"" + token + "\" }";
            } else {
                res.type("application/json");
                res.status(401);
                return "{ \"error\": \"User not authorized.\" }";
            }
        });
    }

    private static boolean isValidUserLogin(String username, String password) {
        return password.equals("password");
    }
}
