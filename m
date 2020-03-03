Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448D0C3F2D7
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1546020863
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583243975;
	bh=XeqIYzwWEr1Bp8XSUZu32Up8m7WqNhvtw8IXLKbyWVM=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=EWJt+pF4a2c7ftlH4RA+dC9w6J2HK6Ph5Pdss/EywBLoa30xBZw7cfSjQc2P5jX3Q
	 KwQVASGimmuLVLk/oKo4V9cXAlyDVj97Kg+fWauieK9xsm8RUT3tpHlUCdNB1fNp0i
	 ZXDHCJeh+QW/bE/8iaqrJNB52FRZ122AFBdWCl4g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgCCN7e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 08:59:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:45590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgCCN7e (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 08:59:34 -0500
Received: from mail.kernel.org (tmo-101-56.customers.d1-online.com [80.187.101.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E87420863;
        Tue,  3 Mar 2020 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583243973;
        bh=XeqIYzwWEr1Bp8XSUZu32Up8m7WqNhvtw8IXLKbyWVM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HqgOpd9LXioXfGMCDeitlaHepAt7k2IhUFlir6qXqF7SBj8Gyrv4GQnCm5TuDQbTr
         3IUMuq/NUiXQ8bwi+w8vXb8B30Rh23f7d3E7/XpUvKgiNrCihSclVLV9cENYu8CUIj
         Kncsib+OOfi/PyYFqz95pWRYF7FJir28lZp11tl4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j9850-001YdY-Dc; Tue, 03 Mar 2020 14:59:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 10/18] docs: misc-devices/bh1770glc.txt: convert to ReST
Date:   Tue,  3 Mar 2020 14:59:17 +0100
Message-Id: <8ba31da3d73bcde02045b23571e34fb0f99727b9.1583243826.git.mchehab+huawei@kernel.org>
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

- Adjust document title markup;
- use list markups;
- Adjust identations to display properly at ReST output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{bh1770glc.txt => bh1770glc.rst}          | 45 +++++++++++++------
 Documentation/misc-devices/index.rst          |  1 +
 2 files changed, 33 insertions(+), 13 deletions(-)
 rename Documentation/misc-devices/{bh1770glc.txt => bh1770glc.rst} (83%)

diff --git a/Documentation/misc-devices/bh1770glc.txt b/Documentation/misc-devices/bh1770glc.rst
similarity index 83%
rename from Documentation/misc-devices/bh1770glc.txt
rename to Documentation/misc-devices/bh1770glc.rst
index 7d64c014dc70..ea5ca58bb958 100644
--- a/Documentation/misc-devices/bh1770glc.txt
+++ b/Documentation/misc-devices/bh1770glc.rst
@@ -1,9 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
 Kernel driver bh1770glc
 =======================
 
 Supported chips:
-ROHM BH1770GLC
-OSRAM SFH7770
+
+- ROHM BH1770GLC
+- OSRAM SFH7770
 
 Data sheet:
 Not freely available
@@ -48,12 +52,16 @@ chip_id
 	RO - shows detected chip type and version
 
 power_state
-	RW - enable / disable chip. Uses counting logic
-	     1 enables the chip
-	     0 disables the chip
+	RW - enable / disable chip
+
+	Uses counting logic
+
+	     - 1 enables the chip
+	     - 0 disables the chip
 
 lux0_input
 	RO - measured lux value
+
 	     sysfs_notify called when threshold interrupt occurs
 
 lux0_sensor_range
@@ -66,16 +74,22 @@ lux0_rate_avail
 	RO - supported measurement rates
 
 lux0_thresh_above_value
-	RW - HI level threshold value. All results above the value
+	RW - HI level threshold value
+
+	     All results above the value
 	     trigs an interrupt. 65535 (i.e. sensor_range) disables the above
 	     interrupt.
 
 lux0_thresh_below_value
-	RW - LO level threshold value. All results below the value
+	RW - LO level threshold value
+
+	     All results below the value
 	     trigs an interrupt. 0 disables the below interrupt.
 
 lux0_calibscale
-	RW - calibration value. Set to neutral value by default.
+	RW - calibration value
+
+	     Set to neutral value by default.
 	     Output results are multiplied with calibscale / calibscale_default
 	     value.
 
@@ -84,32 +98,37 @@ lux0_calibscale_default
 
 prox0_raw
 	RO - measured proximity value
+
 	     sysfs_notify called when threshold interrupt occurs
 
 prox0_sensor_range
 	RO - prox0_raw max value
 
 prox0_raw_en
-	RW - enable / disable proximity - uses counting logic
-	     1 enables the proximity
-	     0 disables the proximity
+	RW - enable / disable proximity
+
+	     Uses counting logic
+
+	     - 1 enables the proximity
+	     - 0 disables the proximity
 
 prox0_thresh_above_count
 	RW - number of proximity interrupts needed before triggering the event
 
 prox0_rate_above
 	RW - Measurement rate (in Hz) when the level is above threshold
-	     i.e. when proximity on has been reported.
+	i.e. when proximity on has been reported.
 
 prox0_rate_below
 	RW - Measurement rate (in Hz) when the level is below threshold
-	     i.e. when proximity off has been reported.
+	i.e. when proximity off has been reported.
 
 prox0_rate_avail
 	RO - Supported proximity measurement rates in Hz
 
 prox0_thresh_above0_value
 	RW - threshold level which trigs proximity events.
+
 	     Filtered by persistence filter (prox0_thresh_above_count)
 
 prox0_thresh_above1_value
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index c2e880d78734..40a4c104e7a2 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -15,6 +15,7 @@ fit into other categories.
    :maxdepth: 2
 
    ad525x_dpot
+   bh1770glc
    eeprom
    c2port
    ibmvmc
-- 
2.24.1

