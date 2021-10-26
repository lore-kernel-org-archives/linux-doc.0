Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88279C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 08:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F3EA610E5
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 08:31:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbhJZIeO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 04:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234357AbhJZIeL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 04:34:11 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49C4C061348
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 01:31:47 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j2so2621113lfg.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 01:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lebGj46PReB/jYqLYTRNyATlJPGl1b++aN+0TzzN0dU=;
        b=HFPDaIe0FSG17SlNbr/XfHi9GbovkltsDSLf/2tcws62seD3SVo+eC3jN6MU8lPVPG
         f8d6POp/E1Qbl6st6hEi7KjHt2xmj/eUUDtUKfBcKyPUnTrz+iB4E0/TA1IkgmUYXFuJ
         E2OMt7K1YAar99LNiZpgnPxtHw5sF00tUSf7wdmpNCvbEOiWWSGKo6TcMUADiB3ra0KT
         EhXEVJZogDb7WieJB5yI+KHM9M+iQiToeMj1X36/Ax7LWb24NoSd2ThX5aaAJAi0/Nva
         VTfpS/AEjbwTOSG3vMpTXQwrPq9g70HHA2Qm/D5zUwE1XSZd0TNJR9KjpczJPPa6tRlp
         Zecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lebGj46PReB/jYqLYTRNyATlJPGl1b++aN+0TzzN0dU=;
        b=bWQ6yrKml7Wj9/JqyXvw2M3AR9SS5/sLqZNOgzaVUNNjmWMCzjuNVmWnO3v65lz3wK
         mPyURivnV5vmxcEwJxkVzhWljJsTH+gZPKkRSIQpFcShJsgOPUDYO5n7fNZUz7TXsmJy
         mlpjCjjrCS3Gz/c/bwJFKAbbK3fP93Y9osIvf19V4E1RCyD3o/FJIXcMXXU6m7DewnrC
         i9XonThr3VrPa77l8NOrKrOzF9eXFzQur6MFW/8fB8pJrTwaOevY8sTbITYN0bhX0NZs
         AxCUBjB3HSqClZY7PDHi7eMJpH0fQFv6fdaufSyHbKNI+wugdvNlio2ezMARpjgL3eh0
         YiCg==
X-Gm-Message-State: AOAM531RgBCBRGPivF2vUfn5X6Sac/Ym+WPaih4+YVgLCKx5MkFjcpBt
        C1wuVFlvEfuXKHB7bdSu0PU7QA==
X-Google-Smtp-Source: ABdhPJwi/NhOsJNV+7TfpXgr7mASg93GoMFK9MJYs75wQMRSAlBpmGrIrx8DxTogu/92EHklJiKG2A==
X-Received: by 2002:a05:6512:1153:: with SMTP id m19mr21052153lfg.418.1635237105698;
        Tue, 26 Oct 2021 01:31:45 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id e4sm1944598ljn.131.2021.10.26.01.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 01:31:45 -0700 (PDT)
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
        Marc Zyngier <maz@kernel.org>, jens.vankeirsbilck@kuleuven.be,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 2/6] dt-bindings: arm: optee: add interrupt property
Date:   Tue, 26 Oct 2021 10:31:34 +0200
Message-Id: <20211026083138.1818705-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026083138.1818705-1-jens.wiklander@linaro.org>
References: <20211026083138.1818705-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds an optional interrupt property to the optee binding.

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 .../devicetree/bindings/arm/firmware/linaro,optee-tz.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
index c24047c1fdd5..26d46ac0dbc2 100644
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
+            interrupts = <GIC_SPI 187 IRQ_TYPE_EDGE_RISING>;
         };
     };
 
-- 
2.31.1

