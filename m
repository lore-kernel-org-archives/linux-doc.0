Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6CE747DE5B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfJOVU4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:20:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35692 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfJOVU4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 17:20:56 -0400
Received: by mail-wr1-f65.google.com with SMTP id v8so25554854wrt.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 14:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JOcTLOqG6/8JBYdUtCKUjnzDdNgGAk3Lo1/s5SPM2vQ=;
        b=txHkyKEHnouHy5st53YylZ9aOwOE/Nv5QboOO2n6gYm2emk+vDvLPN0A5ycD1abeHA
         8lk8l3WlyW/uy7wkh3zX6aYjwjKKVxEJps+ArOvRlLy2sxDr4604CEOf2nEFA9J9Rlf1
         ZsMyYMssCf5h6eztKHJ+mdRsc7XR3pkSQ6rdf6sgnnz/IW4E8nnjoJyXomJyWhUEMpFR
         kKwTT6NDoVN8a45nKrMhL+4jjfOFai1phnO2fs2HYWD+zWXPSXOGcDPlGOpVwUVGTdNT
         Z0VArCUgeiI9MKrjxYPnHmtH+pxgfLIDE9Fl5rCU4bqX/2gI3mHxwGGLLBySw7CtzQRa
         cdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JOcTLOqG6/8JBYdUtCKUjnzDdNgGAk3Lo1/s5SPM2vQ=;
        b=okQ71rxKPSE/++6rnzSrGnbu74Xps+/Yazym5aXZBuP1DdxcvFebha8y1H6TM6/F/c
         DIW0DziqaVBz6ubk1+4gvivuPfBrHlSEH6P8kBnReyj+VHaemfKV9fT+ZERPC9lhEv0y
         GyBaNEXUrdaQoOrdFleEpcB83jIrhp5aEwqbNBilJyhOukv42dDxjaoQx4bHUZkKTDrN
         PYXx4X9AXTwH8TIKjiaO3sW7/6zK8EB+GZU5tQbbN1cZ734H+tnWChlYCgSZKF25cQhR
         NS1Sqvv/L26XR5OZ7mofkLXaMnqRo+CIWMuc+pmrX0j75tkdHjof2GgJjVGy1HF3fwcV
         lutA==
X-Gm-Message-State: APjAAAXly6SteVSFhSRTWh6+ElgAvVGgadzKfltDkJ/ri1WfMz6JwzYh
        5vFxToJdO2c1TdEkVc6vwnSaFw==
X-Google-Smtp-Source: APXvYqz4Jr5RkrAR2YTxHroI0VVN3aiOOOy7zJSyn5Vbz8lAOydfpR7X29BrEx4tNDJ7mtRmQepUcQ==
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr31198630wrq.291.1571174454488;
        Tue, 15 Oct 2019 14:20:54 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:39d2:21a2:678a:9501])
        by smtp.gmail.com with ESMTPSA id g185sm517649wme.10.2019.10.15.14.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 14:20:54 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: [PATCH v3 04/11] coresight: etm4x: Fix issues with start-stop logic.
Date:   Tue, 15 Oct 2019 22:19:57 +0100
Message-Id: <20191015212004.24748-5-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015212004.24748-1-mike.leach@linaro.org>
References: <20191015212004.24748-1-mike.leach@linaro.org>
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
index 45fa7743eea4..2dbad7162557 100644
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
index efe120925f9d..d5148afdbe80 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -887,6 +887,7 @@ static void etm4_set_default_filter(struct etmv4_config *config)
 	 * in the started state
 	 */
 	config->vinst_ctrl |= BIT(9);
+	config->mode |= ETM_MODE_VIEWINST_STARTSTOP;
 
 	/* No start-stop filtering for ViewInst */
 	config->vissctlr = 0x0;
-- 
2.17.1

