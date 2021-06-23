Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1152DC48BE5
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 04:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E73EA6135A
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 04:25:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhFWE11 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 00:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhFWE10 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Jun 2021 00:27:26 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD839C061756
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 21:25:08 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id d12so666138pgd.9
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 21:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IsYDkx5V1mJjZwOsL/IXqLmlqBdgt7SKxZu32NLqyoA=;
        b=KoW+3L+nAzHaFgbRElzs5uOdutafEIWxBC8B5+GDKPJmQleXVfldK7z7iqfjfcts1Q
         rPL0kfSafE8oFpk6vrVZuNwIRU6AgR8g80QroxtsUVS3fgsrxmhUjcHJybPvXNrlECFn
         AAucYr0aZJMlHLGw09t3jUjQgj2XGLYNcQaGeuAUDeAoyhWbX1LrqiB6kBBDGV/8z/CN
         ++aB+n41chkQUj2WNQ3WqdialMd1lKj6yKzDF0hXvNUGzITEYsvfRPlJpIra4FVwPNQk
         b7US4tsXnrqo0EG6dj8k2TY/Ebg3EXPdt97zdZ9/IXIIO+2y6YkdmcBVH7hSDt3Fb6qh
         gNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IsYDkx5V1mJjZwOsL/IXqLmlqBdgt7SKxZu32NLqyoA=;
        b=hnX2TTKFdfJ0pb55sIXTLr4wzgi75T8ullc730j6f4hC2JajV1FD/CqAfg+lLHaPpy
         bcCdDQHIih2XOBczEiKwmdj91Q7wfqUcUMeq2ekubY0tDFz7ULYhpAsiWpchBY6XV1SK
         fLb0cajPm266rqbI3BoMSpUXOpG41MI1/B2fodmUB+G++4djg1MPIYj7y/pOaAa9I6lF
         kTrCYylVEJ2rsDmGvRW9b+kfDAU12BVfJhRSq5QQ7eaCZajmoex5GNFiuZ27ah40lrVl
         Raq8UNwxI863oE03vOq/Z7bMqY1z22TD7r0e9NcvmiNxdkbp8p+E2PzZQBgeg4hvy6rr
         qjHQ==
X-Gm-Message-State: AOAM530l92MxuCk7zV0CyIdk29Fzd11x8epXvrZ0PHBX7BTmZSqp+VxU
        aRlte9aPLS8WhjGsfgEFBEeOXA==
X-Google-Smtp-Source: ABdhPJykxyALIdJtvZ3O3tAzyqaObMPTohAMm6rjwil0SUh9TpEoeEcPD3F2IEayX6QLESd2Wz/U6g==
X-Received: by 2002:a63:5743:: with SMTP id h3mr1946424pgm.362.1624422308452;
        Tue, 22 Jun 2021 21:25:08 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id u11sm3770311pjf.46.2021.06.22.21.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 21:25:08 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V4 4/4] cpufreq: Remove stop_cpu() callback
Date:   Wed, 23 Jun 2021 09:54:42 +0530
Message-Id: <56e8fadcecf014ef0786499fbf4e93975b123483.1624421816.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1624421816.git.viresh.kumar@linaro.org>
References: <cover.1624421816.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now that all users of stop_cpu() are migrated to use other callbacks,
lets remove its support from the core.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/cpu-freq/cpu-drivers.rst                    | 3 ---
 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 3 ---
 drivers/cpufreq/cpufreq.c                                 | 3 ---
 include/linux/cpufreq.h                                   | 1 -
 4 files changed, 10 deletions(-)

diff --git a/Documentation/cpu-freq/cpu-drivers.rst b/Documentation/cpu-freq/cpu-drivers.rst
index a697278ce190..74fac797c396 100644
--- a/Documentation/cpu-freq/cpu-drivers.rst
+++ b/Documentation/cpu-freq/cpu-drivers.rst
@@ -71,9 +71,6 @@ And optionally
  .exit - A pointer to a per-policy cleanup function called during
  CPU_POST_DEAD phase of cpu hotplug process.
 
- .stop_cpu - A pointer to a per-policy stop function called during
- CPU_DOWN_PREPARE phase of cpu hotplug process.
-
  .suspend - A pointer to a per-policy suspend function which is called
  with interrupts disabled and _after_ the governor is stopped for the
  policy.
diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
index 0ca2cb646666..9570e9c9e939 100644
--- a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
@@ -76,9 +76,6 @@ 并且可选择
  .exit - 一个指向per-policy清理函数的指针，该函数在cpu热插拔过程的CPU_POST_DEAD
  阶段被调用。
 
- .stop_cpu - 一个指向per-policy停止函数的指针，该函数在cpu热插拔过程的CPU_DOWN_PREPARE
- 阶段被调用。
-
  .suspend - 一个指向per-policy暂停函数的指针，该函数在关中断且在该策略的调节器停止
  后被调用。
 
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index cbab834c37a0..5e4b5316d254 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1606,9 +1606,6 @@ static int cpufreq_offline(unsigned int cpu)
 		policy->cdev = NULL;
 	}
 
-	if (cpufreq_driver->stop_cpu)
-		cpufreq_driver->stop_cpu(policy);
-
 	if (has_target())
 		cpufreq_exit_governor(policy);
 
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 353969c7acd3..2e2267a36502 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -371,7 +371,6 @@ struct cpufreq_driver {
 	int		(*online)(struct cpufreq_policy *policy);
 	int		(*offline)(struct cpufreq_policy *policy);
 	int		(*exit)(struct cpufreq_policy *policy);
-	void		(*stop_cpu)(struct cpufreq_policy *policy);
 	int		(*suspend)(struct cpufreq_policy *policy);
 	int		(*resume)(struct cpufreq_policy *policy);
 
-- 
2.31.1.272.g89b43f80a514

