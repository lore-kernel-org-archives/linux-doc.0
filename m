Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B45697DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 13:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935271AbeEINTf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 09:19:35 -0400
Received: from osg.samsung.com ([64.30.133.232]:58914 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935188AbeEINTR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 May 2018 09:19:17 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 85B322C25E;
        Wed,  9 May 2018 06:19:16 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MJ_ihCerSvnf; Wed,  9 May 2018 06:19:14 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.96.165.dynamic.adsl.gvt.net.br [177.41.96.165])
        by osg.samsung.com (Postfix) with ESMTPSA id C59D12C226;
        Wed,  9 May 2018 06:19:10 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fGOzs-0004Ok-UZ; Wed, 09 May 2018 10:19:08 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Russell King <linux@armlinux.org.uk>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: [PATCH v2 10/11] arch/*: Kconfig: fix documentation for NMI watchdog
Date:   Wed,  9 May 2018 10:18:53 -0300
Message-Id: <30b7698983a917b736088821420ac0c3bd9f9a0f.1525870886.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525870886.git.mchehab+samsung@kernel.org>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1525870886.git.mchehab+samsung@kernel.org>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 9919cba7ff71 ("watchdog: Update documentation") updated
the documentation, removing the old nmi_watchdog.txt and adding
a file with a new content.

Update Kconfig files accordingly.

Fixes: 9919cba7ff71 ("watchdog: Update documentation")

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 arch/arm/Kconfig    | 2 +-
 arch/parisc/Kconfig | 2 +-
 arch/sh/Kconfig     | 2 +-
 arch/sparc/Kconfig  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index a7f8e7f4b88f..7b4fa8356978 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1305,7 +1305,7 @@ config SMP
 	  will run faster if you say N here.
 
 	  See also <file:Documentation/x86/i386/IO-APIC.txt>,
-	  <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO available at
+	  <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO available at
 	  <http://tldp.org/HOWTO/SMP-HOWTO.html>.
 
 	  If you don't know what to do here, say N.
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index fc5a574c3482..b6823215cc9a 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -279,7 +279,7 @@ config SMP
 	  machines, but will use only one CPU of a multiprocessor machine.
 	  On a uniprocessor machine, the kernel will run faster if you say N.
 
-	  See also <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO
+	  See also <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO
 	  available at <http://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 97fe29316476..bf628dd7c195 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -689,7 +689,7 @@ config SMP
 	  People using multiprocessor machines who say Y here should also say
 	  Y to "Enhanced Real Time Clock Support", below.
 
-	  See also <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO
+	  See also <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO
 	  available at <http://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 8767e45f1b2b..66171c2e428b 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -189,7 +189,7 @@ config SMP
 	  Y to "Enhanced Real Time Clock Support", below. The "Advanced Power
 	  Management" code will be disabled if you say Y here.
 
-	  See also <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO
+	  See also <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO
 	  available at <http://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
