Return-Path: <SRS0=QTCz=7W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49C3C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Jun 2020 10:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9EF9207F9
	for <linux-doc@archiver.kernel.org>; Tue,  9 Jun 2020 10:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hS4A2h3J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbgFIKsI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Jun 2020 06:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728886AbgFIKrs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jun 2020 06:47:48 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43080C008633
        for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2020 03:47:41 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dr13so2620426ejc.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2020 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/5WnBa7fJn+pPKP5P8jfdYigZEMgAeAJ+nmAq9FbnZM=;
        b=hS4A2h3J+Pci4Lw+anaXS2PuQgAH2hIHxpqd0ezXZxBZ9me+hfgdQg5mvHjcq8SUiO
         EuY6p0NBvRb45UuQrdbwSLXcPmCxwBvC1lHF5LyVoiaJ8Sx7LThvB+VK7ZsHRno9Y2uz
         6SBK2Nd8vb3GB5GOe8DWi6HPJvQeRk3hvhBy5OICiWc0tGOHQHpN2pIM2xv/FIUgpWI6
         D+4lRUw0r9eb4u0Y5WU5nkzEVplGGsS2HlRlIsldw/wj3Ik+gd67w1NVDuyHJGq/QF/p
         77MD86DPubivo8gbrQsAWCFwqMs/4ctENZres/LCUYw3JixwjJNmIkS6ZdOBqPwqK80t
         UO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/5WnBa7fJn+pPKP5P8jfdYigZEMgAeAJ+nmAq9FbnZM=;
        b=Jc0zwRcN9rot975h3NCv+VQh6kFi1djnVJTixioTJ5cjejm9w7D+zcYTufXcKeSl5w
         X7j+/xrKs0O9HM/A2Swx8HkRFSYFMRDrrqa5APx3eLyEO+vpl2BG8NW5ToVPsowNVLi1
         PkkzDOi/Pe4KOcJYfS33W4b+dKRJ/om7+Nj1Xs/AQewK4SUQXHMxM/CbMf99WUz1XpdZ
         ripHHqq2L8jsxSnN/66Hn5GkwH5QUQEZoaN7rrrH8tdO9QQzeWfRjyr6QBgep+mvkVLS
         CoWAr7Bv7J4eoRzxCskdlu/xpm4pQq3Tv0KCG0w2ErH6vHROGgVaYl02A8mHLiOvfn3+
         Ck6w==
X-Gm-Message-State: AOAM533ls4rtG9xj5c/VW/8x4aOmYueIbIeLh2/lBL9cN2NrU4d0NE/Q
        BOorOtB8n1ZJyFgjCszRnT2PBFroF44=
X-Google-Smtp-Source: ABdhPJzH/K2NQQ2rv61OJWPAnFYGeM8y8y32U0bjShreSrArNp7+PSoZt2khzLblWMU0Eg0n23fgQA==
X-Received: by 2002:a17:907:ab9:: with SMTP id bz25mr24488816ejc.39.1591699659825;
        Tue, 09 Jun 2020 03:47:39 -0700 (PDT)
Received: from localhost.localdomain (hst-221-69.medicom.bg. [84.238.221.69])
        by smtp.gmail.com with ESMTPSA id qt19sm12267763ejb.14.2020.06.09.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:47:39 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-acpi@vger.kernel.org,
        netdev@vger.kernel.org
Cc:     Joe Perches <joe@perches.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Baron <jbaron@akamai.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 3/7] dev_printk: Add dev_dbg_level macro over dynamic one
Date:   Tue,  9 Jun 2020 13:46:00 +0300
Message-Id: <20200609104604.1594-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609104604.1594-1-stanimir.varbanov@linaro.org>
References: <20200609104604.1594-1-stanimir.varbanov@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add dev_dbg_level macro wrapper over dynamic debug one for
dev_dbg variants.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 include/linux/dev_printk.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/dev_printk.h b/include/linux/dev_printk.h
index 7b50551833e1..d639dc60d84d 100644
--- a/include/linux/dev_printk.h
+++ b/include/linux/dev_printk.h
@@ -112,15 +112,24 @@ void _dev_info(const struct device *dev, const char *fmt, ...)
 #if defined(CONFIG_DYNAMIC_DEBUG)
 #define dev_dbg(dev, fmt, ...)						\
 	dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
+#define dev_dbg_level(dev, lvl, fmt, ...)				\
+	dynamic_dev_dbg_level(dev, lvl, dev_fmt(fmt), ##__VA_ARGS__)
 #elif defined(DEBUG)
 #define dev_dbg(dev, fmt, ...)						\
 	dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
+#define dev_dbg_level(dev, lvl, fmt, ...)				\
+	dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
 #else
 #define dev_dbg(dev, fmt, ...)						\
 ({									\
 	if (0)								\
 		dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
 })
+#define dev_dbg_level(dev, lvl, fmt, ...)				\
+({									\
+	if (0)								\
+		dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
+})
 #endif
 
 #ifdef CONFIG_PRINTK
-- 
2.17.1

