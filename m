Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9ECDC7D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Jul 2018 02:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754551AbeGJCIp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Jul 2018 22:08:45 -0400
Received: from ozlabs.org ([203.11.71.1]:47775 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754450AbeGJCIl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Jul 2018 22:08:41 -0400
Received: by ozlabs.org (Postfix, from userid 1034)
        id 41Plx34Qfmz9s37; Tue, 10 Jul 2018 12:08:39 +1000 (AEST)
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     corbet@lwn.net
Cc:     keescook@chromium.org, tglx@linutronix.de, konrad.wilk@oracle.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@ozlabs.org
Subject: [PATCH] Documentation: Add powerpc options for spec_store_bypass_disable
Date:   Tue, 10 Jul 2018 12:08:36 +1000
Message-Id: <20180710020836.23571-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.14.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the support for spec_store_bypass_disable that was added for
powerpc in commit a048a07d7f45 ("powerpc/64s: Add support for a store
forwarding barrier at kernel entry/exit").

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 Documentation/admin-guide/kernel-parameters.txt | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

I tried documenting the differences between the PPC options and X86 ones in one
section, but it got quite messy, so I went with this instead. Happy to take
advice on how better to structure it if anyone has opinions.

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index efc7aa7a0670..f320c7168b04 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4060,6 +4060,8 @@
 			This parameter controls whether the Speculative Store
 			Bypass optimization is used.
 
+			On x86 the options are:
+
 			on      - Unconditionally disable Speculative Store Bypass
 			off     - Unconditionally enable Speculative Store Bypass
 			auto    - Kernel detects whether the CPU model contains an
@@ -4075,12 +4077,20 @@
 			seccomp - Same as "prctl" above, but all seccomp threads
 				  will disable SSB unless they explicitly opt out.
 
-			Not specifying this option is equivalent to
-			spec_store_bypass_disable=auto.
-
 			Default mitigations:
 			X86:	If CONFIG_SECCOMP=y "seccomp", otherwise "prctl"
 
+			On powerpc the options are:
+
+			on,auto - On Power8 and Power9 insert a store-forwarding
+				  barrier on kernel entry and exit. On Power7
+				  perform a software flush on kernel entry and
+				  exit.
+			off	- No action.
+
+			Not specifying this option is equivalent to
+			spec_store_bypass_disable=auto.
+
 	spia_io_base=	[HW,MTD]
 	spia_fio_base=
 	spia_pedr=
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
