Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E27C433DB
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 313F564E67
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhBFPL0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Feb 2021 10:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhBFPKa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Feb 2021 10:10:30 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92F8C06121E
        for <linux-doc@vger.kernel.org>; Sat,  6 Feb 2021 07:09:07 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id b8so5063768plh.12
        for <linux-doc@vger.kernel.org>; Sat, 06 Feb 2021 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zR9OsHslqhDG8eEUn6PBh2UQCbLLHkueVjbLue/1gyw=;
        b=AV089iQbfYZ3TEy26MlPZup2jvRdzw8UeMiOT5DYlDKCUfo45ZRXr1Te83bx7xjrpW
         zYreHLal6AkzgRP6eAX8eFKgtRktEExoHJRp6QzX06KU6+qmcivjCzF6LmMA520b/w3w
         zR8C9JGpC/XKXKZWpy4O0SuV7a9YXsWAK4B42+B2OzYM/qmxDHWxGbnz3FCylG1qIajT
         T+XaYAVsIPQWzXGMlRL3eluLC16/EslSDKwyM+VYmWElB+9rxoKLpa26008X0O2SltHi
         6/S6D2pyeyZHyXrvly/Jj2fkGInXY5lDx/rk+d3rXz8N/jWzA3OrjCoZer26flpUhIEJ
         mLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zR9OsHslqhDG8eEUn6PBh2UQCbLLHkueVjbLue/1gyw=;
        b=VZulVvy7s780WkpigNuyE8vbZCyzF7cguhixyfRxnDQFxLp+BT7/EhgglD1PPY56aK
         xSSGrTWy2RzHLS7aSvNxsAUdj0y7wRvF/vYNuLjyBDEffxLi3bWyySy/9PuCiySl/pOw
         +aOTYcSmx/B4BuWlppQaIqvt2zoJj/dkePfW6G8GNPdCX4rADPtUmCfou7dAtGSYC6em
         2WiIjzKP+ZVVJAer8i5gWftYx6pcZJ7zaZe+HNDSLuRaYAst29el/Vbkpw2/Lhnrc7R/
         bhS7Yqq+kzaEYkAVDl5G32qD1YCQMvyhxeKF1J5ihHVOke6RwGwAIiKFK2hSU33hXiV0
         KaNQ==
X-Gm-Message-State: AOAM531UEm9B7eGfAepTvf3uHZY0Jwg2oD6TaQxbmZDxChxCcNicso2q
        CBAMdfGxyWfZogZCPfWb5zun7w==
X-Google-Smtp-Source: ABdhPJzHhRA/YCVn3C/SiFaht017M5NJCA/gir1VRykF39YQux9zfgwsSmliQIrr6ITzG42+/VQvFQ==
X-Received: by 2002:a17:90b:4d06:: with SMTP id mw6mr8656415pjb.24.1612624147404;
        Sat, 06 Feb 2021 07:09:07 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id v4sm11797312pjt.4.2021.02.06.07.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 07:09:06 -0800 (PST)
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
Subject: [PATCH v3 8/8] Documentation: coresight: Add PID tracing description
Date:   Sat,  6 Feb 2021 23:08:33 +0800
Message-Id: <20210206150833.42120-9-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210206150833.42120-1-leo.yan@linaro.org>
References: <20210206150833.42120-1-leo.yan@linaro.org>
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
 Documentation/trace/coresight/coresight.rst | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 0b73acb44efa..169749efd8d1 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -512,6 +512,38 @@ The --itrace option controls the type and frequency of synthesized events
 Note that only 64-bit programs are currently supported - further work is
 required to support instruction decode of 32-bit Arm programs.
 
+2.2) Tracing PID
+
+The kernel can be built to write the PID value into the PE ContextID registers.
+For a kernel running at EL1, the PID is stored in CONTEXTIDR_EL1.  A PE may
+implement Arm Virtualization Host Extensions (VHE), which the kernel can
+run at EL2 as a virtualisation host; in this case, the PID value is stored in
+CONTEXTIDR_EL2.
+
+perf provides PMU formats that program the ETM to insert these values into the
+trace data; the PMU formats are defined as below:
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
+perf will always enable PID tracing at the relevant EL, this is accomplished by
+automatically enable the "contextid" config - but for EL2 it is possible to make
+specific adjustments using configs "contextid1" and "contextid2", E.g. if a user
+wants to trace PIDs for both host and guest, the two configs "contextid1" and
+"contextid2" can be set at the same time:
+
+  perf record -e cs_etm/contextid1,contextid2/u -- vm
+
 
 Generating coverage files for Feedback Directed Optimization: AutoFDO
 ---------------------------------------------------------------------
-- 
2.25.1

