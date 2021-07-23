Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5384CC43214
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 09:44:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4038960F02
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 09:44:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhGWJEF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 05:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbhGWJEC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 05:04:02 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9FAC0613D5
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 02:44:34 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l4so987654ljq.4
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a/bqTZzKIHdxC3kmt2eWiFK7QCi70Duu4Zv6wBW6jAs=;
        b=Wre17vH1r/X0eGI3ub3IhX+LY6NyisVfyC8qRkjVRtDIdjQvxGDzjODeaerxk018+e
         Jfkow/wywwMiwtR50JxRHzx8KNDPZalnSiP9ajJ0JcovcE4OiPkWhN5ndwtv70X7ujwj
         +YegKy2IBiarSxeg/3uddwJojhDNatwolFX97w+o/E+rwXmdmh3OziNRbqT9aYJ5TbPx
         UnT9Pccv9Wey/vrGVhr5CJqDfHB4hkDuLfrx5jYv0Idz0c+bXSaMVy9AhNiNIuF1VTAw
         IRvKn4lx/lZV4F+dK4B87RFYmNeVVg8Ao3FrnwV1IVc+gmR7Oj3kKIcHADe6eC6LmRKY
         Yprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a/bqTZzKIHdxC3kmt2eWiFK7QCi70Duu4Zv6wBW6jAs=;
        b=QQAyUUzj15S2lilolZ8NqbdrP8p7vngW1F6X2ClW2bEjGD9ns9YlBYEUnACjCas7Xh
         b2viU6drlRPY/Cm7RZFpE7HbQrYLJNpSyi3siW5T5rItdXeQpRF3rUQ0oXtReOTKytli
         blzqHj9Iw7Vfntel+5oP0tMI7Awpv2+50AlWQ3N2AKWHNm8auJSzqn6/+/lVazAWctuT
         pFPOTBjvjwfXxcE7x8juheMvw4vD6qCc4W04Pm8BTXpLfghKRjPZCkhVZr0uiXsQnsuw
         A4msov14HO7YKanvsxTs5tC/RxF9F5tETO2IzMTdlmzsxuNvoUzrsTC+diBzJ9fXwKB4
         y1jw==
X-Gm-Message-State: AOAM53167Ro5TdJoFQDWybFtTV6gchaZkXadzbPf7fpfYO9rEhuP2Vkq
        dqbCfYY8Se8y0y4ArE3pIFXhXg==
X-Google-Smtp-Source: ABdhPJwgaayYlGhMH6FoRP7pTpWRDBeBdQZDLPJ2kTl9qmB5jvRR/VWAISr1k4cjc8iHnmB7QeI2eQ==
X-Received: by 2002:a2e:5c86:: with SMTP id q128mr2789959ljb.316.1627033472827;
        Fri, 23 Jul 2021 02:44:32 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id f2sm403808ljq.131.2021.07.23.02.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 02:44:32 -0700 (PDT)
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
        Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v3 2/6] dt-bindings: arm: optee: add interrupt property
Date:   Fri, 23 Jul 2021 11:44:18 +0200
Message-Id: <20210723094422.2150313-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723094422.2150313-1-jens.wiklander@linaro.org>
References: <20210723094422.2150313-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds an optional interrupt property to the optee binding.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 .../devicetree/bindings/arm/firmware/linaro,optee-tz.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
index c24047c1fdd5..73811a5d1714 100644
--- a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
+++ b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
@@ -24,6 +24,9 @@ properties:
   compatible:
     const: linaro,optee-tz
 
+  interrupts:
+    maxItems: 1
+
   method:
     enum: [smc, hvc]
     description: |
@@ -46,6 +49,7 @@ examples:
         optee  {
             compatible = "linaro,optee-tz";
             method = "smc";
+            interrupts = <0 187 4>;
         };
     };
 
-- 
2.31.1

