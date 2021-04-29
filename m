Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46F5C43461
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 12:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7628C61453
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 12:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbhD2MMv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Apr 2021 08:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235944AbhD2MMu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Apr 2021 08:12:50 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978E2C061343
        for <linux-doc@vger.kernel.org>; Thu, 29 Apr 2021 05:12:03 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id z6so5402721wrm.4
        for <linux-doc@vger.kernel.org>; Thu, 29 Apr 2021 05:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ymSp8rfZSWXVKAoyrk1VB6kKAVSstzHQFijBzDCf7V4=;
        b=0WXvLpbTLG1tRoZSII9grqKOVMmJ//5onbjzjw3Hrr7ozsslJOL1Q1fWdQg27qyJMA
         R1jsnOIFEYIMlxrQGpCtvWc1Vwm+TESo6CHKznijk5dAYL+RbcsPNA5x/sh5Vfp2vmbq
         ucWGTQ2KmC5N2Qo4KODwjQY6kV3Ko0p/BwzC7Q9Xh9yiVniGIoWsSBqXK8KSvIZYS+r2
         pgT1oRfr6+S77L3hPsyfPhxKyC666pPZypgYMdtuJYqb5WzwKnMS7Cc0iIIQYPBQflpK
         XeCyT4tVITG9AJFXBVBdoCPg4wNdX4d2uulqw9v+xn+I6PzRWVX0WGDQ+UPsGLpACh7C
         uxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ymSp8rfZSWXVKAoyrk1VB6kKAVSstzHQFijBzDCf7V4=;
        b=nbA2GS9S414VYa4RoxFpNEd7P7oly4rdTRmafeTiCDTdYIT5ObArAZ17ujYkU5zHV0
         mFT8u1SjfqfM/sPeLf2Zcq/HxlmQwcnYf11bT1jo+EMGu93UJ8I9y5ocH39mwHbkIUcI
         emqtwhROkcxzQR1F1375Ni/vZp1loyo4zkwvcOqMOz3+WANljC3ZH+WqHrr3TiroAXjf
         gJHUiAf0pXCmWxiLbxbAlRR8dUqLs5aY2z/g32kyqUwn5UucNxXMc8SKmty+Ux5GIzQE
         hQh4oLOKvLw+3jPnxgCr4wNVwfspk5s9psltP1aNMYhBgWug7OALdKoq9j5AA455yyZ+
         +s9A==
X-Gm-Message-State: AOAM530wvBMUMTJuNqkLOqAbBVAde7qmrtvdH5v1MjbssNn396aLrAoK
        ZQoU8lDvhhUwF12enc5SRPxakw==
X-Google-Smtp-Source: ABdhPJwmckvmYiN8ROxPFgYNNcFNtN9hKA8kcQk2aMDqu0TsLAaRfAW+3HnF6cPy+5U99P52ncQQzw==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr23171822wrn.180.1619698322290;
        Thu, 29 Apr 2021 05:12:02 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-15.xnet.hr. [88.207.97.15])
        by smtp.googlemail.com with ESMTPSA id 18sm10075640wmo.47.2021.04.29.05.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 05:12:01 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/2] dt-bindings: hwmon: Add Texas Instruments TMP1075
Date:   Thu, 29 Apr 2021 14:11:50 +0200
Message-Id: <20210429121150.106804-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429121150.106804-1-robert.marko@sartura.hr>
References: <20210429121150.106804-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the DT compatible for TI TMP1075 which
is a LM75 compatible sensor.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/hwmon/lm75.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index 96eed5cc7841..72980d083c21 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -30,6 +30,7 @@ properties:
       - st,stds75
       - st,stlm75
       - microchip,tcn75
+      - ti,tmp1075
       - ti,tmp100
       - ti,tmp101
       - ti,tmp105
-- 
2.31.1

