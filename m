Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6665C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 16:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A5CF64F72
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 16:40:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236737AbhBBQjy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Feb 2021 11:39:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236716AbhBBQjZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Feb 2021 11:39:25 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A822DC06174A
        for <linux-doc@vger.kernel.org>; Tue,  2 Feb 2021 08:39:10 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id s23so13972348pgh.11
        for <linux-doc@vger.kernel.org>; Tue, 02 Feb 2021 08:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tq0kn8wQ4cNSCpcYdEBjYPAftV0+h3/NpmhAUshCF0U=;
        b=yTndU65Sl8Ob0YAvVXTHGAV5Nczr4dBuH7X94sJqQXi8KHJE0lShyEaqXy97KTpFgD
         k0jNJzTiHCJybiPEPc+ODJUR4vkxUVrRcIU9CH6k4fniC+smLrA9uToVdOTtsP+X/FqS
         p3sK18lIGGqUbDOHlcdyRLdNGV9HYRVNFgIYV7uIOw+G3FKKZSKeQx6VaUXCex1JjH5t
         oXVgcKHXg/kDGC6SuQeZlUCsQnicneKM0PiXCATjYirhZZU7/EZenYuwkATHt3T0NII6
         27XzYItoSOWWd1ySQJ2KUAlYhR4105L0sSPpN6HqPJjbQ3vg0RZ1OmhN9uVYxGw3uhNQ
         2Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tq0kn8wQ4cNSCpcYdEBjYPAftV0+h3/NpmhAUshCF0U=;
        b=uLi7LYuDykGFc6kau6yMIkSFHQWsBlKPyJRi6f6hWgUjx2yBjIBwfvNeHNznH/qTST
         wuov4QyWP5/enRxKb8KWDS2ApKr38xOjoN3ncgjzd25NSY8w3k3oH34PLGCf90zopVkZ
         UohBWvKcPwqk2qu24KAvVWeHDuMp+W6/dZd1kug2tSyCi9TgAHG6GNBooNqlEGZttErR
         V931sadS+lsKgW8OfesrOo2wp+FRLgU6BYLY+LNax+kPy3TAU9Dzfh7tpC9JEsyLCzyW
         eNy3aAwPpn0aG5g3NtQyHC0oohD7Di1ycUKBSpOZUxG5XihW0bw77YGqOf2ldcLRE6qu
         1+mg==
X-Gm-Message-State: AOAM5320TynFHoynNApmkRbeQilcPMkYyUYosa+xFzhBOatgBAmhUsYn
        VPIPwL1+1siaeoUo1vveY/zFlw==
X-Google-Smtp-Source: ABdhPJzeOqe2CAs1UnE+QgY8zmh1RJyEOKxmiq5FSu+O0azBurjZtdxZdFhRIuDNxrqMHgCZ3Tk4Ow==
X-Received: by 2002:a63:f905:: with SMTP id h5mr16311501pgi.301.1612283950192;
        Tue, 02 Feb 2021 08:39:10 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id g5sm22521513pfm.115.2021.02.02.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 08:39:09 -0800 (PST)
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 1/7] coresight: etm-perf: Clarify comment on perf options
Date:   Wed,  3 Feb 2021 00:38:36 +0800
Message-Id: <20210202163842.134734-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202163842.134734-1-leo.yan@linaro.org>
References: <20210202163842.134734-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In theory, the options should be arbitrary values and are neutral for
any ETM version; so far perf tool uses ETMv3.5/PTM ETMCR config bits
except for register's bit definitions, also uses as options.

This can introduce confusion, especially if we want to add a new option
but the new option is not supported by ETMv3.5/PTM ETMCR.  But on the
other hand, we cannot change options since these options are generic
CoreSight PMU ABI.

For easier maintenance and avoid confusion, this patch refines the
comment to clarify perf options, and gives out the background info for
these bits are coming from ETMv3.5/PTM.  Afterwards, we should take
these options as general knobs, and if there have any confliction with
ETMv3.5/PTM, should consider to define saperate macros for ETMv3.5/PTM
ETMCR config bits.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../hwtracing/coresight/coresight-etm-perf.c    |  5 ++++-
 include/linux/coresight-pmu.h                   | 17 ++++++++++++-----
 tools/include/linux/coresight-pmu.h             | 17 ++++++++++++-----
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index bdc34ca449f7..465ef1aa8c82 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -27,7 +27,10 @@ static bool etm_perf_up;
 static DEFINE_PER_CPU(struct perf_output_handle, ctx_handle);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
 
-/* ETMv3.5/PTM's ETMCR is 'config' */
+/*
+ * The PMU formats were orignally for ETMv3.5/PTM's ETMCR 'config';
+ * now take them as general formats and apply on all ETMs.
+ */
 PMU_FORMAT_ATTR(cycacc,		"config:" __stringify(ETM_OPT_CYCACC));
 PMU_FORMAT_ATTR(contextid,	"config:" __stringify(ETM_OPT_CTXTID));
 PMU_FORMAT_ATTR(timestamp,	"config:" __stringify(ETM_OPT_TS));
diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
index b0e35eec6499..5dc47cfdcf07 100644
--- a/include/linux/coresight-pmu.h
+++ b/include/linux/coresight-pmu.h
@@ -10,11 +10,18 @@
 #define CORESIGHT_ETM_PMU_NAME "cs_etm"
 #define CORESIGHT_ETM_PMU_SEED  0x10
 
-/* ETMv3.5/PTM's ETMCR config bit */
-#define ETM_OPT_CYCACC  12
-#define ETM_OPT_CTXTID	14
-#define ETM_OPT_TS      28
-#define ETM_OPT_RETSTK	29
+/*
+ * Below are the definition of bit offsets for perf option, and works as
+ * arbitrary values for all ETM versions.
+ *
+ * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
+ * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
+ * directly use below macros as config bits.
+ */
+#define ETM_OPT_CYCACC		12
+#define ETM_OPT_CTXTID		14
+#define ETM_OPT_TS		28
+#define ETM_OPT_RETSTK		29
 
 /* ETMv4 CONFIGR programming bits for the ETM OPTs */
 #define ETM4_CFG_BIT_CYCACC	4
diff --git a/tools/include/linux/coresight-pmu.h b/tools/include/linux/coresight-pmu.h
index b0e35eec6499..5dc47cfdcf07 100644
--- a/tools/include/linux/coresight-pmu.h
+++ b/tools/include/linux/coresight-pmu.h
@@ -10,11 +10,18 @@
 #define CORESIGHT_ETM_PMU_NAME "cs_etm"
 #define CORESIGHT_ETM_PMU_SEED  0x10
 
-/* ETMv3.5/PTM's ETMCR config bit */
-#define ETM_OPT_CYCACC  12
-#define ETM_OPT_CTXTID	14
-#define ETM_OPT_TS      28
-#define ETM_OPT_RETSTK	29
+/*
+ * Below are the definition of bit offsets for perf option, and works as
+ * arbitrary values for all ETM versions.
+ *
+ * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
+ * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
+ * directly use below macros as config bits.
+ */
+#define ETM_OPT_CYCACC		12
+#define ETM_OPT_CTXTID		14
+#define ETM_OPT_TS		28
+#define ETM_OPT_RETSTK		29
 
 /* ETMv4 CONFIGR programming bits for the ETM OPTs */
 #define ETM4_CFG_BIT_CYCACC	4
-- 
2.25.1

