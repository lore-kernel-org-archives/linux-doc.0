Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB73B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 21:33:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbfH2Vdg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 17:33:36 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38029 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2Vdg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:33:36 -0400
Received: by mail-wm1-f65.google.com with SMTP id o184so5275826wme.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rh4R+Pon+fs2ZXsOi2GTsnEROI5SAuVOl6FXI+IVKkM=;
        b=Mq1WB3rpeqIYp4X8AOB2SJu0PzYXf0bsnk3whIgHxthrP45m/vJ3BHt15owYlbBLgR
         Z7Gk256h6KmxJyCdg0TXY+wbGrtZMpOZX7l1CzaS16wCc67XQP2gF/qgOC9yF2cddKzE
         lhpwKbvBAoLfuyqwZik30Nn2fwJRt14G8ons02frCsC3ScyYa2t/K2b55Jb5TNwXoqSW
         sxKJGJsx/TFaI9TbIt8Pq5WbzJy2z74hJDqXknBPUgE98N169w9XLcyclYEYPcXXGPbC
         ipH88iltTfYaMCJpOhDJIsMCkCHGZa0YBDwp4lxAxLeOOWVSwm1b+wWQNzdBgVhWx98T
         1xrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rh4R+Pon+fs2ZXsOi2GTsnEROI5SAuVOl6FXI+IVKkM=;
        b=cJT+kfKaqEZott3OSbgRnuWTTkYE1GMsE1LITDsqp7y8cQebVr4aHy/Oig+1sSgoF9
         xXLhR4+AEUQQtAhhqaHYlEFbIIlXsOcmwPNjiE3TupOVgpF6crm0GG8FoI+JuYjzn1Nv
         ASn/jpK0MswyEihFTL3GMIi8K29rxXfCpH5w8m1cvXLpdUJ5rq5qLTv6k0oFN2lCM76y
         RQ7ZnjgZtCJ6f0H8nqevSM5in1LwBxYhYKOKE/SduPfVb5LTSplm1ElbM8UuhB+BFQ7Y
         121UNfR3D6y/jbAyRWesWoTYkFx47+5ZHLwmixbB3LAfVXLVzvpeUkasedwMKElm/Ezl
         WaNg==
X-Gm-Message-State: APjAAAWNGjr6tmND0fVXVC4rXglJJtZbKVb5JLnxHdNKgRjvE5OXHb5T
        zlKyPoRlNjuyleqXtmiGCcX0XA==
X-Google-Smtp-Source: APXvYqzhLbodq2FJ0KyM0uldVGdMm8tFwCGa1Jigf44oT8mdo0/WWB3AR4vaEbWNWTUtoJZR6fJ7VA==
X-Received: by 2002:a1c:eb13:: with SMTP id j19mr12434854wmh.18.1567114413880;
        Thu, 29 Aug 2019 14:33:33 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:c44b:1415:84d1:2692])
        by smtp.gmail.com with ESMTPSA id o17sm4515711wrx.60.2019.08.29.14.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:33:33 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: [PATCH v2 04/11] coresight: etm4x: Fix issues with start-stop logic.
Date:   Thu, 29 Aug 2019 22:33:14 +0100
Message-Id: <20190829213321.4092-5-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829213321.4092-1-mike.leach@linaro.org>
References: <20190829213321.4092-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fixes the following issues when using the ETMv4 start-stop logic.

1) Setting a start or a stop address should not automatically set the
start-stop status to 'on'. The value set by the user in 'mode' must
be respected or start instances could be missed.
2) Missing API for controlling TRCVIPCSSCTLR - start stop control by
PE comparators.
3) Default ETM configuration sets a trace all range, and correctly sets
the start-stop status bit. This was not being correctly reflected in
the 'mode' parameter.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-etm4x-sysfs.c         | 39 +++++++++++++++++--
 drivers/hwtracing/coresight/coresight-etm4x.c |  1 +
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index b520f3c1521f..11730a194951 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -217,6 +217,7 @@ static ssize_t reset_store(struct device *dev,
 
 	/* No start-stop filtering for ViewInst */
 	config->vissctlr = 0x0;
+	config->vipcssctlr = 0x0;
 
 	/* Disable seq events */
 	for (i = 0; i < drvdata->nrseqstate-1; i++)
@@ -1059,8 +1060,6 @@ static ssize_t addr_start_store(struct device *dev,
 	config->addr_val[idx] = (u64)val;
 	config->addr_type[idx] = ETM_ADDR_TYPE_START;
 	config->vissctlr |= BIT(idx);
-	/* SSSTATUS, bit[9] - turn on start/stop logic */
-	config->vinst_ctrl |= BIT(9);
 	spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -1116,8 +1115,6 @@ static ssize_t addr_stop_store(struct device *dev,
 	config->addr_val[idx] = (u64)val;
 	config->addr_type[idx] = ETM_ADDR_TYPE_STOP;
 	config->vissctlr |= BIT(idx + 16);
-	/* SSSTATUS, bit[9] - turn on start/stop logic */
-	config->vinst_ctrl |= BIT(9);
 	spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -1274,6 +1271,39 @@ static ssize_t addr_exlevel_s_ns_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(addr_exlevel_s_ns);
 
+static ssize_t vinst_pe_cmp_start_stop_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	if (!drvdata->nr_pe_cmp)
+		return -EINVAL;
+	val = config->vipcssctlr;
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+}
+static ssize_t vinst_pe_cmp_start_stop_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t size)
+{
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+	if (!drvdata->nr_pe_cmp)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	config->vipcssctlr = val;
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(vinst_pe_cmp_start_stop);
+
 static ssize_t seq_idx_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
@@ -2080,6 +2110,7 @@ static struct attribute *coresight_etmv4_attrs[] = {
 	&dev_attr_addr_ctxtype.attr,
 	&dev_attr_addr_context.attr,
 	&dev_attr_addr_exlevel_s_ns.attr,
+	&dev_attr_vinst_pe_cmp_start_stop.attr,
 	&dev_attr_seq_idx.attr,
 	&dev_attr_seq_state.attr,
 	&dev_attr_seq_event.attr,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
index 52b8876de157..d8b078d0cc7f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -868,6 +868,7 @@ static void etm4_set_default_filter(struct etmv4_config *config)
 	 * in the started state
 	 */
 	config->vinst_ctrl |= BIT(9);
+	config->mode |= ETM_MODE_VIEWINST_STARTSTOP;
 
 	/* No start-stop filtering for ViewInst */
 	config->vissctlr = 0x0;
-- 
2.17.1

