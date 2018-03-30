Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9FDF67E89D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Mar 2018 03:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752897AbeC3DQz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 23:16:55 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:37751 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752771AbeC3DQG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Mar 2018 23:16:06 -0400
Received: by mail-wr0-f196.google.com with SMTP id l49so6988368wrl.4
        for <linux-doc@vger.kernel.org>; Thu, 29 Mar 2018 20:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HpmWK/7Q87q15GSW6+wUQSscqm4fAYVRmYYCeuwbnNw=;
        b=XMsb5V8mWGdb8zdXU8hFQKiaUsQtP3E05ZpNZH86+hGmcnr5r1ObPUgPmzIg+cD8jy
         YCKGCkdIQtxL3eYFEmBv3+ZyxTO+k6AGMFXEUylpDLO4kV/vH80sEM16IwrdKg5lVR0l
         ZVbRdP47268iRTcILxhJcQ3W7ir9yoJyCsegg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HpmWK/7Q87q15GSW6+wUQSscqm4fAYVRmYYCeuwbnNw=;
        b=M/xP0qPWA9nslFLkYbX3fHeR42Qrz51I++atNgyhGAGeDno5dRDAVD8TqdJdPBR8+D
         Sp/574+gAOjQsmB3OtLXbfBjr2avQgpnRkq7vBYT6UOXCf9UR6WS9MxM9KYACxvnEGg3
         AJFT4QutyEvCYKV9kt9KPNvtPCGNGgsdamUGS6q/JZkNYhRvlqXv7o2/a6XeE8BpDg67
         iQ8FabuKf+PNfo23bnAV3aKQV2deU7pORxGfWpCyArIFUoZe/cZ/PfaF3h7yi5crioNs
         5yUZAH6vWNRx02qxX/Sr9Sa3D02URZEGygknwWmNmfqhk9IfgWGxmuFojMTuWNvtsFVK
         jK1g==
X-Gm-Message-State: AElRT7Gqu7N8hoH+QSAMAUn7Ttx7ksNg/8TKPw9Fh8afcQ76XB3fYuhi
        +HvXMzHRqb89uOP2Q+9A/+qyCQ==
X-Google-Smtp-Source: AIpwx4+gbi+82S56f0PFR9nTXThbF/t6iDlzni03R5NrGl4GoNtgK6L2tafQ90olVPp0zhTir1280A==
X-Received: by 10.223.176.253 with SMTP id j58mr8270564wra.269.1522379765011;
        Thu, 29 Mar 2018 20:16:05 -0700 (PDT)
Received: from localhost.localdomain (li622-172.members.linode.com. [212.71.249.172])
        by smtp.gmail.com with ESMTPSA id z9sm12798903wrz.4.2018.03.29.20.16.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 29 Mar 2018 20:16:04 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        Kim Phillips <kim.phillips@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 4/6] coresight: tmc: Hook callback for panic kdump
Date:   Fri, 30 Mar 2018 11:15:22 +0800
Message-Id: <1522379724-30648-5-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
References: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since Coresight panic kdump functionality has been ready, this patch is
to hook panic callback function for ETB/ETF driver.  The driver data
structure has allocated a buffer when the session started, so simply
save tracing data into this buffer when panic happens and update buffer
related info for kdump.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index e2513b7..d20d546 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -504,6 +504,35 @@ static void tmc_update_etf_buffer(struct coresight_device *csdev,
 	CS_LOCK(drvdata->base);
 }
 
+static void tmc_panic_cb(void *data)
+{
+	struct coresight_device *csdev = (struct coresight_device *)data;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	unsigned long flags;
+
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
+			 drvdata->config_type != TMC_CONFIG_TYPE_ETF))
+		return;
+
+	if (drvdata->mode == CS_MODE_DISABLED)
+		return;
+
+	spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	CS_UNLOCK(drvdata->base);
+
+	tmc_flush_and_stop(drvdata);
+	tmc_etb_dump_hw(drvdata);
+
+	CS_LOCK(drvdata->base);
+
+	/* Update buffer info for panic dump */
+	csdev->kdump_buf = drvdata->buf;
+	csdev->kdump_buf_sz = drvdata->len;
+
+	spin_unlock_irqrestore(&drvdata->spinlock, flags);
+}
+
 static const struct coresight_ops_sink tmc_etf_sink_ops = {
 	.enable		= tmc_enable_etf_sink,
 	.disable	= tmc_disable_etf_sink,
@@ -512,6 +541,7 @@ static const struct coresight_ops_sink tmc_etf_sink_ops = {
 	.set_buffer	= tmc_set_etf_buffer,
 	.reset_buffer	= tmc_reset_etf_buffer,
 	.update_buffer	= tmc_update_etf_buffer,
+	.panic_cb	= tmc_panic_cb,
 };
 
 static const struct coresight_ops_link tmc_etf_link_ops = {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
