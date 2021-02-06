Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333F7C433E6
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0758264EAD
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:11:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhBFPLP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Feb 2021 10:11:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhBFPKR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Feb 2021 10:10:17 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF32FC06121C
        for <linux-doc@vger.kernel.org>; Sat,  6 Feb 2021 07:09:03 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id z9so5466113pjl.5
        for <linux-doc@vger.kernel.org>; Sat, 06 Feb 2021 07:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pyq04aDyfklktjTYGZj1z7yEnQjahkQt1L+FxuD6rbc=;
        b=qouNmuiuA8NJ1l/H8300ZVUwur3oOXWDpVnlUcMcbSlVSiTRe22Z6KDCuf8kYKyk0U
         z+6ThKM6a8A/ne/di/CYjp1U55ffvgsiaUzHa/y38LW+iIJsNo2jJNn23X0dn4B4R2No
         8Wh82ynNFEzR3vG1/1H3hJW9+XzWOVWBh/3IwkbD7KaYLSyNtT9ktnn78f/VerycS3N7
         PrHCCtQ3bZZLFeJE3o+ZnWn/6nQnG4WrJjUr+BvKChM99ZhbZmw+cDXQh25eDV9NnK/h
         RX0OqfGrS0MM48on+Mow4AR93900EiV7lD46cqduxcg2Cca9zsCqCO/R+TNdgm3oV0VD
         LA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pyq04aDyfklktjTYGZj1z7yEnQjahkQt1L+FxuD6rbc=;
        b=LxKBKrwCCiPi2VgravwzLT9BOxSPWWhxW4EzFd/ZBHc3onYwmkZzfP+KeLokW4p7Do
         G+Y+g53wGPpPzeKdld74PXHP0NTNNxr95kjqDIUcfAF3Q43Kru1YXuGxZSNBPcXe12UF
         c9IietDHML69Y9QV9XyuIwtKR7i0+2F9nps91+5od3mKcpLMOcHQwKy8fdVfyVvfxpDd
         o3DFHrStUEGu9UkzTZ4/26SEGmpCpi1gN/JnsC340qtgtZRcqlTc9Vt3GH/B+w3IJ7H4
         StY8CVVwzmNuqkXqf/MewhW9HDCexfr+RH/9pk6KXVS5ailvSmCQYE02Hes/t6qLwtAc
         4Qcw==
X-Gm-Message-State: AOAM532KpV8HFboGD+e4X497lcCVqnzwxw55JwFsg+xWkU80hxK23bVk
        ZMebv1WdXnBXBdueFZ5A5E2h/Q==
X-Google-Smtp-Source: ABdhPJwj+OVRVnKmsjDw1DYmbunE3T7l8kU39KGFhJEnF6qVIppWsp0LC23v9mPduTbJKz6UchQxqA==
X-Received: by 2002:a17:90a:a890:: with SMTP id h16mr723147pjq.125.1612624143395;
        Sat, 06 Feb 2021 07:09:03 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id f15sm11364222pja.24.2021.02.06.07.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 07:09:02 -0800 (PST)
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
Subject: [PATCH v3 7/8] perf cs-etm: Detect pid in VMID for kernel running at EL2
Date:   Sat,  6 Feb 2021 23:08:32 +0800
Message-Id: <20210206150833.42120-8-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210206150833.42120-1-leo.yan@linaro.org>
References: <20210206150833.42120-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Suzuki K Poulose <suzuki.poulose@arm.com>

The PID of the task could be traced as VMID when the kernel is running
at EL2.  Teach the decoder to look for VMID when the CONTEXTIDR (Arm32)
or CONTEXTIDR_EL1 (Arm64) is invalid but we have a valid VMID.

Cc: Mike Leach <mike.leach@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Al Grant <al.grant@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Co-developed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../perf/util/cs-etm-decoder/cs-etm-decoder.c | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 3f4bc4050477..4052c9ce6e2f 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -6,6 +6,7 @@
  * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
  */
 
+#include <linux/coresight-pmu.h>
 #include <linux/err.h>
 #include <linux/list.h>
 #include <linux/zalloc.h>
@@ -491,13 +492,42 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 			const ocsd_generic_trace_elem *elem,
 			const uint8_t trace_chan_id)
 {
-	pid_t tid;
+	pid_t tid = -1;
+	static u64 pid_fmt;
+	int ret;
 
-	/* Ignore PE_CONTEXT packets that don't have a valid contextID */
-	if (!elem->context.ctxt_id_valid)
+	/*
+	 * As all the ETMs run at the same exception level, the system should
+	 * have the same PID format crossing CPUs.  So cache the PID format
+	 * and reuse it for sequential decoding.
+	 */
+	if (!pid_fmt) {
+		ret = cs_etm__get_pid_fmt(trace_chan_id, &pid_fmt);
+		if (ret)
+			return OCSD_RESP_FATAL_SYS_ERR;
+	}
+
+	/*
+	 * Process the PE_CONTEXT packets if we have a valid contextID or VMID.
+	 * If the kernel is running at EL2, the PID is traced in CONTEXTIDR_EL2
+	 * as VMID, Bit ETM_OPT_CTXTID2 is set in this case.
+	 */
+	switch (pid_fmt) {
+	case BIT(ETM_OPT_CTXTID):
+		if (elem->context.ctxt_id_valid)
+			tid = elem->context.context_id;
+		break;
+	case BIT(ETM_OPT_CTXTID2):
+		if (elem->context.vmid_valid)
+			tid = elem->context.vmid;
+		break;
+	default:
+		break;
+	}
+
+	if (tid == -1)
 		return OCSD_RESP_CONT;
 
-	tid =  elem->context.context_id;
 	if (cs_etm__etmq_set_tid(etmq, tid, trace_chan_id))
 		return OCSD_RESP_FATAL_SYS_ERR;
 
-- 
2.25.1

