Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A8CC433F5
	for <linux-doc@archiver.kernel.org>; Wed,  6 Oct 2021 07:16:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B8C361212
	for <linux-doc@archiver.kernel.org>; Wed,  6 Oct 2021 07:16:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237422AbhJFHRx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Oct 2021 03:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237406AbhJFHRw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Oct 2021 03:17:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C89EC061749
        for <linux-doc@vger.kernel.org>; Wed,  6 Oct 2021 00:16:00 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u18so6228091lfd.12
        for <linux-doc@vger.kernel.org>; Wed, 06 Oct 2021 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iDycTN9yyDhhTwc3Srtfw/Rl+6JzgcjoQzGWlzOIGrY=;
        b=bL1vK0bJe9SYQdKHyy1dKB/mgq4Vvtr/CNZxPI/FnxsiDCl6Gxi+KPn3wk3CCXnX+i
         NNSZfXWkPFTeO43dCyDC5SKXojhCaUh6YCrXhbFyLoUDuc+PzPJFrqctTJmg4g2tTVSq
         sFXIZPcGmz6lEL4zwQqODImBDS90l6u5lj/lzqKa3mKgjNW/RZ1oEuPw6hHGtmuBsFZv
         MldsDpoMFwz2kDKAVvtXt3aZclN1NIpuP3D4BMSz+7XF0uY7LTe9NMfkPy4/Y25YFRPJ
         ieYI+zXAePfidQ5EKr9WP09uovQWWxTHnlUrCsXQMa0u2H3tbOpDTuFxawz0hjApOYiD
         wFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iDycTN9yyDhhTwc3Srtfw/Rl+6JzgcjoQzGWlzOIGrY=;
        b=g8MqJrdRxckfCC/8rftfN0cxLH6hnLABrWqKqQuby421t9v7xfB0gfKX/3uQZmdC1L
         EFGocjbFCxqYs+pws6MxgKtjsW/yHPgt5P2pCbRwupMshWe8jHieUdGPEtQy3/ZvbkSB
         gEUjcRkWGTCrZlz6KTYjJ4Wvjz+uEwsgo15JQnziIndDJhfiZfbOYmqR9Bsm6dzGGioH
         NanoYYW/wFOIAccaYN6lDWmsDgciw9Hf9j3oNUQQaxMhauHJQa1JZmGWJj2peJZMq92k
         csNOOLQH1z7eqyK006/U7tE2hGZF0j4gW/Xo4hiKG155wIXzQQyAiIH2KQsD1GvG3jNA
         Vp3Q==
X-Gm-Message-State: AOAM530Zemj9FscO3qysemFw54qaBi57wK/zQ1PF5LA5NWsgwv99qsq/
        i7hITUti7U7/fgFfKxGXjMBxsw==
X-Google-Smtp-Source: ABdhPJzpzB5JRrdp7tnCsR2cXo+ygIAaSy54kKxlbtwQNa7gbPL0/HRWBJ+pQt3QCVmLyTCywx1+0w==
X-Received: by 2002:a2e:8843:: with SMTP id z3mr18431449ljj.457.1633504558653;
        Wed, 06 Oct 2021 00:15:58 -0700 (PDT)
Received: from jade.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y7sm960376lfk.143.2021.10.06.00.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 00:15:58 -0700 (PDT)
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
Subject: [PATCH v6 2/6] dt-bindings: arm: optee: add interrupt property
Date:   Wed,  6 Oct 2021 09:15:42 +0200
Message-Id: <20211006071546.2540920-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006071546.2540920-1-jens.wiklander@linaro.org>
References: <20211006071546.2540920-1-jens.wiklander@linaro.org>
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

