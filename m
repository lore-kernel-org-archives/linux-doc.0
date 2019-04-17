Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A749E7D919
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Apr 2019 09:47:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731840AbfDQJri (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Apr 2019 05:47:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45050 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731710AbfDQJqk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Apr 2019 05:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pN8YptXx1xrUPVntgy7n3du+toVS3b1++92qgrif+/U=; b=KnxpLqp3IxArsqb/4nvOt9Ia29
        8ATNATe7r1EcU82uLVQ1eFZgUR9IyPWFN59fS/xWtVeDGrPSMTu2W99ZPZDlb+Lq4nW/HNfunM4nN
        zLv3PypiqzecThb5f4H5FrRScKGrUhSBRatVROcbri4t6b4H39muBYnq8U+R3ekXqM1hwKpZMDrqw
        bNNUNwki+5Hs0oLp1VXAWigP3N6kHGNsq5q29HPLpYqhnQnmFdKMszaVHwd61hHUkDV0tz3+KB2Ug
        4BB9zMYcpJwHbjxCB28nSJ1pdTSPykvKH+9oVegg7rcCWqi0eAasL7IcQEhiBoPMhcVCPMiYjyBz+
        D5it8gIQ==;
Received: from 177.132.233.55.dynamic.adsl.gvt.net.br ([177.132.233.55] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hGh9K-0000aD-61; Wed, 17 Apr 2019 09:46:38 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hGh9D-0003ur-1n; Wed, 17 Apr 2019 06:46:31 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 11/21] docs: hwmon: ibmpowernv: convert to ReST format
Date:   Wed, 17 Apr 2019 06:46:19 -0300
Message-Id: <dd5d72218fbd86bb9eb8a8e8e66e647c00cac8ae.1555494108.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555494108.git.mchehab+samsung@kernel.org>
References: <cover.1555494108.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Convert ibmpowernv to ReST format, in order to allow it to
be parsed by Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/hwmon/ibmpowernv | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/Documentation/hwmon/ibmpowernv b/Documentation/hwmon/ibmpowernv
index 56468258711f..5d642bc3dec0 100644
--- a/Documentation/hwmon/ibmpowernv
+++ b/Documentation/hwmon/ibmpowernv
@@ -2,6 +2,7 @@ Kernel Driver IBMPOWERNV
 ========================
 
 Supported systems:
+
   * Any recent IBM P servers based on POWERNV platform
 
 Author: Neelesh Gupta
@@ -29,10 +30,11 @@ CONFIG_SENSORS_IBMPOWERNV. It can also be built as module 'ibmpowernv'.
 Sysfs attributes
 ----------------
 
+======================= =======================================================
 fanX_input		Measured RPM value.
 fanX_min		Threshold RPM for alert generation.
-fanX_fault		0: No fail condition
-			1: Failing fan
+fanX_fault		- 0: No fail condition
+			- 1: Failing fan
 
 tempX_input		Measured ambient temperature.
 tempX_max		Threshold ambient temperature for alert generation.
@@ -42,20 +44,22 @@ tempX_enable		Enable/disable all temperature sensors belonging to the
 			sub-group. In POWER9, this attribute corresponds to
 			each OCC. Using this attribute each OCC can be asked to
 			disable/enable all of its temperature sensors.
-			1: Enable
-			0: Disable
+
+			- 1: Enable
+			- 0: Disable
 
 inX_input		Measured power supply voltage (millivolt)
-inX_fault		0: No fail condition.
-			1: Failing power supply.
+inX_fault		- 0: No fail condition.
+			- 1: Failing power supply.
 inX_highest		Historical maximum voltage
 inX_lowest		Historical minimum voltage
 inX_enable		Enable/disable all voltage sensors belonging to the
 			sub-group. In POWER9, this attribute corresponds to
 			each OCC. Using this attribute each OCC can be asked to
 			disable/enable all of its voltage sensors.
-			1: Enable
-			0: Disable
+
+			- 1: Enable
+			- 0: Disable
 
 powerX_input		Power consumption (microWatt)
 powerX_input_highest	Historical maximum power
@@ -64,8 +68,9 @@ powerX_enable		Enable/disable all power sensors belonging to the
 			sub-group. In POWER9, this attribute corresponds to
 			each OCC. Using this attribute each OCC can be asked to
 			disable/enable all of its power sensors.
-			1: Enable
-			0: Disable
+
+			- 1: Enable
+			- 0: Disable
 
 currX_input		Measured current (milliampere)
 currX_highest		Historical maximum current
@@ -74,7 +79,9 @@ currX_enable		Enable/disable all current sensors belonging to the
 			sub-group. In POWER9, this attribute corresponds to
 			each OCC. Using this attribute each OCC can be asked to
 			disable/enable all of its current sensors.
-			1: Enable
-			0: Disable
+
+			- 1: Enable
+			- 0: Disable
 
 energyX_input		Cumulative energy (microJoule)
+======================= =======================================================
-- 
2.20.1

