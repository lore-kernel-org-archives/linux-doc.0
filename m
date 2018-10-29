Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ECDE47D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 29 Oct 2018 15:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbeJ3Ali (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 29 Oct 2018 20:41:38 -0400
Received: from condef-05.nifty.com ([202.248.20.70]:28942 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbeJ3Ali (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Oct 2018 20:41:38 -0400
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Oct 2018 20:41:36 EDT
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-05.nifty.com with ESMTP id w9TFgJBP028068;
        Tue, 30 Oct 2018 00:42:22 +0900
Received: from grover.tkatk1.zaq.ne.jp (zaqdadce369.zaq.ne.jp [218.220.227.105]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id w9TFfWK3013655;
        Tue, 30 Oct 2018 00:41:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com w9TFfWK3013655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1540827693;
        bh=xMpzX31pEjrG2cKDEOQ6VMPhjxV09pqI6xMEUNfOb3g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tupr6Qt1QCw1wOXqjlWl25fpuBj00y5CyVpZKIqxm2f4jGiRGSBKZytAI1PKf0dlP
         jWVNBstDEYw8rvibX6ccSLCcOQA4B+yYEWVAioi3X5RBACzoVoib7B7zIx8yrLVCWZ
         kG78SFpqSWA/tw1AKo6zNoKvXYK+1S+K9JVw1jxwPG8l1NqX9a3W57E3Q2aKPKqXTJ
         W3F7zWBYjTifDgtToJ4KyRREZOw4/6nyFg9ijp5xiRgr2wMuW2tmEVhgRsMwL1xiBd
         J0BQ/OjHmxnuz//AbYAN4bLzBlJ4HVKiLU5+3IdpTEBi6cEsLN++a5zbf12FVyViCj
         Oq+JCTVTU10cQ==
X-Nifty-SrcIP: [218.220.227.105]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        "David S. Miller" <davem@davemloft.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: remove silentoldconfig target
Date:   Tue, 30 Oct 2018 00:41:28 +0900
Message-Id: <1540827688-15999-2-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540827688-15999-1-git-send-email-yamada.masahiro@socionext.com>
References: <1540827688-15999-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As commit 911a91c39cab ("kconfig: rename silentoldconfig to
syncconfig") announced, it is time for the removal.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/networking/ice.rst | 2 +-
 scripts/kconfig/Makefile         | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/networking/ice.rst b/Documentation/networking/ice.rst
index 1e4948c..4d118b8 100644
--- a/Documentation/networking/ice.rst
+++ b/Documentation/networking/ice.rst
@@ -20,7 +20,7 @@ Enabling the driver
 The driver is enabled via the standard kernel configuration system,
 using the make command::
 
-  make oldconfig/silentoldconfig/menuconfig/etc.
+  make oldconfig/menuconfig/etc.
 
 The driver is located in the menu structure at:
 
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 5d37a60..63b6092 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -68,14 +68,7 @@ PHONY += $(simple-targets)
 $(simple-targets): $(obj)/conf
 	$< $(silent) --$@ $(Kconfig)
 
-PHONY += silentoldconfig savedefconfig defconfig
-
-# We do not expect manual invokcation of "silentoldcofig" (or "syncconfig").
-silentoldconfig: syncconfig
-	@echo "  WARNING: \"silentoldconfig\" has been renamed to \"syncconfig\""
-	@echo "            and is now an internal implementation detail."
-	@echo "            What you want is probably \"oldconfig\"."
-	@echo "            \"silentoldconfig\" will be removed after Linux 4.19"
+PHONY += savedefconfig defconfig
 
 savedefconfig: $(obj)/conf
 	$< $(silent) --$@=defconfig $(Kconfig)
-- 
2.7.4

