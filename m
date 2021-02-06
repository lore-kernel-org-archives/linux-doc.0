Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A049AC433DB
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7318964EBC
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhBFPJ0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Feb 2021 10:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhBFPJW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Feb 2021 10:09:22 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B683C061788
        for <linux-doc@vger.kernel.org>; Sat,  6 Feb 2021 07:08:43 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id cl8so5209797pjb.0
        for <linux-doc@vger.kernel.org>; Sat, 06 Feb 2021 07:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7aI48q96Xs+NZkDeMm3ES5508s06Msw96vC+w3XIvVM=;
        b=JeOxMYY9Npo2EMtuL6jNxEU/nk663O8IoSiZ2rRghyQbqaxrWJEifhMRl3Y2W4zPdr
         rQwEw3wCQqwdqrLyHKgmVG7B1m+eonQkt6GdEsQanVOZcIozSllxTezo1G6QX4NNEtbt
         vn3mdlN+c+BTG6ydoTeZVTxCi+V0bWc4BqYJxz15Ua2MFPH1vhpI5IbJ5JFs52R7/yxn
         3nOpIsw0TxNDMck81ZI5GtY6j1j7ySsPbbeOsnKTM3g25Z2sisR8pkG+t7XPvaiU1JJ2
         42ybEK2XNcTpDJSa1jR3JD9J7YXOrNUtGgLhOzXnnVkkFwpaq1oVKvhO995IsKniggUV
         YmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7aI48q96Xs+NZkDeMm3ES5508s06Msw96vC+w3XIvVM=;
        b=elMIV4x7M7yg+j76qhhYqZbBTcomtIJGih7mmK2Z1IVXJYk0qOG8WP8xiLJo59lQpL
         pVQKENYN4LrseAn+Z7YjfOg03EsLwyESpcVx+dYd9S9C+BYmRSrbXWBFwlgDuYTtVWij
         l0oZAXWVlnH+secBcUf/YZSQ2IZ//ae6ZrEnsswFB4ngAZhwIP3uWSY9Enwh8XNy7wnn
         YPcr5bp9z83mGB/S+i6FsK6o8zcUikzux9ZX9yRBVfjBC5h1PtZnkZKUHD0/o7634Yxb
         Ej+CwYtTf1+MltbhqFOQ2hEHOzdpw/K/pOCoKPFWYHYjA9013tRCWMurJqLZ7QWje/ye
         qiTA==
X-Gm-Message-State: AOAM533324tVQ/P5LTi2u8tDoH8cYp0msYq7vhPFMWWS45TGwMdvdjCv
        50LbTVmGuGI66Y7RGZT9Px1LLw==
X-Google-Smtp-Source: ABdhPJyWjUcHphAyyrMEWbYktSwhx7LUJoOKbbIhQ07SdpXChCVJ44g+aBomPt+WTC29zkMv8gyqQg==
X-Received: by 2002:a17:90a:cb15:: with SMTP id z21mr8762633pjt.164.1612624122931;
        Sat, 06 Feb 2021 07:08:42 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id k24sm2808134pfg.40.2021.02.06.07.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 07:08:42 -0800 (PST)
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>,
        Al Grant <al.grant@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 1/8] coresight: etm-perf: Clarify comment on perf options
Date:   Sat,  6 Feb 2021 23:08:26 +0800
Message-Id: <20210206150833.42120-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210206150833.42120-1-leo.yan@linaro.org>
References: <20210206150833.42120-1-leo.yan@linaro.org>
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
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 .../hwtracing/coresight/coresight-etm-perf.c    |  5 ++++-
 include/linux/coresight-pmu.h                   | 17 ++++++++++++-----
 2 files changed, 16 insertions(+), 6 deletions(-)

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
-- 
2.25.1

