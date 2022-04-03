Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB56C433F5
	for <linux-doc@archiver.kernel.org>; Sun,  3 Apr 2022 08:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355580AbiDCIUy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 3 Apr 2022 04:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355545AbiDCIUw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Apr 2022 04:20:52 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878B817045
        for <linux-doc@vger.kernel.org>; Sun,  3 Apr 2022 01:18:58 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b24so7581280edu.10
        for <linux-doc@vger.kernel.org>; Sun, 03 Apr 2022 01:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zjIw75ZQdp7MJvbRG37XmPoOfYXyjdA6z7hzyGD4X7U=;
        b=ePbICS4Nle9krQ+1Rw4HQyX79qmYd5Y221gZjaVTJvdlNHPktyvE5Gi4Mt8eA/NfPK
         2MPL4t97PWBF1uhGusHLmw7YAgcT10uZwLbyqVS73Eyed2AB7t0JEXXDuEwG2Y2pfcum
         pPZJ8sjztYp5rVW8Inf30lNYjFpfqerZdWnIMb3nofUj90nC+Q5Gbpj3Apsclfbgqs3S
         RiV5zf8d4mNffHjjz4uZHNGCruemhNoEjqFItbmlrtYCrDASHsNIWcRhD9xEp3Tp98yV
         AE5+OmVi1+3CDwmJGentyBNpHKMkLR7FXFFYIFs3ulQE26eCSObSecW7ynV9/A+FgMQZ
         uUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zjIw75ZQdp7MJvbRG37XmPoOfYXyjdA6z7hzyGD4X7U=;
        b=3mgO64/6Nes612yXiVutczqezerrsIGAkRG3YDzmi+ea5lR8OM5/oj620LMCIaeDMR
         uFAECakgR1hq5l290+nSPqT0g5ol2bWgIJPoj4Y4RB0YcAvdFoZoD0ZGEg/pRYGqNOnw
         LJb3tiptQZyU2SOjzg5YvC//7Se9IntvVEifJxkjg1ws8NU0o+7VpuVJNRKftQ98yOkh
         hyFwbngZAFYCJiQCBOZ8Zrs6VIF+05J3oc8pc0f48GNZn/tbIOB1/phLFoq+4XOw0Sd0
         5havJVX57EXtyCarwFo+NGUI0CFnxVNOguP+vNtiVkQx81pDEDyXvStzzTyC62UwtKzz
         UG2Q==
X-Gm-Message-State: AOAM5338NZvXSP2lKFi8UDY4D1V3YCZ8ai/IEF4Kzy/jQ2l0zwxg1SbA
        ucFasZnrO9zqeXj+oHvacuaBzQ==
X-Google-Smtp-Source: ABdhPJyUcj/hNd1jzIjhAS8rb3fkZUbOOSwJm17iYVjG9Wltzxe6juoL3P9jZSILUNIiF8zkB5tYuQ==
X-Received: by 2002:a05:6402:3496:b0:419:82d5:f1d9 with SMTP id v22-20020a056402349600b0041982d5f1d9mr28246795edc.36.1648973933569;
        Sun, 03 Apr 2022 01:18:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709066d8700b006d4b4d137fbsm2989105ejt.50.2022.04.03.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 01:18:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] docs: dt: writing-schema: mention coding style
Date:   Sun,  3 Apr 2022 10:18:49 +0200
Message-Id: <20220403081849.8051-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220403081849.8051-1-krzysztof.kozlowski@linaro.org>
References: <20220403081849.8051-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mention the usage of YAML coding style.  Describe explicitly that
four-space indentation in DTS examples is preferred, because:
1. The YAML's default two-space indentation for DTS code makes it
   significantly less readable.
2. Linux coding style tabs would introduce inconsistency (entire file is
   indented with spaces).
3. On the other hand, eight spaces would not align with example's
   opening '  - |' part.  Four spaces makes the code nicely aligned with
   it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/example-schema.yaml        | 14 +++++++-------
 .../devicetree/bindings/writing-schema.rst         |  6 ++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index 80a28781845d..8e1a8b19d429 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -249,13 +249,13 @@ examples:
   # be overridden or an appropriate parent bus node should be shown (such as on
   # i2c buses).
   #
-  # Any includes used have to be explicitly included.
+  # Any includes used have to be explicitly included. Use 4-space indentation.
   - |
     node@1000 {
-          compatible = "vendor,soc4-ip", "vendor,soc1-ip";
-          reg = <0x1000 0x80>,
-                <0x3000 0x80>;
-          reg-names = "core", "aux";
-          interrupts = <10>;
-          interrupt-controller;
+        compatible = "vendor,soc4-ip", "vendor,soc1-ip";
+        reg = <0x1000 0x80>,
+              <0x3000 0x80>;
+        reg-names = "core", "aux";
+        interrupts = <10>;
+        interrupt-controller;
     };
diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
index 95ecf55559e5..2916edf829db 100644
--- a/Documentation/devicetree/bindings/writing-schema.rst
+++ b/Documentation/devicetree/bindings/writing-schema.rst
@@ -108,6 +108,12 @@ The YAML Devicetree format also makes all string values an array and scalar
 values a matrix (in order to define groupings) even when only a single value
 is present. Single entries in schemas are fixed up to match this encoding.
 
+Coding style
+------------
+
+Use YAML coding style (two-space indentation). For DTS examples in the schema,
+preferred is four-space indentation.
+
 Testing
 -------
 
-- 
2.32.0

