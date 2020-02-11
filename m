Return-Path: <SRS0=kPt+=37=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB7AC3B187
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 127332086A
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDgv/t7s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgBKK6Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Feb 2020 05:58:24 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37232 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbgBKK6Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Feb 2020 05:58:24 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so11750344wru.4
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2020 02:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vNm6E41dD+3EcT2K0DKbvrPIUP9PYyF/XxhSVh53CX0=;
        b=ZDgv/t7sP+1uEALXpOkZpnoz/ADtsfUQwiF774ux9bqMBNrEWL7M97gwvi2sQLez2u
         U+GlZ39laxiS/Tu69JKhSRjgzOyMz7bf1p4ReTCQp9RRGB3ocKimww6VufV+oV4Jj6mU
         jyWeu4+K89JcKCeCrJdcDMr3stiK838D1Mh9iNmRu/faef2dU60D/6yeIKfRxkaxkx/E
         y0IwUc2urI63kdHNPEySEgZvnDjm4xKLfm6Fv5kNvYcycTmWz13BITMgn9tIBbUWI/G5
         CIOak1SljGxKjKx5r0QTyudlwJf8mMm2fRIjH+aXljiKj4YwJt40GJl8QTW0fkNUeu9c
         +Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vNm6E41dD+3EcT2K0DKbvrPIUP9PYyF/XxhSVh53CX0=;
        b=H/0NKpclLCpODEJSJzfm6BP9efgSEEV1FyyBProJSUteKJ+m3dQIrHnf/fskaxh/J6
         +bxZKHEB8ocgyh6KdfTs3dGqs+bvsZ4PcNLbXm6ZE8AucTz+yUAmEQodZA6OL3wGT0ws
         RH1AWnqJxDuHXU47KrcrlGZvbYfva//AJvhxRVm8QyXV8S298tBk1iABOvSul6MVR9bL
         b5S6iFd6pbOo6jEUD6Ug4DL8QYE8EmqLtshrSZ060xrWikqjj9o4zph/sTUqyTglSads
         aXTJtZGtH68LpVyRLKn0LgpBbjbTboz8Oshsq0+JCIBlowiSUGyOdpxvNBAbgZluY6ab
         eYhQ==
X-Gm-Message-State: APjAAAVZSfgB7Y64kUsT5RWBYRiEMcgM8D2Z96ZMD9Ndz4NA2Z4wmb5S
        Ve4TbECNGU2A/UsabAsSU/Mnyw==
X-Google-Smtp-Source: APXvYqzFlqJJqrPjFPpJYQFGxy5nia87NDWRjTSgfCOvhptfDM8hkWrlFc5afOgryjY0L3tap5GyRw==
X-Received: by 2002:a5d:54c1:: with SMTP id x1mr7717644wrv.240.1581418701161;
        Tue, 11 Feb 2020 02:58:21 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id g21sm3171291wmh.17.2020.02.11.02.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 02:58:20 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v4 5/6] coresight: cti: Add in sysfs links to other coresight devices.
Date:   Tue, 11 Feb 2020 10:58:07 +0000
Message-Id: <20200211105808.27884-6-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211105808.27884-1-mike.leach@linaro.org>
References: <20200211105808.27884-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds in sysfs links for connections where the connected device is another
coresight device. This allows examination of the coresight topology.

Non-coresight connections remain just as a reference name.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-cti.c | 41 ++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
index 9e18e176831c..f620e9460e7d 100644
--- a/drivers/hwtracing/coresight/coresight-cti.c
+++ b/drivers/hwtracing/coresight/coresight-cti.c
@@ -441,6 +441,37 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 	return err;
 }
 
+static void cti_add_sysfs_link(struct cti_drvdata *drvdata,
+			       struct cti_trig_con *tc)
+{
+	struct coresight_sysfs_link link_info;
+
+	link_info.orig = drvdata->csdev;
+	link_info.orig_name = tc->con_dev_name;
+	link_info.target = tc->con_dev;
+	link_info.target_name = dev_name(&drvdata->csdev->dev);
+	coresight_add_sysfs_link(&link_info);
+}
+
+static void cti_remove_all_sysfs_links(struct cti_drvdata *drvdata)
+{
+	struct cti_trig_con *tc;
+	struct cti_device *ctidev = &drvdata->ctidev;
+	struct coresight_sysfs_link link_info;
+
+	/* origin device and target link name constant for this cti */
+	link_info.orig = drvdata->csdev;
+	link_info.target_name = dev_name(&drvdata->csdev->dev);
+
+	list_for_each_entry(tc, &ctidev->trig_cons, node) {
+		if (tc->con_dev) {
+			link_info.target = tc->con_dev;
+			link_info.orig_name = tc->con_dev_name;
+			coresight_remove_sysfs_link(&link_info);
+		}
+	}
+}
+
 /*
  * Look for a matching connection device name in the list of connections.
  * If found then swap in the csdev name, set trig con association pointer
@@ -452,6 +483,8 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
 {
 	struct cti_trig_con *tc;
 	const char *csdev_name;
+	struct cti_drvdata *drvdata = container_of(ctidev, struct cti_drvdata,
+						   ctidev);
 
 	list_for_each_entry(tc, &ctidev->trig_cons, node) {
 		if (tc->con_dev_name) {
@@ -462,6 +495,7 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
 					devm_kstrdup(&csdev->dev, csdev_name,
 						     GFP_KERNEL);
 				tc->con_dev = csdev;
+				cti_add_sysfs_link(drvdata, tc);
 				return true;
 			}
 		}
@@ -546,10 +580,12 @@ static void cti_update_conn_xrefs(struct cti_drvdata *drvdata)
 	struct cti_device *ctidev = &drvdata->ctidev;
 
 	list_for_each_entry(tc, &ctidev->trig_cons, node) {
-		if (tc->con_dev)
+		if (tc->con_dev) {
 			/* set tc->con_dev->ect_dev */
 			coresight_set_assoc_ectdev_mutex(tc->con_dev,
 							 drvdata->csdev);
+			cti_add_sysfs_link(drvdata, tc);
+		}
 	}
 }
 
@@ -602,6 +638,9 @@ static void cti_device_release(struct device *dev)
 	mutex_lock(&ect_mutex);
 	cti_remove_conn_xrefs(drvdata);
 
+	/* clear the dynamic sysfs associate with connections */
+	cti_remove_all_sysfs_links(drvdata);
+
 	/* remove from the list */
 	list_for_each_entry_safe(ect_item, ect_tmp, &ect_net, node) {
 		if (ect_item == drvdata) {
-- 
2.17.1

