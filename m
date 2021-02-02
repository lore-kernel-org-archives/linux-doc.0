Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A95AC433E0
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 16:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F04AD64F76
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 16:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236761AbhBBQmZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Feb 2021 11:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236758AbhBBQkI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Feb 2021 11:40:08 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5577C0617A9
        for <linux-doc@vger.kernel.org>; Tue,  2 Feb 2021 08:39:27 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id z9so2716407pjl.5
        for <linux-doc@vger.kernel.org>; Tue, 02 Feb 2021 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AW8CUVNikpRcfCmlQlkKe+p5l74C17GQZxwOIyIje8c=;
        b=sMKh1VDH4XQ4uNnZpqULVrGrFKyOK1UHUpKnfFvXTOF3DOv9YSlI9v6+EmTG0URk+l
         rgGFfFLLVSaG+OEpsBqycNJbn8F9JqbeqMjqGb0rmumIlH8fyKWbRJyDIDELigIpcO4w
         5cREhHhVvKMluIKxx42crdk0aK9EZboWm0iPJf3UXxHwYXaE5xn56CweqY2pgCNXtl+X
         Vxx8cyYOBSMFpXmaV8El/CuAxnbm1URG1gZqjYplOQ9ZfJM2h7WZNc09u6Cx/l8NRGuj
         wyZ9KmWRn1CkaL1OHazf6SXbaf305m92NECrvoj8fiJtk9pC3vSAv2oD+XOUCbRCXvYV
         oRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AW8CUVNikpRcfCmlQlkKe+p5l74C17GQZxwOIyIje8c=;
        b=dBUToXWLr2dGxA5eUTcCEgnuNdvNTjVbvsnYmhGvqKOpIt+fa1lzjP4r/UAIgduZwl
         pwgYTWwhgUMddJVHBvA/PMmH9qbQVpJeix6eksNeb5ldSo2PZnN03mPXf8+QG1NvmJYt
         kmZQiykPw+rdbL86EWs+BLelkzmbEhTE6eX7mlHJAWgjG7WUqizopIikXKU1yHEm1h7E
         /JQ35IdRvTAUlZlYdzJnkFmsBURWi1j1gbqfo21gyxT96yEdnhjHZupSIlliPxgsyzQt
         H8NNAP1A98B0PNOE0jZtulS6uZJQPM3tzSo25M3G0HWXysELx7D94MIgo3Y0VzaUpcZ7
         +ZJA==
X-Gm-Message-State: AOAM531z2x+bbz3JXdaj5ZMC7nGaq5qQQncUZ6l9QO0er8DqE7cQ+1iA
        iTAT7CJqUpEuKJglFcdwGF91kw==
X-Google-Smtp-Source: ABdhPJxiAKNBNJDKgM6MXUFZjUxFiAN8UPHm4njx5CDHH1RDm+7QarExdpmAQyLvyYB9j3cl7Xcduw==
X-Received: by 2002:a17:90b:1a8b:: with SMTP id ng11mr5468385pjb.160.1612283967292;
        Tue, 02 Feb 2021 08:39:27 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id x3sm23344320pfp.98.2021.02.02.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 08:39:26 -0800 (PST)
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
Cc:     Al Grant <al.grant@arm.com>, Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 6/7] perf cs-etm: Detect pid in VMID for kernel running at EL2
Date:   Wed,  3 Feb 2021 00:38:41 +0800
Message-Id: <20210202163842.134734-7-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202163842.134734-1-leo.yan@linaro.org>
References: <20210202163842.134734-1-leo.yan@linaro.org>
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
Co-developed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../perf/util/cs-etm-decoder/cs-etm-decoder.c | 32 ++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 3f4bc4050477..fb2a163ff74e 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -6,6 +6,7 @@
  * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
  */
 
+#include <linux/coresight-pmu.h>
 #include <linux/err.h>
 #include <linux/list.h>
 #include <linux/zalloc.h>
@@ -491,13 +492,36 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 			const ocsd_generic_trace_elem *elem,
 			const uint8_t trace_chan_id)
 {
-	pid_t tid;
+	pid_t tid = -1;
+	u64 pid_fmt;
+	int ret;
 
-	/* Ignore PE_CONTEXT packets that don't have a valid contextID */
-	if (!elem->context.ctxt_id_valid)
+	ret = cs_etm__get_pid_fmt(trace_chan_id, &pid_fmt);
+	if (ret)
+		return OCSD_RESP_FATAL_SYS_ERR;
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
+	case BIT(ETM_OPT_CTXTID2) | BIT(ETM_OPT_CTXTID):
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

