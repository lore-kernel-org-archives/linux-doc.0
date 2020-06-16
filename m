Return-Path: <SRS0=G1XG=75=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08092C433DF
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD37420679
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0rebMc3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgFPQkQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729557AbgFPQkO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jun 2020 12:40:14 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3628C06174E
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:13 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id p5so21450600wrw.9
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0oSmh9OEc1CJ9Wkcu4JKPKk4wvUEYD5z+Ymo2CQ2Vt4=;
        b=F0rebMc3rOizhdJuI8CgmWTQ3eAJkyz5CmJOOYVkQ3DnZBRCJYzp2lHMpJ/AU5ork9
         ltIPLTxAXldQHZQbkELam6jVX6pYOVn1JEEZhyGBpcFbKoGAFAg3LAN4x6Dhorbs2mo1
         pB2XH/Su4Kqntmi5QO722jEneBWNi30iZKo7TfeZP2a8dFrT2yJYgwFixM4r7jGpyQFx
         r2SzqZs43CRr8Wv1cn0ArNrZws+udWNtBrXwSFxnRJMleAv9gTsYPsQNCE+T7nQo7Ev2
         4be+khpE6TnqjUd+8vC5NFjwuGWUNCLQRa3E+3tOIDdfOVRNflk5R7/i7bcvHNjmSA8W
         F1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0oSmh9OEc1CJ9Wkcu4JKPKk4wvUEYD5z+Ymo2CQ2Vt4=;
        b=iCJQmKtHAFpEAHch/rZQzzf6qwudKAySx/pvTfb9Y7+mEezyWirQtN7QtGB9f+tzQN
         pmgIqp6ciYKfB0XSwQLTJbX1UOEGGa00d+j4mibS5rj4KoKqjGUtwnNMvQ29vJEOkdh6
         PvzizjjHu79isVfxRoO350d3Zt7PBO5AflYYc8px69/vQ6EwhgwkQSpnjKOD1hhehc7R
         r25k1DKf5RZ9iYuhp8u2uN40EKcSB8R1hfdNLaWcwFGrXk4fx62OEaf9KDLWofuVikIv
         OdHI6zIAY3SfkK2wqbTvxn3+XAATuiFi6gtMGgQXOw8TbSFOeusQJZpGLZM4cLvBND6e
         l2MQ==
X-Gm-Message-State: AOAM532FIvh0SAVO8WtZHZtaG0zzO3HaBQGzPJQO2ypHewjOOuK4RKye
        rtdH+Ez6ipEoXKPuTInXuVy4+w==
X-Google-Smtp-Source: ABdhPJxl5HlrXeboRVSj/nKHxJBCP6/rO3oFed/D0Vjmmhe0Mj3mXCjfA93JBbvEMF4LwI4rDDexjA==
X-Received: by 2002:a5d:4e45:: with SMTP id r5mr3014189wrt.92.1592325612513;
        Tue, 16 Jun 2020 09:40:12 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6801:1801:dc9e:c297:59e5:dbd9])
        by smtp.gmail.com with ESMTPSA id g82sm4843866wmf.1.2020.06.16.09.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 09:40:11 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        coresight@lists.linaro.org, mathieu.poirier@linaro.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 3/5] coresight: etm: perf: Add default sink selection to etm perf.
Date:   Tue, 16 Jun 2020 17:40:04 +0100
Message-Id: <20200616164006.15309-4-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616164006.15309-1-mike.leach@linaro.org>
References: <20200616164006.15309-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add default sink selection to the perf trace handling in the etm driver.
Uses the select default sink infrastructure to select a sink for the perf
session, if no other sink is specified.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 .../hwtracing/coresight/coresight-etm-perf.c    | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 84f1dcb69827..1a3169e69bb1 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -226,9 +226,6 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		sink = coresight_get_enabled_sink(true);
 	}
 
-	if (!sink)
-		goto err;
-
 	mask = &event_data->mask;
 
 	/*
@@ -253,6 +250,16 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 			continue;
 		}
 
+		/*
+		 * No sink provided - look for a default sink for one of the
+		 * devices. At present we only support topology where all CPUs
+		 * use the same sink [N:1], so only need to find one sink. The
+		 * coresight_build_path later will remove any CPU that does not
+		 * attach to the sink, or if we have not found a sink.
+		 */
+		if (!sink)
+			sink = coresight_find_default_sink(csdev);
+
 		/*
 		 * Building a path doesn't enable it, it simply builds a
 		 * list of devices from source to sink that can be
@@ -267,6 +274,10 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		*etm_event_cpu_path_ptr(event_data, cpu) = path;
 	}
 
+	/* no sink found for any CPU - cannot trace */
+	if (!sink)
+		goto err;
+
 	/* If we don't have any CPUs ready for tracing, abort */
 	cpu = cpumask_first(mask);
 	if (cpu >= nr_cpu_ids)
-- 
2.17.1

