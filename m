Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1EE847D584
	for <lwn-linux-doc@archive.lwn.net>; Thu, 16 Aug 2018 17:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbeHPUFu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 16 Aug 2018 16:05:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:46572 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727623AbeHPUFt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Aug 2018 16:05:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DFC6DAF5D;
        Thu, 16 Aug 2018 17:06:04 +0000 (UTC)
From:   Michal Suchanek <msuchanek@suse.de>
To:     Laura Abbott <labbott@redhat.com>
Cc:     Michal Suchanek <msuchanek@suse.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Fix LOADLIBES rename in Documentation/kbuild/makefiles.txt
Date:   Thu, 16 Aug 2018 19:05:55 +0200
Message-Id: <20180816170555.21623-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.13.7
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Fixes: 8377bd2b9ee1 ("kbuild: Rename HOST_LOADLIBES to
		KBUILD_HOSTLDLIBS")

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 Documentation/kbuild/makefiles.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 766355b1d221..7b6a2b2bdc98 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -680,7 +680,7 @@ Both possibilities are described in the following.
 
 	Example:
 		#scripts/kconfig/Makefile
-		HOSTLOADLIBES_qconf := -L$(QTDIR)/lib
+		HOSTLDLIBS_qconf := -L$(QTDIR)/lib
 
 	When linking qconf, it will be passed the extra option
 	"-L$(QTDIR)/lib".
-- 
2.13.7

