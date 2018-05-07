Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2325F7E279
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 09:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751997AbeEGJkO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 05:40:14 -0400
Received: from osg.samsung.com ([64.30.133.232]:60958 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752411AbeEGJgF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 05:36:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 9956423423;
        Mon,  7 May 2018 02:36:04 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gNXFeSwtzFuU; Mon,  7 May 2018 02:36:03 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.109.86.dynamic.adsl.gvt.net.br [177.41.109.86])
        by osg.samsung.com (Postfix) with ESMTPSA id 41697233DF;
        Mon,  7 May 2018 02:36:01 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fFcYo-00087c-Tl; Mon, 07 May 2018 06:35:58 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Thymo van Beers <thymovanbeers@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Rientjes <rientjes@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vinod.koul@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH 08/18] docs: driver-api: add clk documentation
Date:   Mon,  7 May 2018 06:35:44 -0300
Message-Id: <f3398bca6fba979bd55b8a053b6b46fe35bf9891.1525684985.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The clk.rst is already in ReST format. So, move it to the
driver-api guide, where it belongs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/00-INDEX                          | 2 --
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 Documentation/{clk.txt => driver-api/clk.rst}   | 0
 Documentation/driver-api/index.rst              | 1 +
 4 files changed, 2 insertions(+), 3 deletions(-)
 rename Documentation/{clk.txt => driver-api/clk.rst} (100%)

diff --git a/Documentation/00-INDEX b/Documentation/00-INDEX
index a9dd1384d8e3..2754fe83f0d4 100644
--- a/Documentation/00-INDEX
+++ b/Documentation/00-INDEX
@@ -80,8 +80,6 @@ cdrom/
 	- directory with information on the CD-ROM drivers that Linux has.
 cgroup-v1/
 	- cgroups v1 features, including cpusets and memory controller.
-clk.txt
-	- info on the common clock framework
 cma/
 	- Continuous Memory Area (CMA) debugfs interface.
 conf.py
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 865a24e4d516..42f3e2884e7c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -518,7 +518,7 @@
 			those clocks in any way. This parameter is useful for
 			debug and development, but should not be needed on a
 			platform with proper driver support.  For more
-			information, see Documentation/clk.txt.
+			information, see Documentation/driver-api/clk.rst.
 
 	clock=		[BUGS=X86-32, HW] gettimeofday clocksource override.
 			[Deprecated]
diff --git a/Documentation/clk.txt b/Documentation/driver-api/clk.rst
similarity index 100%
rename from Documentation/clk.txt
rename to Documentation/driver-api/clk.rst
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 3ac51c94f97b..5d04296f5ce0 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -17,6 +17,7 @@ available subsections can be seen below.
    basics
    infrastructure
    pm/index
+   clk
    device-io
    device_connection
    dma-buf
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
