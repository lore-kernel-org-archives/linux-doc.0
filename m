Return-Path: <SRS0=G1XG=75=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6784CC433DF
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 440FB2053B
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXLSMGTM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729550AbgFPQkM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbgFPQkM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jun 2020 12:40:12 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10C0C061573
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t18so21486915wru.6
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JvNhFPgAekuOh98eM7QIE6yiEIZ2rGlQ4CDaGTYjSLY=;
        b=iXLSMGTMAMcpGOJzbRoQjT/sKbFJ/0Tk+PrBtjhSvvSD3aFuu8JUwnpYo+qOEfGyQm
         Qp7tZnkqPi5mP+DJ5MdEqUQJL+1zk6csiRQnFT8HBUfCg7o2uPhtexcLRhM9HC0BzKgM
         Kv/ZREQagHWdbdVG3saAe9l+KekzRZ+J9SRAIzMD9l62cybThc18ulRQcvOUH2EKDe1Y
         i3p4aVSmip2ULHoRsElkW4GuL4C7OzMNcBTq8F7vHIOgX1Jex74cqKo3mtq94GN/g/Ol
         tCCgDt1WTg+jlI7M+lu6ycRfjuV3+gGq0Yj2qr6JDr0KC6EvP9cjOE/tb73GX2YGV74f
         VrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JvNhFPgAekuOh98eM7QIE6yiEIZ2rGlQ4CDaGTYjSLY=;
        b=D/db3wvYRJUrWg4l1tTimFbw8MtrVyACeUma/146NAO9d0Y9c/BkBB7g6PG0Um1BTp
         CoQf7KFTTUQoLkFFrI5sVwAdDE7ZGqoBRCyoZoa9eGH4y09CO2Xn+vlk4qtlP6o6yjyp
         GamFTO6hOxm8xUSJ/eWBghOGjvgycdwTHoCChETSujb79TQ5HNPz06y/28OqsMp+sVXO
         D0fBHtrv1Bu2IyAtmw+M/MDWMfHmjjQWg9zuck2BD0Y3bzVXyPoxQz41DTz1W+ozb3rt
         5X8qWCAQLfaColIDmtrqDSUcpVJZspxaorKs+igwu3thvP1Rg5v3GjwVktbT6IgQ5mtL
         SaWA==
X-Gm-Message-State: AOAM530bNxtE+Tsl55Lx2iacHNnrHP6XNomU3mxzWgMB02CDxNTTnJ8i
        qM3977UxuYFSSZCRscCk6eX2hQ==
X-Google-Smtp-Source: ABdhPJwddWC6tT5XMJlG5DztkmNAEg5w+rvwoDqKakRGTHObzKvjpep3f/GVlfAsPbSThzoQodvg7w==
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr4138185wrp.90.1592325610126;
        Tue, 16 Jun 2020 09:40:10 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6801:1801:dc9e:c297:59e5:dbd9])
        by smtp.gmail.com with ESMTPSA id g82sm4843866wmf.1.2020.06.16.09.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 09:40:09 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        coresight@lists.linaro.org, mathieu.poirier@linaro.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 1/5] coresight: Add default sink selection to CoreSight base.
Date:   Tue, 16 Jun 2020 17:40:02 +0100
Message-Id: <20200616164006.15309-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616164006.15309-1-mike.leach@linaro.org>
References: <20200616164006.15309-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds a method to select a suitable sink connected to a given source.

In cases where no sink is defined, the coresight_find_default_sink
routine can search from a given source, through the child connections
until a suitable sink is found.

The suitability is defined in by the sink coresight_dev_subtype on the
CoreSight device, and the distance from the source by counting
connections.

Higher value subtype is preferred - where these are equal, shorter
distance from source is used as a tie-break.

This allows for default sink to be discovered were none is specified
(e.g. perf command line)

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Leo Yan <leo.yan@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/hwtracing/coresight/coresight-priv.h |   2 +
 drivers/hwtracing/coresight/coresight.c      | 166 +++++++++++++++++++
 include/linux/coresight.h                    |   3 +
 3 files changed, 171 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 36c943ae94d5..f2dc625ea585 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -150,6 +150,8 @@ int coresight_enable_path(struct list_head *path, u32 mode, void *sink_data);
 struct coresight_device *coresight_get_sink(struct list_head *path);
 struct coresight_device *coresight_get_enabled_sink(bool reset);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
+struct coresight_device *
+coresight_find_default_sink(struct coresight_device *csdev);
 struct list_head *coresight_build_path(struct coresight_device *csdev,
 				       struct coresight_device *sink);
 void coresight_release_path(struct list_head *path);
diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
index f3efbb3b2b4d..e9c90f2de34a 100644
--- a/drivers/hwtracing/coresight/coresight.c
+++ b/drivers/hwtracing/coresight/coresight.c
@@ -769,6 +769,171 @@ void coresight_release_path(struct list_head *path)
 	path = NULL;
 }
 
+/* return true if the device is a suitable type for a default sink */
+static inline bool coresight_is_def_sink_type(struct coresight_device *csdev)
+{
+	/* sink & correct subtype */
+	if (((csdev->type == CORESIGHT_DEV_TYPE_SINK) ||
+	     (csdev->type == CORESIGHT_DEV_TYPE_LINKSINK)) &&
+	    (csdev->subtype.sink_subtype >= CORESIGHT_DEV_SUBTYPE_SINK_BUFFER))
+		return true;
+	return false;
+}
+
+/**
+ * coresight_select_best_sink - return the best sink for use as default from
+ * the two provided.
+ *
+ * @sink:	current best sink.
+ * @depth:      search depth where current sink was found.
+ * @new_sink:	new sink for comparison with current sink.
+ * @new_depth:  search depth where new sink was found.
+ *
+ * Sinks prioritised according to coresight_dev_subtype_sink, with only
+ * subtypes CORESIGHT_DEV_SUBTYPE_SINK_BUFFER or higher being used.
+ *
+ * Where two sinks of equal priority are found, the sink closest to the
+ * source is used (smallest search depth).
+ *
+ * return @new_sink & update @depth if better than @sink, else return @sink.
+ */
+static struct coresight_device *
+coresight_select_best_sink(struct coresight_device *sink, int *depth,
+			   struct coresight_device *new_sink, int new_depth)
+{
+	bool update = false;
+
+	if (!sink) {
+		/* first found at this level */
+		update = true;
+	} else if (new_sink->subtype.sink_subtype >
+		   sink->subtype.sink_subtype) {
+		/* found better sink */
+		update = true;
+	} else if ((new_sink->subtype.sink_subtype ==
+		    sink->subtype.sink_subtype) &&
+		   (*depth > new_depth)) {
+		/* found same but closer sink */
+		update = true;
+	}
+
+	if (update)
+		*depth = new_depth;
+	return update ? new_sink : sink;
+}
+
+/**
+ * coresight_find_sink - recursive function to walk trace connections from
+ * source to find a suitable default sink.
+ *
+ * @csdev: source / current device to check.
+ * @depth: [in] search depth of calling dev, [out] depth of found sink.
+ *
+ * This will walk the connection path from a source (ETM) till a suitable
+ * sink is encountered and return that sink to the original caller.
+ *
+ * If current device is a plain sink return that & depth, otherwise recursively
+ * call child connections looking for a sink. Select best possible using
+ * coresight_select_best_sink.
+ *
+ * return best sink found, or NULL if not found at this node or child nodes.
+ */
+static struct coresight_device *
+coresight_find_sink(struct coresight_device *csdev, int *depth)
+{
+	int i, curr_depth = *depth + 1, found_depth = 0;
+	struct coresight_device *found_sink = NULL;
+
+	if (coresight_is_def_sink_type(csdev)) {
+		found_depth = curr_depth;
+		found_sink = csdev;
+		if (csdev->type == CORESIGHT_DEV_TYPE_SINK)
+			goto return_def_sink;
+		/* look past LINKSINK for something better */
+	}
+
+	/*
+	 * Not a sink we want - or possible child sink may be better.
+	 * recursively explore each port found on this element.
+	 */
+	for (i = 0; i < csdev->pdata->nr_outport; i++) {
+		struct coresight_device *child_dev, *sink = NULL;
+		int child_depth = curr_depth;
+
+		child_dev = csdev->pdata->conns[i].child_dev;
+		if (child_dev)
+			sink = coresight_find_sink(child_dev, &child_depth);
+
+		if (sink)
+			found_sink = coresight_select_best_sink(found_sink,
+								&found_depth,
+								sink,
+								child_depth);
+	}
+
+return_def_sink:
+	/* return found sink and depth */
+	if (found_sink)
+		*depth = found_depth;
+	return found_sink;
+}
+
+/**
+ * coresight_find_default_sink: Find a sink suitable for use as a
+ * default sink.
+ *
+ * @csdev: starting source to find a connected sink.
+ *
+ * Walks connections graph looking for a suitable sink to enable for the
+ * supplied source. Uses CoreSight device subtypes and distance from source
+ * to select the best sink.
+ *
+ * If a sink is found, then the default sink for this device is set and
+ * will be automatically used in future.
+ *
+ * Used in cases where the CoreSight user (perf / sysfs) has not selected a
+ * sink.
+ */
+struct coresight_device *
+coresight_find_default_sink(struct coresight_device *csdev)
+{
+	int depth = 0;
+
+	/* look for a default sink if we have not found for this device */
+	if (!csdev->def_sink)
+		csdev->def_sink = coresight_find_sink(csdev, &depth);
+	return csdev->def_sink;
+}
+
+static int coresight_remove_sink_ref(struct device *dev, void *data)
+{
+	struct coresight_device *sink = data;
+	struct coresight_device *source = to_coresight_device(dev);
+
+	if (source->def_sink == sink)
+		source->def_sink = NULL;
+	return 0;
+}
+
+/**
+ * coresight_clear_default_sink: Remove all default sink references to the
+ * supplied sink.
+ *
+ * If supplied device is a sink, then check all the bus devices and clear
+ * out all the references to this sink from the coresight_device def_sink
+ * parameter.
+ *
+ * @csdev: coresight sink - remove references to this from all sources.
+ */
+static void coresight_clear_default_sink(struct coresight_device *csdev)
+{
+	if ((csdev->type == CORESIGHT_DEV_TYPE_SINK) ||
+	    (csdev->type == CORESIGHT_DEV_TYPE_LINKSINK)) {
+		bus_for_each_dev(&coresight_bustype, NULL, csdev,
+				 coresight_remove_sink_ref);
+	}
+}
+
 /** coresight_validate_source - make sure a source has the right credentials
  *  @csdev:	the device structure for a source.
  *  @function:	the function this was called from.
@@ -1358,6 +1523,7 @@ void coresight_unregister(struct coresight_device *csdev)
 	etm_perf_del_symlink_sink(csdev);
 	/* Remove references of that device in the topology */
 	coresight_remove_conns(csdev);
+	coresight_clear_default_sink(csdev);
 	coresight_release_platform_data(csdev, csdev->pdata);
 	device_unregister(&csdev->dev);
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 84dc695e87d4..58fffdecdbfd 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -48,6 +48,7 @@ enum coresight_dev_subtype_sink {
 	CORESIGHT_DEV_SUBTYPE_SINK_NONE,
 	CORESIGHT_DEV_SUBTYPE_SINK_PORT,
 	CORESIGHT_DEV_SUBTYPE_SINK_BUFFER,
+	CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM,
 };
 
 enum coresight_dev_subtype_link {
@@ -182,6 +183,7 @@ struct coresight_sysfs_link {
  *		happens when a source has been selected and a path is enabled
  *		from source to that sink.
  * @ea:		Device attribute for sink representation under PMU directory.
+ * @def_sink:	cached reference to default sink found for this device.
  * @ect_dev:	Associated cross trigger device. Not part of the trace data
  *		path or connections.
  * @nr_links:   number of sysfs links created to other components from this
@@ -200,6 +202,7 @@ struct coresight_device {
 	/* sink specific fields */
 	bool activated;	/* true only if a sink is part of a path */
 	struct dev_ext_attribute *ea;
+	struct coresight_device *def_sink;
 	/* cross trigger handling */
 	struct coresight_device *ect_dev;
 	/* sysfs links between components */
-- 
2.17.1

