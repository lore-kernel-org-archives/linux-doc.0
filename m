Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DCBB77D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 09:56:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbfDJJ4w (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 05:56:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60578 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730338AbfDJJ4j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 05:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uywpcar2BSwInr6Fjm6rS6TmPWkw/AvOUrwCmcbTPHw=; b=PWSUvsFhIYm2KE3owr/HJGiKMs
        EcujZE9nZ0W2vNE4vvFyFnMJImElpTx5dfRJ05Quw1QjbL/wIgi3G9r2YW9r4HiRQoxaYt+QL/5rG
        I189DNNQbgq2wZkg4Xzccy0LqOpmarIJ0e9EN1BqEMn64N7MtEoaUpeHuekJFrVIYX/Pcs6R6Ysg7
        A0NfR48s2WxmZGnahm3U8g0I7WvTubwvrPbgWpcT1WBj5E0s4OU1wnPeAUoaTTVcVI6pYlFpWtXCd
        ygNKqRWqi9JyeweYyAV1DXICFTDU+KAdMRlck3pz16W68nthXuLUPjKEQlN1mYp54A9rhO8EkQbaY
        lFNhQ2Uw==;
Received: from 177.41.129.23.dynamic.adsl.gvt.net.br ([177.41.129.23] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hE9yB-0003DQ-BD; Wed, 10 Apr 2019 09:56:39 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hE9y3-0000oH-RQ; Wed, 10 Apr 2019 06:56:31 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 6/8] docs: video-output.txt: convert it to ReST format
Date:   Wed, 10 Apr 2019 06:56:25 -0300
Message-Id: <0a11af54345d0d8bc4e0664ab5b27ef0dddd267e.1554889999.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1554889999.git.mchehab+samsung@kernel.org>
References: <cover.1554889999.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This file doesn't follow the documentation style we use
within the Kernel. Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/video-output.txt | 52 +++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/Documentation/video-output.txt b/Documentation/video-output.txt
index e517011be4f9..56d6fa2e2368 100644
--- a/Documentation/video-output.txt
+++ b/Documentation/video-output.txt
@@ -1,34 +1,34 @@
+Video Output Switcher Control
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-		Video Output Switcher Control
-		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-		2006 luming.yu@intel.com
+2006 luming.yu@intel.com
 
 The output sysfs class driver provides an abstract video output layer that
 can be used to hook platform specific methods to enable/disable video output
 device through common sysfs interface. For example, on my IBM ThinkPad T42
 laptop, The ACPI video driver registered its output devices and read/write
-method for 'state' with output sysfs class. The user interface under sysfs is:
+method for 'state' with output sysfs class. The user interface under sysfs is::
 
-linux:/sys/class/video_output # tree .
-.
-|-- CRT0
-|   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
-|   |-- state
-|   |-- subsystem -> ../../../class/video_output
-|   `-- uevent
-|-- DVI0
-|   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
-|   |-- state
-|   |-- subsystem -> ../../../class/video_output
-|   `-- uevent
-|-- LCD0
-|   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
-|   |-- state
-|   |-- subsystem -> ../../../class/video_output
-|   `-- uevent
-`-- TV0
-   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
-   |-- state
-   |-- subsystem -> ../../../class/video_output
-   `-- uevent
+  linux:/sys/class/video_output # tree .
+  .
+  |-- CRT0
+  |   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
+  |   |-- state
+  |   |-- subsystem -> ../../../class/video_output
+  |   `-- uevent
+  |-- DVI0
+  |   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
+  |   |-- state
+  |   |-- subsystem -> ../../../class/video_output
+  |   `-- uevent
+  |-- LCD0
+  |   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
+  |   |-- state
+  |   |-- subsystem -> ../../../class/video_output
+  |   `-- uevent
+  `-- TV0
+     |-- device -> ../../../devices/pci0000:00/0000:00:01.0
+     |-- state
+     |-- subsystem -> ../../../class/video_output
+     `-- uevent
 
-- 
2.20.1

