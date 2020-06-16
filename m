Return-Path: <SRS0=G1XG=75=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C59FC433E1
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6162E208B3
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aEKX/YBz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgFPQkR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729557AbgFPQkQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jun 2020 12:40:16 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6563C061755
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:14 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l11so21487667wru.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I2TjwT9IfqG2nrgLrAevDzKvNXE/MwXIyJwS2KSXhng=;
        b=aEKX/YBz/O7iZpusiQTX/Mfj/o7PxCrCNcL7fuhDR9UcBUu1zdQoZscsG0S87lFcKI
         HkGMn847nDsLMmtKxOJCSqWh52IUV0RgT6gTk7lcVF3U9Pryu5WrPuEHk54R2Ac3lgFC
         OWxQcK/NNsYArwODM6+6YHkP7mXzIHOkaEuOt4zjX6pZhbV3JiTmNV5Z5LSOQSorWShZ
         iDujvjQaHOhRxJcQn1B8c5mMyLwExWoHRP55bqR8fU0tUue/4uSaNC5lPcWcoFRI2vrB
         NucUtM81uA9byWutCZLia7qn1/f5kYxFphkBGxj+WjTVhNEuA6BJuHoPrOHvnnew8/ut
         PGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I2TjwT9IfqG2nrgLrAevDzKvNXE/MwXIyJwS2KSXhng=;
        b=MZnyGqPrHcduR+25b6prdLCAagLwdshnCpCnVI9tDE4gnFM+biGEy85pbIy0Zm9dW0
         B0XHu4/9oeJQrdPjeAEa3ff4iDrXmfxN5Ilc/frUrwAeexTLNYU8plLcJ3OjEI2tIv4w
         C7TCa5DIi30VTjWN62gGMZmp5CzvqMmO1J0ulo2vt2c5F0ORsMdjcZLoXZD6gqQoPCiY
         XFkOdzgEMnHgogiD0JOynUZgChlP7Trt4vkJrgM+4U4e6IiMnR8BKhBiBvC1kNlI1XQJ
         TpdnD4OOvdCmHSHpxzZi/l0LA4gV+yShRr2Dgm6ThPKzFohIMd9XobBeBHxLbivMFRuQ
         FBIw==
X-Gm-Message-State: AOAM5319+PmVkFhxgzkeufNe7HWTHFPghBPgW6shSUuhZ35tuCVLBYmx
        oiHOaewwff/IG6bZO+AXz0A3WA==
X-Google-Smtp-Source: ABdhPJzHXgNQpyErZftibK2loj/26aph0mEVisQ1m9b+ntxshr40za6D0ixAlFRe02NcPwKuz2mMXg==
X-Received: by 2002:adf:ef47:: with SMTP id c7mr4232461wrp.57.1592325613602;
        Tue, 16 Jun 2020 09:40:13 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6801:1801:dc9e:c297:59e5:dbd9])
        by smtp.gmail.com with ESMTPSA id g82sm4843866wmf.1.2020.06.16.09.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 09:40:12 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        coresight@lists.linaro.org, mathieu.poirier@linaro.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 4/5] coresight: sysfs: Allow select default sink on source enable.
Date:   Tue, 16 Jun 2020 17:40:05 +0100
Message-Id: <20200616164006.15309-5-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616164006.15309-1-mike.leach@linaro.org>
References: <20200616164006.15309-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When enabling a trace source using sysfs, allow the CoreSight system to
auto-select a default sink if none has been enabled by the user.

Uses the sink select algorithm that uses the default select priorities
set when sinks are registered with the system. At present this will
prefer ETR over ETB / ETF.

Adds a new attribute 'last_sink' to source CoreSight devices. This is set
when a source is enabled using sysfs, to the sink that the device will
trace into. This applies for both user enabled and default enabled sinks.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight.c | 39 +++++++++++++++++++++++--
 include/linux/coresight.h               |  3 ++
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
index e9c90f2de34a..db39e0b56994 100644
--- a/drivers/hwtracing/coresight/coresight.c
+++ b/drivers/hwtracing/coresight/coresight.c
@@ -934,6 +934,16 @@ static void coresight_clear_default_sink(struct coresight_device *csdev)
 	}
 }
 
+static void coresight_set_last_sink_name(struct coresight_device *source,
+					 struct coresight_device *sink)
+{
+	/* remove current value and set new one if *sink not NULL */
+	kfree(source->last_sink);
+	source->last_sink = NULL;
+	if (sink)
+		source->last_sink = kstrdup(dev_name(&sink->dev), GFP_KERNEL);
+}
+
 /** coresight_validate_source - make sure a source has the right credentials
  *  @csdev:	the device structure for a source.
  *  @function:	the function this was called from.
@@ -994,8 +1004,15 @@ int coresight_enable(struct coresight_device *csdev)
 	 */
 	sink = coresight_get_enabled_sink(false);
 	if (!sink) {
-		ret = -EINVAL;
-		goto out;
+		/* look for a default sink if nothing enabled */
+		sink = coresight_find_default_sink(csdev);
+		if (!sink) {
+			ret = -EINVAL;
+			goto out;
+		}
+		/* mark the default as enabled */
+		sink->activated = true;
+		dev_info(&sink->dev, "Enabled default sink.");
 	}
 
 	path = coresight_build_path(csdev, sink);
@@ -1033,6 +1050,9 @@ int coresight_enable(struct coresight_device *csdev)
 		break;
 	}
 
+	/* record name of sink used for this session */
+	coresight_set_last_sink_name(csdev, sink);
+
 out:
 	mutex_unlock(&coresight_mutex);
 	return ret;
@@ -1145,6 +1165,19 @@ static ssize_t enable_source_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_source);
 
+static ssize_t last_sink_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct coresight_device *csdev = to_coresight_device(dev);
+	ssize_t size = 0;
+
+	if (csdev->last_sink)
+		size = scnprintf(buf, PAGE_SIZE, "%s\n", csdev->last_sink);
+	return size;
+}
+static DEVICE_ATTR_RO(last_sink);
+
+
 static struct attribute *coresight_sink_attrs[] = {
 	&dev_attr_enable_sink.attr,
 	NULL,
@@ -1153,6 +1186,7 @@ ATTRIBUTE_GROUPS(coresight_sink);
 
 static struct attribute *coresight_source_attrs[] = {
 	&dev_attr_enable_source.attr,
+	&dev_attr_last_sink.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(coresight_source);
@@ -1524,6 +1558,7 @@ void coresight_unregister(struct coresight_device *csdev)
 	/* Remove references of that device in the topology */
 	coresight_remove_conns(csdev);
 	coresight_clear_default_sink(csdev);
+	coresight_set_last_sink_name(csdev, NULL);
 	coresight_release_platform_data(csdev, csdev->pdata);
 	device_unregister(&csdev->dev);
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 58fffdecdbfd..fc320dd2cedc 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -184,6 +184,8 @@ struct coresight_sysfs_link {
  *		from source to that sink.
  * @ea:		Device attribute for sink representation under PMU directory.
  * @def_sink:	cached reference to default sink found for this device.
+ * @last_sink:	Name of last sink used for this source to trace into. Set when
+ *		enabling a source using sysfs - only set on a source device.
  * @ect_dev:	Associated cross trigger device. Not part of the trace data
  *		path or connections.
  * @nr_links:   number of sysfs links created to other components from this
@@ -203,6 +205,7 @@ struct coresight_device {
 	bool activated;	/* true only if a sink is part of a path */
 	struct dev_ext_attribute *ea;
 	struct coresight_device *def_sink;
+	const char *last_sink;
 	/* cross trigger handling */
 	struct coresight_device *ect_dev;
 	/* sysfs links between components */
-- 
2.17.1

