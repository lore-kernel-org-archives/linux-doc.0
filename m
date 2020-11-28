Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8843BC83026
	for <linux-doc@archiver.kernel.org>; Sat, 28 Nov 2020 22:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 511EF223BD
	for <linux-doc@archiver.kernel.org>; Sat, 28 Nov 2020 22:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="o/Sv0ww+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732602AbgK1Vt3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:29 -0500
Received: from condef-05.nifty.com ([202.248.20.70]:61333 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730484AbgK1SEX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Nov 2020 13:04:23 -0500
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-05.nifty.com with ESMTP id 0ASBqO0J018974;
        Sat, 28 Nov 2020 20:52:24 +0900
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0ASBpD6A027804;
        Sat, 28 Nov 2020 20:51:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0ASBpD6A027804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606564274;
        bh=Oe2ZFAifC7/qdzprizr4QT5l0mFUMCDjLUG0sLhHkhg=;
        h=From:To:Cc:Subject:Date:From;
        b=o/Sv0ww+iUid2SRO1Ut0r/Qraf8ys4jUb01lSJPxzQdd34OGGcSSDvc41ecS13u65
         ftzx9V71JNYBIMe6xW8hXNZLuQVrI5Yzk6ieDq59ULTkLZDCH0PpPfLOwUUYJqLCwQ
         A/fMn7R3hyRWzZWCeLmVOVLMQzYXrJrRO9ji0XBrRjamphfn5M7dbgvRGpgoBSzwXV
         Vg6/0sZbSpSZkEWGxYt2ArS7oKd92YFcpU6A4Z1Q26EkPTwOsdCmquNFby3ez+iEHo
         jBmWyreIHKSiXi2B8+oq2mp7HqwQXu+xMnf0FUjjKXVegC/FORiU4lgb201aO7gVwP
         7UyPswJKyvQJQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] kbuild: doc: update the description about kbuild Makefiles
Date:   Sat, 28 Nov 2020 20:51:02 +0900
Message-Id: <20201128115108.179256-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This line was written in 2003. Now we have much more Makefiles.

The number of Makefiles is not important. The point is we have a
Makefile in (almost) every directory.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 Documentation/kbuild/makefiles.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 0d5dd5413af0..a7b874097a91 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -71,7 +71,7 @@ The Makefiles have five parts::
 	.config			the kernel configuration file.
 	arch/$(ARCH)/Makefile	the arch Makefile.
 	scripts/Makefile.*	common rules etc. for all kbuild Makefiles.
-	kbuild Makefiles	there are about 500 of these.
+	kbuild Makefiles	exist in every subdirectory
 
 The top Makefile reads the .config file, which comes from the kernel
 configuration process.
-- 
2.27.0

