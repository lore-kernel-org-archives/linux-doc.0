Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 569207D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 19:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbfDJTXH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 15:23:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44000 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfDJTXH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 15:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YulanG3i2WrJpx0xcGHlq1inbqZIAFZQdFGyn1cb8Dg=; b=Y5aV2L6s0WR/3J0tNglnGt96k7
        WIu3ypdk2UW6ATlRH+27LSYVyflmmXEkhycbTQ0FuyGNhG7x79MU499hjHyGBZ5OEosS3ERQnl0ub
        4DRp4iO6LoNNEGrHJOez+E+CBVfXSa5mc3XgC96BCAMox/SXXqTtrNf8/S9fhQL2gD4QXpRIwaldK
        iFVDzwrEUBgWri6CKFd1rNjhcv+2WN5ieoghjmoNUra/Vrwfp3dCoSHag+KoB/MlKH+xOCVsZrT/L
        BarQCHii8F1eyZs/yHnR+V7VVragEFne0n8u8sox7Nw4HH+RShZXL42N7o6SiznUspFwqpqizf17m
        UhO8SjuA==;
Received: from 177.41.129.23.dynamic.adsl.gvt.net.br ([177.41.129.23] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hEIoM-0003R0-JI; Wed, 10 Apr 2019 19:23:06 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hEIoI-0000yc-PK; Wed, 10 Apr 2019 16:23:02 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 03/21] docs: hwmon: menf21bmc: convert to ReST format
Date:   Wed, 10 Apr 2019 16:22:40 -0300
Message-Id: <e538f79075cbaaab78d5b398b659fcb4eacb6403.1554923967.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1554923967.git.mchehab+samsung@kernel.org>
References: <cover.1554923967.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Convert menf21bmc to ReST format, in order to allow it to
be parsed by Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/hwmon/menf21bmc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/hwmon/menf21bmc b/Documentation/hwmon/menf21bmc
index 2a273a065c5e..1f0c6b2235ab 100644
--- a/Documentation/hwmon/menf21bmc
+++ b/Documentation/hwmon/menf21bmc
@@ -2,8 +2,11 @@ Kernel driver menf21bmc_hwmon
 =============================
 
 Supported chips:
+
 	* MEN 14F021P00
+
 	  Prefix: 'menf21bmc_hwmon'
+
 	  Adresses scanned: -
 
 Author: Andreas Werner <andreas.werner@men.de>
@@ -34,6 +37,7 @@ Sysfs entries
 The following attributes are supported. All attributes are read only
 The Limits are read once by the driver.
 
+=============== ==========================
 in0_input	+3.3V input voltage
 in1_input	+5.0V input voltage
 in2_input	+12.0V input voltage
@@ -48,3 +52,4 @@ in1_label	"MON_5V"
 in2_label	"MON_12V"
 in3_label	"5V_STANDBY"
 in4_label	"VBAT"
+=============== ==========================
-- 
2.20.1

