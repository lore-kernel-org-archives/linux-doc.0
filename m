Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A8B937DF8B
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Jun 2018 16:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966287AbeFOQhh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Jun 2018 12:37:37 -0400
Received: from osg.samsung.com ([64.30.133.232]:40035 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966082AbeFOQbE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 15 Jun 2018 12:31:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id D978022BA8;
        Fri, 15 Jun 2018 09:31:03 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zEchXV9hmW6a; Fri, 15 Jun 2018 09:31:02 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.114.220.dynamic.adsl.gvt.net.br [177.41.114.220])
        by osg.samsung.com (Postfix) with ESMTPSA id 8FB2322B48;
        Fri, 15 Jun 2018 09:30:58 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.91)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fTrcl-000837-U8; Fri, 15 Jun 2018 13:30:55 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: [PATCH v4 03/26] arch/*: Kconfig: fix documentation for NMI watchdog
Date:   Fri, 15 Jun 2018 13:30:31 -0300
Message-Id: <3018fe79cb72e48491a2b35c577baa93af16af52.1529079119.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1529079119.git.mchehab+samsung@kernel.org>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1529079119.git.mchehab+samsung@kernel.org>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
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
index 483d2858e367..54eeb8d00bc6 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1302,7 +1302,7 @@ config SMP
 	  will run faster if you say N here.
 
 	  See also <file:Documentation/x86/i386/IO-APIC.txt>,
-	  <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO available at
+	  <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO available at
 	  <http://tldp.org/HOWTO/SMP-HOWTO.html>.
 
 	  If you don't know what to do here, say N.
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 4d8f64d48597..c480770fabcd 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -275,7 +275,7 @@ config SMP
 	  machines, but will use only one CPU of a multiprocessor machine.
 	  On a uniprocessor machine, the kernel will run faster if you say N.
 
-	  See also <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO
+	  See also <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO
 	  available at <http://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 4bedd1c97f29..dd4f3d3e644f 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -687,7 +687,7 @@ config SMP
 	  People using multiprocessor machines who say Y here should also say
 	  Y to "Enhanced Real Time Clock Support", below.
 
-	  See also <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO
+	  See also <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO
 	  available at <http://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 9a2b8877f174..0f535debf802 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -178,7 +178,7 @@ config SMP
 	  Y to "Enhanced Real Time Clock Support", below. The "Advanced Power
 	  Management" code will be disabled if you say Y here.
 
-	  See also <file:Documentation/nmi_watchdog.txt> and the SMP-HOWTO
+	  See also <file:Documentation/lockup-watchdogs.txt> and the SMP-HOWTO
 	  available at <http://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
