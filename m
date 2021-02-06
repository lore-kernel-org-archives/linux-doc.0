Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D4AC433DB
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:11:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A835A64E36
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbhBFPKz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Feb 2021 10:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhBFPKG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Feb 2021 10:10:06 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E48C0617A9
        for <linux-doc@vger.kernel.org>; Sat,  6 Feb 2021 07:08:57 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id s23so6661760pgh.11
        for <linux-doc@vger.kernel.org>; Sat, 06 Feb 2021 07:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XAsb7dnmzbaljkH0CVEHBr6f3jyPLu6vS3k+O8s+p4o=;
        b=PY+hsjmHc0QYlaZZl66yeqcQ8DYLM1uDpbS6K/WPuOzf0f7rXkxZKO7LMngF5XVg3z
         mQW93xf4SlMYEU+HpUFoeGTcMzS9WmHg+B40LNIDOyPn4bcWdRjRgavflvP3HzIs7KsL
         T6zufgjTFImAvzO5YtUcIR4rIfiW/zNdc/c63JouoaXgXfaO/ZAvnsQTxFfWFjF9auJn
         hoUB0xPHxS04K/NIHRXESJ+pg7x0O6HlF7DuL2onvXWB9Pya8wR80sZRTEsUkwokEYlW
         L1WKsBOezWh0oOATMnMp2dNQr7NK3JGCn6m2KAVmTfQyvuOstZdGoz4WUu+w3KS1jPwW
         rrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XAsb7dnmzbaljkH0CVEHBr6f3jyPLu6vS3k+O8s+p4o=;
        b=hE0J9jwvQj78D1S109YREWAtP/KIlwzaHD8vyskUou5J0HEHCb+hscJnhSZiU67RUy
         Kesd8UcRR5r+Gd3YRG/URYZcTWGCCrNyvLe1hCTtksSL3+uqr5h/qZCAxWuJiS3qzorZ
         Y03iZqRVY4WNAqrYYrDJrF5Q4IEpQQ8s9OlnSWGwwIGcf2rughaUA4ysU1f43sbxLXGt
         MTpceIP1tM/g7ERaCBFE4I+4o6R1XZGWqZScwg0SwfP8VRo70mKuRIh1CWwtu+sVDVJ3
         ul7oNFC3ZvXP2qhMAK2PCXrOmNr9e7NiiGK6qW8f3TM/FXTaYruOWtukqLu8ziEvkii6
         E4qw==
X-Gm-Message-State: AOAM532ax/uuewEQEvcG53KJH16VJJRUIYwmQoCYXXN8GABPydfTlxci
        nlsItP0OLN4e0EOfgJ9i4hFS4Q==
X-Google-Smtp-Source: ABdhPJwa5rgb7ejUQ6HjBhTE/m1IDHRMcD7Nz/oe0LuUqBG7IUGzUnmnieZdkqKdSj7XN6P2yEHx5A==
X-Received: by 2002:a62:76d3:0:b029:1d9:8e88:9276 with SMTP id r202-20020a6276d30000b02901d98e889276mr4555762pfc.71.1612624136614;
        Sat, 06 Feb 2021 07:08:56 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id o14sm14887602pgr.44.2021.02.06.07.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 07:08:55 -0800 (PST)
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
Subject: [PATCH v3 5/8] perf cs-etm: Support PID tracing in config
Date:   Sat,  6 Feb 2021 23:08:30 +0800
Message-Id: <20210206150833.42120-6-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210206150833.42120-1-leo.yan@linaro.org>
References: <20210206150833.42120-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Suzuki K Poulose <suzuki.poulose@arm.com>

If the kernel is running at EL2, the pid of a task is exposed via VMID
instead of the CONTEXTID.  Add support for this in the perf tool.

This patch respects user setting if user has specified any configs
from "contextid", "contextid1" or "contextid2"; otherwise, it
dynamically sets config based on PMU format "contextid".

Cc: Mike Leach <mike.leach@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Al Grant <al.grant@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Co-developed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 tools/include/linux/coresight-pmu.h |  3 ++
 tools/perf/arch/arm/util/cs-etm.c   | 61 +++++++++++++++++++++++------
 2 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/tools/include/linux/coresight-pmu.h b/tools/include/linux/coresight-pmu.h
index 5dc47cfdcf07..4ac5c081af93 100644
--- a/tools/include/linux/coresight-pmu.h
+++ b/tools/include/linux/coresight-pmu.h
@@ -20,14 +20,17 @@
  */
 #define ETM_OPT_CYCACC		12
 #define ETM_OPT_CTXTID		14
+#define ETM_OPT_CTXTID2		15
 #define ETM_OPT_TS		28
 #define ETM_OPT_RETSTK		29
 
 /* ETMv4 CONFIGR programming bits for the ETM OPTs */
 #define ETM4_CFG_BIT_CYCACC	4
 #define ETM4_CFG_BIT_CTXTID	6
+#define ETM4_CFG_BIT_VMID	7
 #define ETM4_CFG_BIT_TS		11
 #define ETM4_CFG_BIT_RETSTK	12
+#define ETM4_CFG_BIT_VMID_OPT	15
 
 static inline int coresight_get_trace_id(int cpu)
 {
diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index c25c878fd06c..fa6f91a7c8a1 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -67,6 +67,7 @@ static int cs_etm_set_context_id(struct auxtrace_record *itr,
 	char path[PATH_MAX];
 	int err = -EINVAL;
 	u32 val;
+	u64 contextid;
 
 	ptr = container_of(itr, struct cs_etm_recording, itr);
 	cs_etm_pmu = ptr->cs_etm_pmu;
@@ -86,25 +87,59 @@ static int cs_etm_set_context_id(struct auxtrace_record *itr,
 		goto out;
 	}
 
+	/* User has configured for PID tracing, respects it. */
+	contextid = evsel->core.attr.config &
+			(BIT(ETM_OPT_CTXTID) | BIT(ETM_OPT_CTXTID2));
+
 	/*
-	 * TRCIDR2.CIDSIZE, bit [9-5], indicates whether contextID tracing
-	 * is supported:
-	 *  0b00000 Context ID tracing is not supported.
-	 *  0b00100 Maximum of 32-bit Context ID size.
-	 *  All other values are reserved.
+	 * If user doesn't configure the contextid format, parse PMU format and
+	 * enable PID tracing according to the "contextid" format bits:
+	 *
+	 *   If bit ETM_OPT_CTXTID is set, trace CONTEXTIDR_EL1;
+	 *   If bit ETM_OPT_CTXTID2 is set, trace CONTEXTIDR_EL2.
 	 */
-	val = BMVAL(val, 5, 9);
-	if (!val || val != 0x4) {
-		err = -EINVAL;
-		goto out;
+	if (!contextid)
+		contextid = perf_pmu__format_bits(&cs_etm_pmu->format,
+						  "contextid");
+
+	if (contextid & BIT(ETM_OPT_CTXTID)) {
+		/*
+		 * TRCIDR2.CIDSIZE, bit [9-5], indicates whether contextID
+		 * tracing is supported:
+		 *  0b00000 Context ID tracing is not supported.
+		 *  0b00100 Maximum of 32-bit Context ID size.
+		 *  All other values are reserved.
+		 */
+		val = BMVAL(val, 5, 9);
+		if (!val || val != 0x4) {
+			pr_err("%s: CONTEXTIDR_EL1 isn't supported\n",
+			       CORESIGHT_ETM_PMU_NAME);
+			err = -EINVAL;
+			goto out;
+		}
+	}
+
+	if (contextid & BIT(ETM_OPT_CTXTID2)) {
+		/*
+		 * TRCIDR2.VMIDOPT[30:29] != 0 and
+		 * TRCIDR2.VMIDSIZE[14:10] == 0b00100 (32bit virtual contextid)
+		 * We can't support CONTEXTIDR in VMID if the size of the
+		 * virtual context id is < 32bit.
+		 * Any value of VMIDSIZE >= 4 (i.e, > 32bit) is fine for us.
+		 */
+		if (!BMVAL(val, 29, 30) || BMVAL(val, 10, 14) < 4) {
+			pr_err("%s: CONTEXTIDR_EL2 isn't supported\n",
+			       CORESIGHT_ETM_PMU_NAME);
+			err = -EINVAL;
+			goto out;
+		}
 	}
 
 	/* All good, let the kernel know */
-	evsel->core.attr.config |= (1 << ETM_OPT_CTXTID);
+	evsel->core.attr.config |= contextid;
 	err = 0;
 
 out:
-
 	return err;
 }
 
@@ -489,7 +524,9 @@ static u64 cs_etmv4_get_config(struct auxtrace_record *itr)
 		config |= BIT(ETM4_CFG_BIT_TS);
 	if (config_opts & BIT(ETM_OPT_RETSTK))
 		config |= BIT(ETM4_CFG_BIT_RETSTK);
-
+	if (config_opts & BIT(ETM_OPT_CTXTID2))
+		config |= BIT(ETM4_CFG_BIT_VMID) |
+			  BIT(ETM4_CFG_BIT_VMID_OPT);
 	return config;
 }
 
-- 
2.25.1

