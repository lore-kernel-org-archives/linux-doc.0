Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 058887D910
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 21:33:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbfH2Vdj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 17:33:39 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40526 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2Vdj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:33:39 -0400
Received: by mail-wr1-f65.google.com with SMTP id c3so4882937wrd.7
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=16sir9Jo92fa6a3Fm0L8aUegEHqxRHW+/tMTqCDog2E=;
        b=RGAyjwObJ77VFslNszJX7jrH/aDw/nBNR6FDrmqYkeTivd/RXvKYAcK7xAfziq+VC5
         DvVDZFL19LmtjoiLFTGgIu2u1LEA8GPQVa5N6da83rZIQ1wgSqjRuX6DihE7BJBFP9hM
         5HnLRbqM+rw6SLgG3NZ+ZQgbWgV9zCkyThpvKafiDvGatdMuXimqf6F3T8a7daK822C2
         MLlQE9tm3fAFwAG4Wd3rluU+S05SuhDSmG1yq6DNhweSekxbPtHCn+JFm4wv/h/RNOo/
         gJGB+hCzI1ski9db1cYiBWYdaHOgJ5zJruSMiSMVpzvHSIXigHZ1r7cL30LFol4kz2T3
         Pwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=16sir9Jo92fa6a3Fm0L8aUegEHqxRHW+/tMTqCDog2E=;
        b=nINrujhWNprKwujsGicjtVU5fsi64UlHlpPW9gD46IpY0VU7ZOok8/nAbi30+sOfQn
         KWxmrM+ePnJMdMJaPvkMvGSAyDxZ5ow7cYyo3El3bIZy/7VZBGOQCZHEMFEsdatPKGWG
         WUvOKSRzUexnN7xUx9vWqqg3Y5/fUt7fNimwI6JR2IgSO4l8xjFOtDaJ4MNhS2wxW1dw
         Cv/lsbqlwa58hmXQQT3RTDBdV1cqDHvhKU51oiHzDoFipk2M6brrTJZMd+4Wuc9VIrFL
         Tu279HEPZOkyOZ3YwqbUyDAKahmC5iqYf7Yy2CAo04b7huDFjFqEJT2UxxIVySTMRx/X
         hv/g==
X-Gm-Message-State: APjAAAW00H3Bz49mOgoy1mAz6qoXAiuk3F69mm8WEE6kxdBWbkiUVr9V
        sU1+njALcUF9lkbBzrTxbgw7Ww==
X-Google-Smtp-Source: APXvYqx2J3W2xrr4agpOmTtJlQZjTZ3fxGJws3q2aHzqr+k8zyeetFO2g8rb/EXHW04YVI8m8eTrjg==
X-Received: by 2002:adf:f386:: with SMTP id m6mr14175103wro.313.1567114417400;
        Thu, 29 Aug 2019 14:33:37 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:c44b:1415:84d1:2692])
        by smtp.gmail.com with ESMTPSA id o17sm4515711wrx.60.2019.08.29.14.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:33:36 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: [PATCH v2 07/11] coresight: etm4x: Add view comparator settings API to sysfs.
Date:   Thu, 29 Aug 2019 22:33:17 +0100
Message-Id: <20190829213321.4092-8-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829213321.4092-1-mike.leach@linaro.org>
References: <20190829213321.4092-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently it is not possible to view the current settings of a given
address comparator without knowing what type it is set to. For example, if
a comparator is set as an addr_start comparator, attempting to read
addr_stop for the same index will result in an error.

addr_cmp_view is added to allow the user to see the current settings of
the indexed address comparator without resorting to trial and error when
the set type is not known.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-etm4x-sysfs.c         | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 171d3c580968..a8c9eadfe56f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1275,6 +1275,57 @@ static ssize_t addr_exlevel_s_ns_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(addr_exlevel_s_ns);
 
+static const char * const addr_type_names[] = {
+	"unused",
+	"single",
+	"range",
+	"start",
+	"stop"
+};
+
+static ssize_t addr_cmp_view_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	u8 idx, addr_type;
+	unsigned long addr_v, addr_v2, addr_ctrl;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+	int size = 0;
+	bool exclude = false;
+
+	spin_lock(&drvdata->spinlock);
+	idx = config->addr_idx;
+	addr_v = config->addr_val[idx];
+	addr_ctrl = config->addr_acc[idx];
+	addr_type = config->addr_type[idx];
+	if (addr_type == ETM_ADDR_TYPE_RANGE) {
+		if (idx & 0x1) {
+			idx -= 1;
+			addr_v2 = addr_v;
+			addr_v = config->addr_val[idx];
+		} else {
+			addr_v2 = config->addr_val[idx + 1];
+		}
+		exclude = config->viiectlr & BIT(idx / 2 + 16);
+	}
+	spin_unlock(&drvdata->spinlock);
+	if (addr_type) {
+		size = scnprintf(buf, PAGE_SIZE, "addr_cmp[%i] %s %#lx", idx,
+				 addr_type_names[addr_type], addr_v);
+		if (addr_type == ETM_ADDR_TYPE_RANGE) {
+			size += scnprintf(buf + size, PAGE_SIZE - size,
+					  " %#lx %s", addr_v2,
+					  exclude ? "exclude" : "include");
+		}
+		size += scnprintf(buf + size, PAGE_SIZE - size,
+				  " ctrl(%#lx)\n", addr_ctrl);
+	} else {
+		size = scnprintf(buf, PAGE_SIZE, "addr_cmp[%i] unused\n", idx);
+	}
+	return size;
+}
+static DEVICE_ATTR_RO(addr_cmp_view);
+
 static ssize_t vinst_pe_cmp_start_stop_show(struct device *dev,
 					    struct device_attribute *attr,
 					    char *buf)
@@ -2120,6 +2171,7 @@ static struct attribute *coresight_etmv4_attrs[] = {
 	&dev_attr_addr_ctxtype.attr,
 	&dev_attr_addr_context.attr,
 	&dev_attr_addr_exlevel_s_ns.attr,
+	&dev_attr_addr_cmp_view.attr,
 	&dev_attr_vinst_pe_cmp_start_stop.attr,
 	&dev_attr_seq_idx.attr,
 	&dev_attr_seq_state.attr,
-- 
2.17.1

