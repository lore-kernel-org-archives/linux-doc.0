Return-Path: <SRS0=VB12=4F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31943C34028
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3D4F2468C
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581956453;
	bh=XeqIYzwWEr1Bp8XSUZu32Up8m7WqNhvtw8IXLKbyWVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=S5qwdinwZwmAyJhayGhNVEAIVs6pEYheOwBiKqDcECkKKQ8o7wmFx+KIK85KnQ2nV
	 2+LKEcJSCUL00szc6nd+goXRSP520Y/08vZOnAaKvpy6NRgfuWfWvFNfHQJicgvbMH
	 xHrDOB7RE61Yj1NU10fqdOEEZJEWIfD+e8QhcFQM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgBQQUv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Feb 2020 11:20:51 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55256 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728658AbgBQQUu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 11:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=+bwf//vDBvqjr5cwu4b/E26nZhdac2zEgMzywyTguNo=; b=D6DaY5ybzKm9jEDcSWVI1w2RVu
        /POxElONhHvPmuJDloLie/fEfI6Nzn0AhG+82qdqEtUEyl9PFVdM5N+46R4oAFazAaeRxWpUjsk0p
        2WGi1KTvoSN0gpJAYAgW6sQfC9x89FcBvKfprA9s6HAz6jqv6sdE+65mvEFAmIqBad6tnoeDokLmg
        k1sAMBhO4eKmU4SAJ1DKSwQrYZ5EuN3H4qfuoFhsPt7Ti9DHrL5bTZeDWxHnW6OH2XtB+qxOCZCSH
        KB9Zxn6eBXjflw1XSAnLXQzLrIS88w+WjNAWMVaX3wUtrpOTrSHq2QCGpFLddmPgcqsCR4uIDIaMW
        oeuf/XZQ==;
Received: from x2f7f83d.dyn.telefonica.de ([2.247.248.61] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3j8b-000429-3N; Mon, 17 Feb 2020 16:20:49 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j8W-000fpM-3i; Mon, 17 Feb 2020 17:20:44 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 10/24] docs: misc-devices/bh1770glc.txt: convert to ReST
Date:   Mon, 17 Feb 2020 17:20:28 +0100
Message-Id: <c5dce3a42e336d4d4aa52f22f7ba4ebc6b595dec.1581956285.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581956285.git.mchehab+huawei@kernel.org>
References: <cover.1581956285.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

