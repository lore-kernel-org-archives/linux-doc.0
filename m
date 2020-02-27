Return-Path: <SRS0=WXCa=4P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45714C11D3D
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19E1A24688
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wBIa5+lk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729819AbgB0POf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 10:14:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40067 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729910AbgB0POf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 10:14:35 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so3847337wmi.5
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 07:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vhTfl79n9jE2DgXDY2nDtsHQSi/ayZitWxYC2DEPQGI=;
        b=wBIa5+lk9iIYCjNMcn6f1N3lnW5EuWlHDIRvMpMHapeoN57BZdvLS2Mxfb10vIvANx
         T73l3ZhrAiOhld5eWb9sG5hZKFSXiG7QYTsFbj6lyKfUFzPYlcqKrRnG4PvTUkrXK0gV
         yGM7mMaqSbK87Hs+w3/1AqWZsLXLdfEQ0hQ5Tqrd3SVsb9yJF9ay0F0P+ySqpFEbuLfZ
         h4ve1qjTiZ1cJqgYKxM6pz7140+ZimtERut9mX2prXYklr3tY/tL5mQ5HK/HhYulNVxo
         iFQcHAXCiTxFE/sDHYsHYf+ZO2wEQhFRtBybM3Xtve23Q+o3W21UlNR/FoybtJEiVHzV
         W8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vhTfl79n9jE2DgXDY2nDtsHQSi/ayZitWxYC2DEPQGI=;
        b=HeXnkWBrD7KZbsLZSvQ7gYf/MUuP9Oj8A+YiUfrMiWOq4ql0dbVcVDWzDstWABUA0w
         tQphPhvJbmxdXx+xybgSNYW+rJ7cAssxxToNrzp27RzmpRwYOdrVlM2VSg7KhNCuRiq6
         LmHl33MSgne/swpKy4JPbX80uRc3zj3L83j14SFRgdiwPL8azsqwRroVBQ03JmVnxppX
         /SvbCvyRJk0eRevww/qCsPTKevZ1ju3MQuoEeWXlpLxULNXaoTDNPzclI8doxG3aybFh
         Se9+tzmr80z97liS7jY9vfDlFgDuTFmg49Q/B1YzO//ArrJij5aFSciy3I+2G6N1z3+G
         1+Sg==
X-Gm-Message-State: APjAAAVYXdMkwPt7//ok1//TK+POqQQOPWv+MLxaKp291Z/sd1sS527e
        OKvxZ4+YvNJXt83GedBgtROfSw==
X-Google-Smtp-Source: APXvYqw4jKtA+AOitpttxRTf2Q5Jgjrntsjt2hAMESAge0Jsw/yJx1debLxfpyIIEKpiX7mDYkYfTQ==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr5634452wmj.43.1582816472373;
        Thu, 27 Feb 2020 07:14:32 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6801:1801:2dc1:e60d:4b1c:70e0])
        by smtp.gmail.com with ESMTPSA id q12sm8973079wrg.71.2020.02.27.07.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 07:14:30 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 5/6] coresight: cti: Add in sysfs links to other coresight devices
Date:   Thu, 27 Feb 2020 15:14:15 +0000
Message-Id: <20200227151416.14271-6-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227151416.14271-1-mike.leach@linaro.org>
References: <20200227151416.14271-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds in sysfs links for connections where the connected device is another
coresight device. This allows examination of the coresight topology.

Non-coresight connections remain just as a reference name.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-cti.c | 52 +++++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
index aa6e0249bd70..9e262f5a85e3 100644
--- a/drivers/hwtracing/coresight/coresight-cti.c
+++ b/drivers/hwtracing/coresight/coresight-cti.c
@@ -442,6 +442,34 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 	return err;
 }
 
+static bool cti_add_sysfs_link(struct cti_drvdata *drvdata,
+			       struct cti_trig_con *tc)
+{
+	struct coresight_sysfs_link link_info;
+	int link_err = 0;
+
+	link_info.orig = drvdata->csdev;
+	link_info.orig_name = tc->con_dev_name;
+	link_info.target = tc->con_dev;
+	link_info.target_name = dev_name(&drvdata->csdev->dev);
+
+	link_err = coresight_add_sysfs_link(&link_info);
+	if (link_err)
+		dev_warn(&drvdata->csdev->dev,
+			 "Failed to set CTI sysfs link %s<=>%s\n",
+			 link_info.orig_name, link_info.target_name);
+	return !link_err;
+}
+
+static void cti_remove_sysfs_link(struct cti_trig_con *tc)
+{
+	struct coresight_sysfs_link link_info;
+
+	link_info.orig_name = tc->con_dev_name;
+	link_info.target = tc->con_dev;
+	coresight_remove_sysfs_link(&link_info);
+}
+
 /*
  * Look for a matching connection device name in the list of connections.
  * If found then swap in the csdev name, set trig con association pointer
@@ -452,6 +480,8 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
 		      struct coresight_device *csdev)
 {
 	struct cti_trig_con *tc;
+	struct cti_drvdata *drvdata = container_of(ctidev, struct cti_drvdata,
+						   ctidev);
 
 	list_for_each_entry(tc, &ctidev->trig_cons, node) {
 		if (tc->con_dev_name) {
@@ -459,7 +489,12 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
 				/* match: so swap in csdev name & dev */
 				tc->con_dev_name = dev_name(&csdev->dev);
 				tc->con_dev = csdev;
-				return true;
+				/* try to set sysfs link */
+				if (cti_add_sysfs_link(drvdata, tc))
+					return true;
+				/* link failed - remove CTI reference */
+				tc->con_dev = NULL;
+				break;
 			}
 		}
 	}
@@ -522,6 +557,7 @@ void cti_remove_assoc_from_csdev(struct coresight_device *csdev)
 		ctidev = &ctidrv->ctidev;
 		list_for_each_entry(tc, &ctidev->trig_cons, node) {
 			if (tc->con_dev == csdev->ect_dev) {
+				cti_remove_sysfs_link(tc);
 				tc->con_dev = NULL;
 				break;
 			}
@@ -543,10 +579,16 @@ static void cti_update_conn_xrefs(struct cti_drvdata *drvdata)
 	struct cti_device *ctidev = &drvdata->ctidev;
 
 	list_for_each_entry(tc, &ctidev->trig_cons, node) {
-		if (tc->con_dev)
-			/* set tc->con_dev->ect_dev */
-			coresight_set_assoc_ectdev_mutex(tc->con_dev,
+		if (tc->con_dev) {
+			/* if we can set the sysfs link */
+			if (cti_add_sysfs_link(drvdata, tc))
+				/* set the CTI/csdev association */
+				coresight_set_assoc_ectdev_mutex(tc->con_dev,
 							 drvdata->csdev);
+			else
+				/* otherwise remove reference from CTI */
+				tc->con_dev = NULL;
+		}
 	}
 }
 
@@ -559,6 +601,8 @@ static void cti_remove_conn_xrefs(struct cti_drvdata *drvdata)
 		if (tc->con_dev) {
 			coresight_set_assoc_ectdev_mutex(tc->con_dev,
 							 NULL);
+			cti_remove_sysfs_link(tc);
+			tc->con_dev = NULL;
 		}
 	}
 }
-- 
2.17.1

