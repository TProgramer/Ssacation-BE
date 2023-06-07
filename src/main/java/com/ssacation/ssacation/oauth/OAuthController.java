package com.ssacation.ssacation.oauth;

import java.util.HashMap;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/oauth")
public class OAuthController {

  private final OAuthService oAuthService;
  /**
   * 카카오 callback
   * [GET] /oauth/kakao/callback
   */
  @ResponseBody
  @GetMapping("/kakao")
  public ResponseEntity<HashMap<String, Object>> kakaoCallback(@RequestParam String code) {

    System.out.println(code);
    String accessToken = oAuthService.getKakaoAccessToken(code);
    HashMap<String, Object> userInfo = null;

    try {

      userInfo = oAuthService.getUserInfo(accessToken);

    } catch (Throwable e) {
      
      e.printStackTrace();
    }
    return new ResponseEntity<>(userInfo, HttpStatus.OK);
  }
}