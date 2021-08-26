Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD0FC432BE
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 12:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5F83610C9
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 12:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241417AbhHZMbc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Aug 2021 08:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240886AbhHZMbb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Aug 2021 08:31:31 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C92C0613C1
        for <linux-doc@vger.kernel.org>; Thu, 26 Aug 2021 05:30:44 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id w4so4748324ljh.13
        for <linux-doc@vger.kernel.org>; Thu, 26 Aug 2021 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iDycTN9yyDhhTwc3Srtfw/Rl+6JzgcjoQzGWlzOIGrY=;
        b=nlXC4jk7imssziF4BZGKjdqHB/e4Rwx+jmB/xJpnO+gQjFcrnSB9voLWQJ4SVgBZsR
         yStK/gYOR1npSKgWdsOLRVqHr9SjxNrqB3oV+U9xtDrB5Y69puy0TGH2igM3RzqPkfx5
         AkuZR9phcFzVh5FDfJcC3HwtYUz4P7F+AEMVM7tlp3yyWiQjEzSSp+lsQdxB5SUd+HBM
         kCXOpRjX5V3ViBIl91HhYKoLJU+m+uUpq3Vsep8K1JY9rAINAZn2Fyxy/qX5Cc1TbPXa
         dSnKDyB1WRM5n0GLEJUcUBOqReTT4RksS3qMFHyjpkLzl9QUUUu1upn81OhRMba8/8JM
         W17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iDycTN9yyDhhTwc3Srtfw/Rl+6JzgcjoQzGWlzOIGrY=;
        b=C/j3LGMSt81EEOhelgDr/dNgRv5NdsEgZ+Lp2T2rMT5J5gSTuOnjkdnvgsNLslBKrC
         6CdryTPP8aTW8m0+SEDTrFotu5crBgGfNJzYjCEVJhqmPWrnIpcoE66dFXp/lIWE5WxQ
         P0F1mGRxXVKr0/7FPwG+LwcPa6nsAjWjJZ+jdRqsiXVis/WlVjdGw4kKD3xCcOU0r8hx
         23qfOSWrCdYG5rVLgstDaarv/iOxsTq1nAr3RwW3wwMeF7ZjuWozGpXVsfZbUUB9C6/q
         AqcN3hdXdElq7gYctfUCqG0k5Anh2fV8V2ePGyfSzlKE8e37YQngsb6nQ7vo4Rq4oLa+
         i33w==
X-Gm-Message-State: AOAM531sjU5ceP1Igle8LlL0oiTqvSrXcv8qmK5mQQ2u417FdXiP1XLx
        QcktC/rBqTslTPFdYAcQUhkAOw==
X-Google-Smtp-Source: ABdhPJwQarP4Db9P6Gby/P9D9O3LQjajC9XAwpMTb5ACajA13QjU8NsTAlw1UOTlR0tnGBNT0NFpHA==
X-Received: by 2002:a2e:91d0:: with SMTP id u16mr2862869ljg.324.1629981041954;
        Thu, 26 Aug 2021 05:30:41 -0700 (PDT)
Received: from jade.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id j21sm332283ljh.87.2021.08.26.05.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 05:30:41 -0700 (PDT)
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/6] dt-bindings: arm: optee: add interrupt property
Date:   Thu, 26 Aug 2021 14:30:28 +0200
Message-Id: <20210826123032.1732926-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826123032.1732926-1-jens.wiklander@linaro.org>
References: <20210826123032.1732926-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds an optional interrupt property to the optee binding.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 .../devicetree/bindings/arm/firmware/linaro,optee-tz.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
index c24047c1fdd5..40c9f1901e3f 100644
--- a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
+++ b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
@@ -24,6 +24,12 @@ properties:
   compatible:
     const: linaro,optee-tz
 
+  interrupts:
+    maxItems: 1
+    description: |
+      This interrupt which is used to signal an event by the secure world
+      software is expected to be edge-triggered.
+
   method:
     enum: [smc, hvc]
     description: |
@@ -46,6 +52,7 @@ examples:
         optee  {
             compatible = "linaro,optee-tz";
             method = "smc";
+            interrupts = <0 187 1>;
         };
     };
 
-- 
2.31.1

