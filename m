Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30B1C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 19:19:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8134661179
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 19:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353220AbhDNTTp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 15:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353230AbhDNTTe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 15:19:34 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534A2C061761
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:19:12 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id c15so11978261wro.13
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qp1rtf5vTNCYxLgq97ox1ro8HilwNvlQ34tjmWDteno=;
        b=yz3jNvqKpyMyEfgR81XsaWyGFfxC77h2/q4tnUpvVy1V80bTfLwd6chrspXEkrxvFU
         VAOBD+Tb27lAvw3ipOMRkbVzSn89z477PTtJhgVFxHDiL3euYLTqOxtXfnn99Fc/NJYT
         T3RbZHtofcibb2rM3XUqclT5y/yy9LilKmV4ivIx1MvfhYi7NKdMpIE+gOdu1pbDFPAl
         EfUEMk4tzY7ASCae5ciJAxHNqsMLkDnq9ljXczMr+DH3f7b8ZCstWoDXAzfKTROkMIzH
         WQLJTGh+GLCiWeH6vngUkiNkB4GpTkStXDJd2eYhlClI5RhFEnwOVdFm8iBEmYHa/4LF
         KM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Qp1rtf5vTNCYxLgq97ox1ro8HilwNvlQ34tjmWDteno=;
        b=KDh2v5/U7nYBA5IumQVqbrQhelfHJWRPzWFbGkN/zGSVRSsf609bcuQ8yeaZvxe4ka
         6umzEfoyi4iFhGR6qgla1fMrrwgrz8d79Rs4bSHX0u5yDb2D4wlSAKAvwYTTTyYBksdh
         MUDiEpzECIh453Vl6VDufBlI2WBc+f2euDKKPxOlVDqMVdd+SjZHV6ObyuCTSSy9+r3r
         b87KKIbvm3J7XSc9/c7Axv5LACJ2wv3jptTvMDK+4qPXbxszORcfZ6xI5muKoFX2d+m7
         7lquJ5wMH7KZfRIgUl6SzlsYXwGRmfW6wZnLoJ8r5EnPrPW4FRJPsVB9vT7I+ZOrs+UR
         hVNw==
X-Gm-Message-State: AOAM533VI/ly9n0Fh909d27zRETkj6JpFurMicOKjzAFDKv5TEuxUDvw
        XAY2QRVASy6oxCo2BBjX8GMI+GuhyfhPkQ==
X-Google-Smtp-Source: ABdhPJwq1IQoqE7/mmybFnQ9IpYRleea4gq55kbZKh4LVZhLh5cQ9efS2H/C4DTU95M15AYAxU+IMA==
X-Received: by 2002:adf:fdca:: with SMTP id i10mr23520500wrs.55.1618427951061;
        Wed, 14 Apr 2021 12:19:11 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6809:2201:546d:7d59:1703:bf96])
        by smtp.gmail.com with ESMTPSA id a3sm327073wru.40.2021.04.14.12.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 12:19:10 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        mathieu.poirier@linaro.org, linux-doc@vger.kernel.org,
        suzuki.poulose@arm.com
Cc:     yabinc@google.com, corbet@lwn.net, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, tingwei@codeaurora.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 06/10] coresight: etm-perf: Update to activate selected configuration
Date:   Wed, 14 Apr 2021 20:18:59 +0100
Message-Id: <20210414191903.18349-7-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210414191903.18349-1-mike.leach@linaro.org>
References: <20210414191903.18349-1-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add calls to activate the selected configuration as perf starts
and stops the tracing session.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 14 +++++++++++++-
 drivers/hwtracing/coresight/coresight-etm-perf.h |  2 ++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 26b4bca156aa..560baefdfed8 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -215,6 +215,10 @@ static void free_event_data(struct work_struct *work)
 	/* Free the sink buffers, if there are any */
 	free_sink_buffer(event_data);
 
+	/* clear any configuration we were using */
+	if (event_data->cfg_hash)
+		cscfg_deactivate_config(event_data->cfg_hash);
+
 	for_each_cpu(cpu, mask) {
 		struct list_head **ppath;
 
@@ -292,7 +296,7 @@ static bool sinks_compatible(struct coresight_device *a,
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
-	u32 id;
+	u32 id, cfg_hash;
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
@@ -310,6 +314,14 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		sink = user_sink = coresight_get_sink_by_id(id);
 	}
 
+	/* check if user wants a coresight configuration selected */
+	cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
+	if (cfg_hash) {
+		if (cscfg_activate_config(cfg_hash))
+			goto err;
+		event_data->cfg_hash = cfg_hash;
+	}
+
 	mask = &event_data->mask;
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index ba617fe2217e..468f7799ab4f 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -49,12 +49,14 @@ struct etm_filters {
  * @work:		Handle to free allocated memory outside IRQ context.
  * @mask:		Hold the CPU(s) this event was set for.
  * @snk_config:		The sink configuration.
+ * @cfg_hash:		The hash id of any coresight config selected.
  * @path:		An array of path, each slot for one CPU.
  */
 struct etm_event_data {
 	struct work_struct work;
 	cpumask_t mask;
 	void *snk_config;
+	u32 cfg_hash;
 	struct list_head * __percpu *path;
 };
 
-- 
2.17.1

