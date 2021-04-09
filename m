Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBE6C433B4
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:37:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64F24610A4
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbhDIKhy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 06:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbhDIKhu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Apr 2021 06:37:50 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B80C061764
        for <linux-doc@vger.kernel.org>; Fri,  9 Apr 2021 03:37:37 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id a4so5149961wrr.2
        for <linux-doc@vger.kernel.org>; Fri, 09 Apr 2021 03:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qp1rtf5vTNCYxLgq97ox1ro8HilwNvlQ34tjmWDteno=;
        b=DK8bsDntN96oRvUkF9iEDcAceSeWoIcgxD+QOlopBiQ/wuGreTAxX14IbOQZ8a5i40
         tNL9N8hEJRyjMCzVxdPZhUhM9bcGMb26Sl1R6Ib9ngMxhOGDxl7o6WSKYp31JPYH0b89
         16XwlA9oZ7HdIDqVXI7vjJTvk5qdcQ4rNXXxGy+X637XrUYtMNVjhjZFXkRsTPOVrdgr
         hoC7A/Vn00+SP79Cbc/hsmVThCHTzC8Bwv3fcXaZhGLDZXDaTySxM64vs3zoPrNkvh+T
         +tQUC36+cPI1376sxz9/Tbly1f8k047MPHxfb0XjZ3+qceJmLcfKjPFnlyGCbGvUPPC5
         0waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Qp1rtf5vTNCYxLgq97ox1ro8HilwNvlQ34tjmWDteno=;
        b=qKzRLVKFqHaRAqQDZhC22exQtHj+pvCIBZhP93bYiZAaZYvalLIMVfo4kYPH3tcO/0
         XBkJu57/DNy42fu0ErS86E/okhOgV9Mqu/aZTHwe7Zj4vUyAjlWVeXVegIb20PdL6ANX
         d3HDESOg4PTe6gPvCHDlnd98qa2OJEkJV0x35reAIX2ftIgAka0T3+vokzHJinUYqdaP
         bkf6MHQrAEGAk8/XQlNN52YRAnzh7piNQivLMN3mog2y9L3pKvH6MQ9qeO5qy8nokkWw
         O63HPick/bSv/Oswt0AVT3ioqpV+YOQjRZfarkIuNtQqDEjZIZ8giklY8Fw7+ZWL8Nps
         xf6w==
X-Gm-Message-State: AOAM530o/FKPdwvPD6P5mnPxyvFm5ZbTcc07jPdi2Gl/P8Hftrigm+xg
        mRw1KBlN2FZofwjbwKFT34u9oQ==
X-Google-Smtp-Source: ABdhPJz7V8dFxlm9+ChNTIOoyYI7hSdLsVhYqkUY4KZxO3f4cGVfSTY65g1HbYj0aarYOuOnivVE/w==
X-Received: by 2002:a5d:6d05:: with SMTP id e5mr16284801wrq.324.1617964656304;
        Fri, 09 Apr 2021 03:37:36 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6809:2201:20a6:106c:24d6:628])
        by smtp.gmail.com with ESMTPSA id w7sm4087650wro.43.2021.04.09.03.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:37:35 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        mathieu.poirier@linaro.org, linux-doc@vger.kernel.org,
        suzuki.poulose@arm.com
Cc:     yabinc@google.com, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, tingwei@codeaurora.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v6 06/10] coresight: etm-perf: Update to activate selected configuration
Date:   Fri,  9 Apr 2021 11:37:18 +0100
Message-Id: <20210409103722.26290-7-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409103722.26290-1-mike.leach@linaro.org>
References: <20210409103722.26290-1-mike.leach@linaro.org>
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

