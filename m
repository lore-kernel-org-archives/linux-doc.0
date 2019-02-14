Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC8577D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Feb 2019 03:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404501AbfBNDGW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Feb 2019 22:06:22 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:64821 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393851AbfBNDGS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Feb 2019 22:06:18 -0500
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x1E35Pg5020814;
        Thu, 14 Feb 2019 12:05:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x1E35Pg5020814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1550113527;
        bh=12ymzprJkRQOxFpe2dJ/Cbc9UDJYC/XmnLNco9k9Spw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tG9dxpNyBLAjEl8FblEfSiTQNpAD2n7eZvUoSTp7oHhj+PdGsZOOShr45k7YF+n2t
         l8YJbVG5Cu91/z7QDjULzMd4nEFu2/Y5n36u625G5FuVsZXb8smX4oK9q80IkREExn
         B/6408aN990ydI6bYIAuRIR3JsNBXej8nkR894OlZ2MFqpI3iiQkBjiNSg++Y6/6vJ
         tkkUlTEgmcKKQnSDQHbZLp6U8LIKc6ZG956gfwC6D7xu7BCvQlYq4tjMYYuMz/75YJ
         QIq5qy6xrZaZKnhdGYbzUI2LDCoHnTOmhUnK/JKHIPleHawAX+KUTDuraB8eBSPtxJ
         E3eF7DRjFVBvQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 4/8] kbuild: turn '/' into an alias of './'
Date:   Thu, 14 Feb 2019 12:05:17 +0900
Message-Id: <1550113521-23577-4-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 06300b21f4c7 ("kbuild: support building individual files for
external modules") introduced the '/' target. It works only for
external modules to build all .o files, but skip the modpost stage.

However, 'make /' looks a bit weird to me. 'make ./' is more sensible
if you want to build all objects under the current directory, and it
works as expected.

Let's change '/' into a phony target that is an alias of './', but
I may feel like deprecating it in the future.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/modules.txt | 2 +-
 Makefile                         | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/modules.txt b/Documentation/kbuild/modules.txt
index 3fb39e0..80295c6 100644
--- a/Documentation/kbuild/modules.txt
+++ b/Documentation/kbuild/modules.txt
@@ -140,7 +140,7 @@ executed to make module versioning work.
 		make -C $KDIR M=$PWD bar.lst
 		make -C $KDIR M=$PWD baz.o
 		make -C $KDIR M=$PWD foo.ko
-		make -C $KDIR M=$PWD /
+		make -C $KDIR M=$PWD ./
 
 
 === 3. Creating a Kbuild File for an External Module
diff --git a/Makefile b/Makefile
index fe62de3..3956e93 100644
--- a/Makefile
+++ b/Makefile
@@ -1709,8 +1709,9 @@ endif
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 
 # Modules
-/: prepare FORCE
-	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
+PHONY += /
+/: ./
+
 # Make sure the latest headers are built for Documentation
 Documentation/ samples/: headers_install
 %/: prepare FORCE
-- 
2.7.4

