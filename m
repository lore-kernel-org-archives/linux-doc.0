Return-Path: <SRS0=VB12=4F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B69C34034
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:20:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D63A2464E
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581956454;
	bh=l7H1FlGZAtH5V7csuITiXzF4fvtEJZ4FNkc+IiSZ+sU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=EkGiaj1z5EixcAeegjWPopyicYD8nq9b1zoMQXSqokfVflBcCRgvRlBEtP/tKrdja
	 WXA3LxsYasoLxdK3kJoscf1qgRqm+v5BhSFLd3ZMQHIicxqova0ddzkkTFVV8WOyMX
	 YpKVGVUcGtpfL0ryt1QVeGxMV07hzh/bmTzEtddU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729201AbgBQQUx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Feb 2020 11:20:53 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54948 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbgBQQUr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 11:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=+zWwoxB/GlzqIdYKTQ20K+hSDuhycL4nJOvIJEmXBXA=; b=r1gTe6EudoV9+CDm9ZvpohMlw0
        KQeLw5clc51RXBXmxEM0GiHWpd4oGtKyI7oOmJILGn4qHXJ7Oc9XNXZ2Pk5DIAyyfeBYv5DnwMXv3
        D5E1nIQRGW3xNNQfWZL8Lau55ByKqwzfSUrD1ZvPiMJte8oudrrW2BbY98gPV34U2szTgbs26SRtQ
        3JC2lwzUATgf7BxKFK9ybTnx/u9flswVf2/8wMggsTUB8oRLVLfwRp8sly7QjuIgNWFOwWrqHAzM4
        Fn3ZoYV92rOu7TjQGUFK9a8H0MSJ13s8BQXCd0FxVTdINn+JhRJJBE2/GVXZhkK/PtDdUBZxUeOfC
        PU/UFOFA==;
Received: from ip-109-41-129-189.web.vodafone.de ([109.41.129.189] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3j8Y-00042A-1r; Mon, 17 Feb 2020 16:20:46 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j8W-000fpR-4m; Mon, 17 Feb 2020 17:20:44 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 11/24] docs: misc-devices/apds990x.txt: convert to ReST format
Date:   Mon, 17 Feb 2020 17:20:29 +0100
Message-Id: <837861a028c40012a36fed04173146906a388399.1581956285.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581956285.git.mchehab+huawei@kernel.org>
References: <cover.1581956285.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Adjust title markup;
- Adjust identation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{apds990x.txt => apds990x.rst}            | 31 ++++++++++++++-----
 Documentation/misc-devices/index.rst          |  1 +
 2 files changed, 25 insertions(+), 7 deletions(-)
 rename Documentation/misc-devices/{apds990x.txt => apds990x.rst} (86%)

diff --git a/Documentation/misc-devices/apds990x.txt b/Documentation/misc-devices/apds990x.rst
similarity index 86%
rename from Documentation/misc-devices/apds990x.txt
rename to Documentation/misc-devices/apds990x.rst
index 454d95d623b3..e2f75577f731 100644
--- a/Documentation/misc-devices/apds990x.txt
+++ b/Documentation/misc-devices/apds990x.rst
@@ -1,3 +1,6 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
 Kernel driver apds990x
 ======================
 
@@ -50,14 +53,18 @@ chip_id
 
 power_state
 	RW - enable / disable chip. Uses counting logic
+
 	     1 enables the chip
 	     0 disables the chip
 lux0_input
 	RO - measured lux value
+
 	     sysfs_notify called when threshold interrupt occurs
 
 lux0_sensor_range
-	RO - lux0_input max value. Actually never reaches since sensor tends
+	RO - lux0_input max value.
+
+	     Actually never reaches since sensor tends
 	     to saturate much before that. Real max value varies depending
 	     on the light spectrum etc.
 
@@ -68,7 +75,9 @@ lux0_rate_avail
 	RO - supported measurement rates
 
 lux0_calibscale
-	RW - calibration value. Set to neutral value by default.
+	RW - calibration value.
+
+	     Set to neutral value by default.
 	     Output results are multiplied with calibscale / calibscale_default
 	     value.
 
@@ -76,16 +85,21 @@ lux0_calibscale_default
 	RO - neutral calibration value
 
 lux0_thresh_above_value
-	RW - HI level threshold value. All results above the value
+	RW - HI level threshold value.
+
+	     All results above the value
 	     trigs an interrupt. 65535 (i.e. sensor_range) disables the above
 	     interrupt.
 
 lux0_thresh_below_value
-	RW - LO level threshold value. All results below the value
+	RW - LO level threshold value.
+
+	     All results below the value
 	     trigs an interrupt. 0 disables the below interrupt.
 
 prox0_raw
 	RO - measured proximity value
+
 	     sysfs_notify called when threshold interrupt occurs
 
 prox0_sensor_range
@@ -93,11 +107,14 @@ prox0_sensor_range
 
 prox0_raw_en
 	RW - enable / disable proximity - uses counting logic
-	     1 enables the proximity
-	     0 disables the proximity
+
+	     - 1 enables the proximity
+	     - 0 disables the proximity
 
 prox0_reporting_mode
-	RW - trigger / periodic. In "trigger" mode the driver tells two possible
+	RW - trigger / periodic.
+
+	     In "trigger" mode the driver tells two possible
 	     values: 0 or prox0_sensor_range value. 0 means no proximity,
 	     1023 means proximity. This causes minimal number of interrupts.
 	     In "periodic" mode the driver reports all values above
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 40a4c104e7a2..16973310d32e 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -15,6 +15,7 @@ fit into other categories.
    :maxdepth: 2
 
    ad525x_dpot
+   apds990x
    bh1770glc
    eeprom
    c2port
-- 
2.24.1

