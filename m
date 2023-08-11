Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F51C0015E
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 11:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234385AbjHKLKh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 07:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjHKLKh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 07:10:37 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EA112B
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 04:10:36 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c1d03e124so247198566b.2
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1691752235; x=1692357035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2yEmCh/4b+BWU9qDJvKWWcz5lhDGo7JYaO71Xt3Zntc=;
        b=rg3CpeIsizpP9cBrlygwF2tUMFYSdrRv01Bg7USlIfM5InOzVVsRFV/3k/6fh0w0Ux
         Z2V2LSMPKfKnoWARS8WDruUN8/YbaU0/hf0oKTnskaVhRb32QBflqXo+inHhCuG6GTcd
         y34/f/DdkuRSSJkUdYGRD2XaWBBOCIEQb1WR0r7qaC+3BLbZju9THJ/H3rccNBvLEVDA
         sRUhjUrex8Jfh3Pw6DfSgjSdHe7FooS16yIl5iVUv6TbpVJZejZIlFJ1GS25grrER9Qc
         h9Di7j2MovGQz/oaBCqUI8TI5Y0kLxUmmJSpnGBWaI0Lq5dH9QjdK72/qu0cTvKnkZ1n
         Pyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691752235; x=1692357035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yEmCh/4b+BWU9qDJvKWWcz5lhDGo7JYaO71Xt3Zntc=;
        b=XsUdltUkKjl7bjjsi13DfMCzOWebvSKFjnRtG+9uc9Z0jbutYq66eizdmmU0Ss3U3b
         rAzpHnmcrOL93gvAgyhW11BtvjJ+BIfjz4A+iY12uLvAi2M429J7Rdb4ZxZkMSOnoFTh
         JUVK+btYf5At+/tExOqXYPcQZOWNXmexZhr31iCShVA847vB9snb3Ercj5X6KpL+lR8i
         1kxZDgefljBohRXaGwDYveHX2yv9Xaub++gmbnjWq4eDQ6GNwvgILA1lga5J8S4lEh9M
         HIgvi+izgCaW3SUtjEObbqZFjB96bDxRr3/8sMYRlZ0UYZ69I1eImaaUPGGWjGknAiEO
         BuvA==
X-Gm-Message-State: AOJu0Yys82wK4/oy4eZDZ6r4sIy+3AScSnUHHSNQnwjCGQz+P246znw1
        9KNva+mgFsc+niY/0rbPbMV9Umb3hwpcr5goi9A=
X-Google-Smtp-Source: AGHT+IGOQB3GS+GbS6NxtqEmWT4mAjfyb2PiaIhDxlWAEMe0UmEc4sr4429o9g1VTydUfdkgXRm3GA==
X-Received: by 2002:a17:906:cc4f:b0:99b:cb7a:c164 with SMTP id mm15-20020a170906cc4f00b0099bcb7ac164mr1321450ejb.62.1691752234917;
        Fri, 11 Aug 2023 04:10:34 -0700 (PDT)
Received: from fedora.. ([188.252.220.253])
        by smtp.googlemail.com with ESMTPSA id gg15-20020a170906e28f00b00982b204678fsm2103206ejb.207.2023.08.11.04.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 04:10:34 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        corbet@lwn.net, netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH net-next v2 1/2] dt-bindings: net: ethernet-controller: add PSGMII mode
Date:   Fri, 11 Aug 2023 13:10:06 +0200
Message-ID: <20230811111032.231308-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new PSGMII mode which is similar to QSGMII with the difference being
that it combines 5 SGMII lines into a single link compared to 4 on QSGMII.

It is commonly used by Qualcomm on their QCA807x PHY series.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/ethernet-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 6b0d359367da..9f6a5ccbcefe 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -66,6 +66,7 @@ properties:
       - mii
       - gmii
       - sgmii
+      - psgmii
       - qsgmii
       - qusgmii
       - tbi
-- 
2.41.0

