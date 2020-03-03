Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198AFC3F2CD
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9E3A20848
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583243970;
	bh=l7H1FlGZAtH5V7csuITiXzF4fvtEJZ4FNkc+IiSZ+sU=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=r0kIUhQJ7X8j8+DhZORNKBOd/g6/SVU5Fltv4Ukt6vY2axyQNSBh7AgkW+7l+ZDW/
	 8KumIHZEbS/V7R4LkCfKIOKN5ckG/ATuVRjp2XO3gVVn7ihYWM0khowXipNloYVrUo
	 aX6g2yBfxDZlPTpoqNZ9wgP+zCjEWjBdGujyVStU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgCCN73 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 08:59:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:45340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728549AbgCCN73 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 08:59:29 -0500
Received: from mail.kernel.org (ip-109-40-2-133.web.vodafone.de [109.40.2.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D3A02086A;
        Tue,  3 Mar 2020 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583243968;
        bh=l7H1FlGZAtH5V7csuITiXzF4fvtEJZ4FNkc+IiSZ+sU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OcoF/rkHrOg6k4nwMgU4hKukLXGR55mDThu9HXOUVoH0jMEX9OxzT/j1OP4pfSSTq
         OVr0oUZUEgQOWEM/IzCAwsB2GoEHQgR1CkoRmH6x/npupp0ZIUX8caNRBpVgcUC2G3
         gqsKO5zd7rl9/AmEvxr9faFGFRp06d4+3gQ4GGDY=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j9850-001Ydc-Eh; Tue, 03 Mar 2020 14:59:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 11/18] docs: misc-devices/apds990x.txt: convert to ReST format
Date:   Tue,  3 Mar 2020 14:59:18 +0100
Message-Id: <46c5f0238d736cf919463595fbf0584029f2c614.1583243826.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583243826.git.mchehab+huawei@kernel.org>
References: <cover.1583243826.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
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

