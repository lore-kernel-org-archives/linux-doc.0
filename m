Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4AF007E895
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Mar 2018 03:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752620AbeC3DQR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 23:16:17 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:53643 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752800AbeC3DQP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Mar 2018 23:16:15 -0400
Received: by mail-wm0-f65.google.com with SMTP id p9so13677735wmc.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Mar 2018 20:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gsayClFC98iYx6/DqOyvc4Nh2Po2oTAyjfQNyaF63bo=;
        b=jVhtZPFl0kII/TF4P7WL6AmIIxkdny77kI8hs5UvnFEoEv8j0OrCQrRhTqWmS1kenX
         ug6VnsEmhNmQ/JDkFE2jWN1pvEYYGyF8qewsZyRpqbwVGT97KDDw+7oGbQK1VoZCdkem
         mwuTvS+YdUG8foCTCujbnSuYzJ8NkQUCtnIC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gsayClFC98iYx6/DqOyvc4Nh2Po2oTAyjfQNyaF63bo=;
        b=jzhcejbwHHk/hGJ+ppuMX8snU15czHJphcrxoUw2xodW6G7h9ufDpkwiSUhjLJnweL
         9lEW7etj/W/ymK59joo5S3N3rTZglCoBKE0jneR3iF4s/UnN4CkaPPIPcfi75rEZs4gI
         fclr1UZDWO5aU9e6bhMWr2fbfB0vCVkJPqin53hVlmEDWhrTgvPSl2OpoKRAbrotf8la
         F5y+J+YRTCDMT4Xp1BeDt41ep6cfzI5mIcFhyD5blkg2iFC5iJr33l8a71zNzh+NQAsh
         e85o5dfz2oyiN5uK3S3IzO7Q5+0nvEQQPztib+YBjS63dhCQZED1IY2S35EQwZs6djGz
         BjCg==
X-Gm-Message-State: AElRT7EX13ErJTTooTPQMk3wkueIswvBVBwphnqUCe+ECI52ApoOacvR
        B0WhNlFvggl8OQzeP5YQpdvwsg==
X-Google-Smtp-Source: AIpwx49Ya12GIE5O5AG+OL9u4AAiz/FtPzW6sRbRaqBOXWx5/1smn6ZBkLv+tC+DU/WaPcI4ozhrew==
X-Received: by 10.28.1.197 with SMTP id 188mr920701wmb.49.1522379773967;
        Thu, 29 Mar 2018 20:16:13 -0700 (PDT)
Received: from localhost.localdomain (li622-172.members.linode.com. [212.71.249.172])
        by smtp.gmail.com with ESMTPSA id z9sm12798903wrz.4.2018.03.29.20.16.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 29 Mar 2018 20:16:13 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        Kim Phillips <kim.phillips@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 6/6] coresight: etm4x: Support panic kdump
Date:   Fri, 30 Mar 2018 11:15:24 +0800
Message-Id: <1522379724-30648-7-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
References: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ETMv4 hardware information and configuration needs to be saved as
metadata; the metadata format should be compatible with 'perf' tool and
finally is used by tracing data decoder.  ETMv4 works as tracer per CPU,
we cannot wait for gathering ETM info after CPU panic has happened in
case there have CPU is locked up and can't response inter-processor
interrupt for execution dump operations; so it's more reliable to gather
tracer metadata when all of the CPUs are alive.

This patch saves ETMv4 metadata but with the different method for
different registers.  Since values in TRCIDR{0, 1, 2, 8} and
TRCAUTHSTATUS are read-only and won't change afterward, thus those
registers values are filled into metadata structure when tracers are
instantiated.  The configuration and control registers TRCCONFIGR and
TRCTRACEIDR are dynamically configured, their values are recorded during
tracer enabling phase.

To avoid unnecessary overload introduced by set/clear operations for
updating kdump node, we only set ETMv4 metadata info for the
corresponding kdump node at initialization and won't be cleared anymore.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.c | 27 +++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etm4x.h | 15 +++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
index cf364a5..88b1e19 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -288,6 +288,8 @@ static int etm4_enable(struct coresight_device *csdev,
 	int ret;
 	u32 val;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_metadata *metadata = &drvdata->metadata;
 
 	val = local_cmpxchg(&drvdata->mode, CS_MODE_DISABLED, mode);
 
@@ -306,6 +308,10 @@ static int etm4_enable(struct coresight_device *csdev,
 		ret = -EINVAL;
 	}
 
+	/* Update tracer meta data after tracer configuration */
+	metadata->trcconfigr = config->cfg;
+	metadata->trctraceidr = drvdata->trcid;
+
 	/* The tracer didn't start */
 	if (ret)
 		local_set(&drvdata->mode, CS_MODE_DISABLED);
@@ -438,6 +444,7 @@ static void etm4_init_arch_data(void *info)
 	u32 etmidr4;
 	u32 etmidr5;
 	struct etmv4_drvdata *drvdata = info;
+	struct etmv4_metadata *metadata = &drvdata->metadata;
 
 	/* Make sure all registers are accessible */
 	etm4_os_unlock(drvdata);
@@ -590,6 +597,16 @@ static void etm4_init_arch_data(void *info)
 	drvdata->nrseqstate = BMVAL(etmidr5, 25, 27);
 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
 	drvdata->nr_cntr = BMVAL(etmidr5, 28, 30);
+
+	/* Update metadata */
+	metadata->magic = ETM4_METADATA_MAGIC;
+	metadata->cpu = drvdata->cpu;
+	metadata->trcidr0 = readl_relaxed(drvdata->base + TRCIDR0);
+	metadata->trcidr1 = readl_relaxed(drvdata->base + TRCIDR1);
+	metadata->trcidr2 = readl_relaxed(drvdata->base + TRCIDR2);
+	metadata->trcidr8 = readl_relaxed(drvdata->base + TRCIDR8);
+	metadata->trcauthstatus = readl_relaxed(drvdata->base + TRCAUTHSTATUS);
+
 	CS_LOCK(drvdata->base);
 }
 
@@ -957,6 +974,7 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
 	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata = NULL;
 	struct etmv4_drvdata *drvdata;
+	struct etmv4_metadata *metadata;
 	struct resource *res = &adev->res;
 	struct coresight_desc desc = { 0 };
 	struct device_node *np = adev->dev.of_node;
@@ -1027,6 +1045,15 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
 		goto err_arch_supported;
 	}
 
+	/* Set source device handler and metadata into kdump node */
+	metadata = &drvdata->metadata;
+	ret = coresight_kdump_source(drvdata->cpu, drvdata->csdev,
+				     (char *)metadata, sizeof(*metadata));
+	if (ret) {
+		coresight_unregister(drvdata->csdev);
+		goto err_arch_supported;
+	}
+
 	ret = etm_perf_symlink(drvdata->csdev, true);
 	if (ret) {
 		coresight_unregister(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index b3b5ea7..08dc8b7 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -198,6 +198,20 @@
 #define ETM_EXLEVEL_NS_HYP		BIT(14)
 #define ETM_EXLEVEL_NS_NA		BIT(15)
 
+#define ETM4_METADATA_MAGIC		0x4040404040404040ULL
+
+struct etmv4_metadata {
+	u64 magic;
+	u64 cpu;
+	u64 trcconfigr;
+	u64 trctraceidr;
+	u64 trcidr0;
+	u64 trcidr1;
+	u64 trcidr2;
+	u64 trcidr8;
+	u64 trcauthstatus;
+};
+
 /**
  * struct etmv4_config - configuration information related to an ETMv4
  * @mode:	Controls various modes supported by this ETM.
@@ -393,6 +407,7 @@ struct etmv4_drvdata {
 	bool				atbtrig;
 	bool				lpoverride;
 	struct etmv4_config		config;
+	struct etmv4_metadata		metadata;
 };
 
 /* Address comparator access types */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
