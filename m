Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1FD827E892
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Mar 2018 03:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752803AbeC3DQM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 23:16:12 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:44473 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752728AbeC3DQK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Mar 2018 23:16:10 -0400
Received: by mail-wr0-f196.google.com with SMTP id u46so6969892wrc.11
        for <linux-doc@vger.kernel.org>; Thu, 29 Mar 2018 20:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Q2kDM5YY0TwXhvJ2W20sii7DcFnE2eb+0roImoIBLhE=;
        b=GMNqn4QNPZXZgme8ePFR/DJMWeGcXC9pfBLGKxc8Mz3yfap/sCbEP1P+fm/TwPFf98
         PSE/aUa17YScshfBnO9QWfqbmV1jsMnGuT62Tl7kKpNFrMfZgRiMAnudRwju5ZGj222D
         1xpXEnyk2ICSOukguQsmIDSdGrzsQbIhGEZKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Q2kDM5YY0TwXhvJ2W20sii7DcFnE2eb+0roImoIBLhE=;
        b=EzeE/ToaweWIHRNyrxYJhrOHdFtxsyIzVgcnuu+jsrWVHS808+c5znKYtuIDi6LmKD
         ax9Zc87omD5zr12Ial9Slji0rFew0MqjOmLrzU79jExf0gfQ+nfUitizpZFqiCUHp4oZ
         xKQsLYl4cnvHfJm0x4GOCWpTJdmOgrYAyhE8U4/Gw2jWu9NL8ARy3LGg5bKwedKwSZ9O
         BwdwCcR4aeygMod3WHsBTWcBbI1ymGc6hOax25ESRqFMHAPDVqg8wXOOmLO1+c+0uiCV
         1satjktd6BgxdqttwQs1wJex/vEZvPVfE/UZ1YPv3AFj+G8AkZ8AIeuXCPcplsHJGeln
         tHng==
X-Gm-Message-State: AElRT7FbkhUWptws86oiLUZHWpDkW0B9YP2kJGueX6d3sVKStzP8om+C
        VOPCQNbNz2YTWbxTM7Rza5nTXw==
X-Google-Smtp-Source: AIpwx4/Hx8k47AgYUFTHesg40c/ixXuEBaOkWFXadUEmF3FYWomfV2Ez+AlODfglrazTqGUzpTHqcA==
X-Received: by 10.223.227.73 with SMTP id n9mr8011978wrj.134.1522379769345;
        Thu, 29 Mar 2018 20:16:09 -0700 (PDT)
Received: from localhost.localdomain (li622-172.members.linode.com. [212.71.249.172])
        by smtp.gmail.com with ESMTPSA id z9sm12798903wrz.4.2018.03.29.20.16.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 29 Mar 2018 20:16:08 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        Kim Phillips <kim.phillips@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 5/6] coresight: Set and clear sink device handler for kdump node
Date:   Fri, 30 Mar 2018 11:15:23 +0800
Message-Id: <1522379724-30648-6-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
References: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If Coresight path is enabled for specific CPU, the sink device handler
need to be set to kdump node; on the other hand we also need to clear
sink device handler when path is disabled.

This patch sets sink devices handler for kdump node for two separate
Coresight enabling modes: CS_MODE_SYSFS and CS_MODE_PERF; and clear the
handler when Coresight is disabled.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c |  5 +++++
 drivers/hwtracing/coresight/coresight.c          | 16 ++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 8a0ad77..f8b159c 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -139,6 +139,8 @@ static void free_event_data(struct work_struct *work)
 	for_each_cpu(cpu, mask) {
 		if (!(IS_ERR_OR_NULL(event_data->path[cpu])))
 			coresight_release_path(event_data->path[cpu]);
+
+		coresight_kdump_sink(cpu, NULL);
 	}
 
 	kfree(event_data->path);
@@ -238,6 +240,9 @@ static void *etm_setup_aux(int event_cpu, void **pages,
 		event_data->path[cpu] = coresight_build_path(csdev, sink);
 		if (IS_ERR(event_data->path[cpu]))
 			goto err;
+
+		if (coresight_kdump_sink(cpu, sink))
+			goto err;
 	}
 
 	if (!sink_ops(sink)->alloc_buffer)
diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
index 389c4ba..483a1f7 100644
--- a/drivers/hwtracing/coresight/coresight.c
+++ b/drivers/hwtracing/coresight/coresight.c
@@ -272,6 +272,7 @@ static int coresight_enable_source(struct coresight_device *csdev, u32 mode)
 static bool coresight_disable_source(struct coresight_device *csdev)
 {
 	if (atomic_dec_return(csdev->refcnt) == 0) {
+
 		if (source_ops(csdev)->disable)
 			source_ops(csdev)->disable(csdev, NULL);
 		csdev->enable = false;
@@ -612,6 +613,13 @@ int coresight_enable(struct coresight_device *csdev)
 	if (ret)
 		goto err_source;
 
+	cpu = source_ops(csdev)->cpu_id(csdev);
+
+	/* Set sink device handler into kdump node */
+	ret = coresight_kdump_sink(cpu, sink);
+	if (ret)
+		goto err_kdump;
+
 	switch (subtype) {
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
 		/*
@@ -621,7 +629,6 @@ int coresight_enable(struct coresight_device *csdev)
 		 * be a single session per tracer (when working from sysFS)
 		 * a per-cpu variable will do just fine.
 		 */
-		cpu = source_ops(csdev)->cpu_id(csdev);
 		per_cpu(tracer_path, cpu) = path;
 		break;
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
@@ -636,6 +643,9 @@ int coresight_enable(struct coresight_device *csdev)
 	mutex_unlock(&coresight_mutex);
 	return ret;
 
+err_kdump:
+	coresight_disable_source(csdev);
+
 err_source:
 	coresight_disable_path(path);
 
@@ -659,9 +669,10 @@ void coresight_disable(struct coresight_device *csdev)
 	if (!csdev->enable || !coresight_disable_source(csdev))
 		goto out;
 
+	cpu = source_ops(csdev)->cpu_id(csdev);
+
 	switch (csdev->subtype.source_subtype) {
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
-		cpu = source_ops(csdev)->cpu_id(csdev);
 		path = per_cpu(tracer_path, cpu);
 		per_cpu(tracer_path, cpu) = NULL;
 		break;
@@ -674,6 +685,7 @@ void coresight_disable(struct coresight_device *csdev)
 		break;
 	}
 
+	coresight_kdump_sink(cpu, NULL);
 	coresight_disable_path(path);
 	coresight_release_path(path);
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
