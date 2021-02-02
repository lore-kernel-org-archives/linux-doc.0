Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB6FC433E0
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 16:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D87F764F76
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 16:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236742AbhBBQmU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Feb 2021 11:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236763AbhBBQkO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Feb 2021 11:40:14 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD9BC061351
        for <linux-doc@vger.kernel.org>; Tue,  2 Feb 2021 08:39:31 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id i7so15229228pgc.8
        for <linux-doc@vger.kernel.org>; Tue, 02 Feb 2021 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wVDissWO+pr3lHWNAY56dwUwAbHUzsVq+VD+Dj/hDMo=;
        b=SD20DTaNw9uKsphE6CyM6vJODHFXhj9hY2sqGshHptiuSMRZu62tcKIzjmmtNbaxp2
         yRnHHrgekhoMfEZ5fiygysd8bl3lXpKPNbxzhBvXPMx9tFfstpqQ0WYDgSycoRD0qA3U
         wKjdigkdtK7khvyQ7KnclhOr4yXhh0f8EQsx8sHLuu8Ti7qFQOXhH5M9dFAiTr4j6eK2
         G9ru+CXxHDt7dOIHo7Pw6ANHW5FjbqbWEeVV4YbdA+zJiACtjh1/clIXpeU545D7os+Q
         jHPIH9Reh7m/RRPyJ8GoTW3dMaZxWXZZD4eewmBq+AjThzLt4BQL92gHMOJiH0lYHIkB
         p7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wVDissWO+pr3lHWNAY56dwUwAbHUzsVq+VD+Dj/hDMo=;
        b=TX4pc0B0vc2n7mbTmFgX4wxPYMnV7vo+UfUe2VUhQoiv7RSPY9VE533frKVM6dPCj9
         v4Y7GOt8TL5708kah+b4bQkQSZn6QFbgD9JKJTXvyCX0mRt1ltnq1UNaXAkGxXLiLyn8
         lrlqrk3P5j1TU/EFsI8dL9VWV2CAYHRsYYDSXB1J4xBHWVaQYT/a0bdFqR9RVJRU4rbo
         dZUqJcfeZfFr7zSFg+rT3hXHiX2oyyfTurKoxP1oyVxQH635RwhVXGPrZ+sPN6ufsaz0
         uqW+2F1w6zEs6qMgPf4Tlpm709mwfVO6D+hnNgfy+XIHdsN1zlxviZ1UmVP+NShKxE/q
         +frQ==
X-Gm-Message-State: AOAM5319KweLDl7LKlfALzuDZOXtuBDCiY78o4vfZKk8z/xwG3toNwmL
        YNtNQV1GYuJdYf8aXU6jYB+Z/A==
X-Google-Smtp-Source: ABdhPJyX0CddJs3RQuCvOeU/q0m6OM6VUg27/pQaK6A9xFxtYHNihwilzW5A0KwAm/a8qThOG1YRIg==
X-Received: by 2002:a05:6a00:804:b029:1cb:19ad:a485 with SMTP id m4-20020a056a000804b02901cb19ada485mr16506698pfk.50.1612283970660;
        Tue, 02 Feb 2021 08:39:30 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id b203sm22997228pfb.11.2021.02.02.08.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 08:39:30 -0800 (PST)
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
Subject: [PATCH v2 7/7] Documentation: coresight: Add PID tracing description
Date:   Wed,  3 Feb 2021 00:38:42 +0800
Message-Id: <20210202163842.134734-8-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202163842.134734-1-leo.yan@linaro.org>
References: <20210202163842.134734-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

After support the PID tracing for the kernel in EL1 or EL2, the usage
gets more complicated.

This patch gives description for the PMU formats of contextID configs,
this can help users to understand how to control the knobs for PID
tracing when the kernel is in different ELs.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/trace/coresight/coresight.rst | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 0b73acb44efa..771558f22938 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -512,6 +512,43 @@ The --itrace option controls the type and frequency of synthesized events
 Note that only 64-bit programs are currently supported - further work is
 required to support instruction decode of 32-bit Arm programs.
 
+2.2) Tracing PID
+
+When the kernel is running at EL2 with Virtualization Host Extensions (VHE),
+perf records CONTEXTIDR_EL2 in the trace data and can be used as PID when
+decoding; and if the kernel is running at EL1 with nVHE, CONTEXTIDR_EL1 is
+traced for PID.
+
+To support tracing PID for the kernel runs at different exception levels,
+the PMU formats are defined as follow:
+
+  "contextid1": Available on both EL1 kernel and EL2 kernel.  When the
+                kernel is running at EL1, "contextid1" enables the PID
+                tracing; when the kernel is running at EL2, this enables
+                tracing the PID of guest applications.
+
+  "contextid2": Only usable when the kernel is running at EL2.  When
+                selected, enables PID tracing on EL2 kernel.
+
+  "contextid":  Will be an alias for the option that enables PID
+                tracing.  I.e,
+                contextid == contextid1, on EL1 kernel.
+                contextid == contextid2, on EL2 kernel.
+
+The perf tool automatically sets corresponding bit for the "contextid" config,
+therefore, the user doesn't have to bother which EL the kernel is running.
+
+  i.e, perf record -e cs_etm/contextid/u -- uname
+    or perf record -e cs_etm//u -- uname
+
+will always do the "PID" tracing, independent of the kernel EL.
+
+When the kernel is running at EL2 with VHE, if user wants to trace both the
+PIDs for both host and guest, the two configs "contextid1" and "contextid2"
+can be set at the same time:
+
+  perf record -e cs_etm/contextid1,contextid2/u -- uname
+
 
 Generating coverage files for Feedback Directed Optimization: AutoFDO
 ---------------------------------------------------------------------
-- 
2.25.1

