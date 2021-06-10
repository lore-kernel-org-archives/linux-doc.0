Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0019AC48BD1
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 08:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6DC861429
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 08:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhFJI0b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 04:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbhFJI02 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 04:26:28 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663F8C0617A6
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 01:24:21 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id d5-20020a17090ab305b02901675357c371so3298586pjr.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CWh1Aokcvj2UQLotNOEP1WcKgv5ApFMcJuxcuwZzDnY=;
        b=yfdQVopR5TI3meR02dYmXSyInvDr/3fhuuTS2PsKDcsKLC6x8NTEx3quKD6H2xTcyr
         hXwuuTiL2kCbiS5eVHWLzGnZEc3Ks6Q9Fa08m2lXkTLq1ygZ1WmoqMyyEWR+BX2eBHbe
         WX7pdOLNlu2PT45ePAJlWjm2y8tido3FmiO+ZknmtSDKH5fJbtc37Mnrx2IFMvCJTLVq
         bb+dnqC9aHYa3n3L9GqoKHCTPCmU25TD2GEwd5xUbqdV2hetEL+edqptR8vQWLscui2W
         lX2APi+adydBdmwI3t9qFgYUSXyzCHb91KzFb4+/dffecVL2MjhHgOvg39lq6UXspvqO
         W2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CWh1Aokcvj2UQLotNOEP1WcKgv5ApFMcJuxcuwZzDnY=;
        b=NMYc1qygiJO/cx5q9dr7L4C4eHykMu+8Q6+gvMpnBqrH6w5YjE1fammv7Nx/LDrYDz
         UqHs+I42J0wsmlHREnz/Ipf3SzJnpXQXJt9Hg0jnjKJnibOQRdGoZlSvQMYCgC5C+iPp
         YjygOFwZZZ5JIvtoHcfFza7onRv07eCExl+ZiS+jhKj7TFQJEeIZrdvasXLTk+ziFbRl
         kQUw39/xX9wAnhsJ2DxFUbWLX5TpT1Mh2U8qyAgR6GvioW6+9ks6ORdlVO/GTZVCDA+l
         /LklxqXovfD/b8I+YnXxTjSi/JbEiPESFBYybxJOsZJAIQrriXWlUTYmLzc2lg7YhVVt
         vfxw==
X-Gm-Message-State: AOAM533P/J/JjQvgaetT0Ha7BMZQD8yfgqWHcM7RcSErw3kUhBbBJBso
        a3yegwswJWm886zJiMhg5Cskbw==
X-Google-Smtp-Source: ABdhPJyaaDXr8g7kkcXGZv4NNDc5gQjlEQI1ewN+YWmwgslYfZxiziQFr5nDp23V0bWGIf5Xfv9FDA==
X-Received: by 2002:a17:902:a3c3:b029:f0:b297:7778 with SMTP id q3-20020a170902a3c3b02900f0b2977778mr3939702plb.16.1623313460999;
        Thu, 10 Jun 2021 01:24:20 -0700 (PDT)
Received: from localhost ([136.185.169.128])
        by smtp.gmail.com with ESMTPSA id s3sm2120419pgs.62.2021.06.10.01.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 01:24:20 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Qian Cai <quic_qiancai@quicinc.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] cpufreq: Add start_cpu() and stop_cpu() callbacks
Date:   Thu, 10 Jun 2021 13:54:00 +0530
Message-Id: <1d1c3ee64c0a5a701c8d7c66440fd2781512432c.1623313323.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1623313323.git.viresh.kumar@linaro.org>
References: <cover.1623313323.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On CPU hotplug, the cpufreq core doesn't call any driver specific
callback unless all the CPUs of a policy went away.

There is need for a callback to be called in such cases (for the CPPC
cpufreq driver) now. Reuse the existing stop_cpu() callback and add a
new one for start_cpu().

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/cpu-freq/cpu-drivers.rst |  7 +++++--
 drivers/cpufreq/cpufreq.c              | 11 ++++++++---
 include/linux/cpufreq.h                |  5 ++++-
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/cpu-freq/cpu-drivers.rst b/Documentation/cpu-freq/cpu-drivers.rst
index a697278ce190..15cfe42b4075 100644
--- a/Documentation/cpu-freq/cpu-drivers.rst
+++ b/Documentation/cpu-freq/cpu-drivers.rst
@@ -71,8 +71,11 @@ And optionally
  .exit - A pointer to a per-policy cleanup function called during
  CPU_POST_DEAD phase of cpu hotplug process.
 
- .stop_cpu - A pointer to a per-policy stop function called during
- CPU_DOWN_PREPARE phase of cpu hotplug process.
+ .start_cpu - A pointer to a per-policy per-cpu start function called
+ during CPU online phase.
+
+ .stop_cpu - A pointer to a per-policy per-cpu stop function called
+ during CPU offline phase.
 
  .suspend - A pointer to a per-policy suspend function which is called
  with interrupts disabled and _after_ the governor is stopped for the
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 802abc925b2a..fac2522be5c3 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1119,6 +1119,10 @@ static int cpufreq_add_policy_cpu(struct cpufreq_policy *policy, unsigned int cp
 
 	cpumask_set_cpu(cpu, policy->cpus);
 
+	/* Do CPU specific initialization if required */
+	if (cpufreq_driver->start_cpu)
+		cpufreq_driver->start_cpu(policy, cpu);
+
 	if (has_target()) {
 		ret = cpufreq_start_governor(policy);
 		if (ret)
@@ -1581,6 +1585,10 @@ static int cpufreq_offline(unsigned int cpu)
 		policy->cpu = cpumask_any(policy->cpus);
 	}
 
+	/* Do CPU specific de-initialization if required */
+	if (cpufreq_driver->stop_cpu)
+		cpufreq_driver->stop_cpu(policy, cpu);
+
 	/* Start governor again for active policy */
 	if (!policy_is_inactive(policy)) {
 		if (has_target()) {
@@ -1597,9 +1605,6 @@ static int cpufreq_offline(unsigned int cpu)
 		policy->cdev = NULL;
 	}
 
-	if (cpufreq_driver->stop_cpu)
-		cpufreq_driver->stop_cpu(policy);
-
 	if (has_target())
 		cpufreq_exit_governor(policy);
 
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 353969c7acd3..c281b3df4e2f 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -371,7 +371,10 @@ struct cpufreq_driver {
 	int		(*online)(struct cpufreq_policy *policy);
 	int		(*offline)(struct cpufreq_policy *policy);
 	int		(*exit)(struct cpufreq_policy *policy);
-	void		(*stop_cpu)(struct cpufreq_policy *policy);
+
+	/* CPU specific start/stop */
+	void		(*start_cpu)(struct cpufreq_policy *policy, unsigned int cpu);
+	void		(*stop_cpu)(struct cpufreq_policy *policy, unsigned int cpu);
 	int		(*suspend)(struct cpufreq_policy *policy);
 	int		(*resume)(struct cpufreq_policy *policy);
 
-- 
2.31.1.272.g89b43f80a514

