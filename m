Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 82D8F7E868
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Apr 2018 16:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752855AbeDHQcX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Apr 2018 12:32:23 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:39584 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752752AbeDHQbi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Apr 2018 12:31:38 -0400
Received: by mail-wr0-f196.google.com with SMTP id c24so6158986wrc.6
        for <linux-doc@vger.kernel.org>; Sun, 08 Apr 2018 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VUtJHWdNGSmsWFRb1uNEc1sl7rOWLfoI/0DYOT1mUlg=;
        b=o006QlEnaHpUOemmhsK0kc0egK0By7q2+KSfKj5ZkQM/BR8WEnFrXRYT16NtKS2dqi
         PzVtvnl4zJDxPxgaC3EYyA/nYTnr63JrFS/jLCaIJYBP1aRsxgsenYURRxMxQBZALBTa
         9dKf4B4Efzf8h7Df/C1EiqaCax4Dl3aENO/S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VUtJHWdNGSmsWFRb1uNEc1sl7rOWLfoI/0DYOT1mUlg=;
        b=hcYlasEbuojB+HNNlt2QCbiaqL0HN1qV4EFNUY9IVTfvCjgJHoK/YuDvfhWudaBueS
         KKRcQ/jfyEGT7pOolnnydoDnc9SCbY/9IhlK/akLfoLtSgaTOG/+IP74PCusoykJ5x31
         E1aPw59cJpfiuKk5+0+/CslJynCfBHebLwuusmR2ApgUoChigMnVUc2BrioMMbyBRcPr
         072eIILVL4uhMuA3bpW2C4glPSuslDsCK79HHj4XFiNTHEr59YfZI1JZ4GZBSITqhlkU
         oLWKfvFCiChxfFf7tw0VNr+buvhVjnxVKpqmyTlH23vWRw9sT71Nd5aj/9N49VIyPkuw
         1r2A==
X-Gm-Message-State: AElRT7G291ohmI4rizKr7okzmfIFigYe+4SKe4HEUrQjFvmc9OLYsLcu
        Y2ifdm1XUGz87d0KGIf1blXHFw==
X-Google-Smtp-Source: AIpwx4/rczzWZLwjKMFKENYWsLeoFwetMMLfMTlDL163G2aUnJigu4hHSV2Xh0f2fPtoQV3eOdf4xg==
X-Received: by 10.223.185.76 with SMTP id b12mr25173506wrg.205.1523205097364;
        Sun, 08 Apr 2018 09:31:37 -0700 (PDT)
Received: from localhost.localdomain ([95.235.67.87])
        by smtp.gmail.com with ESMTPSA id 10sm5335894wrz.58.2018.04.08.09.31.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Apr 2018 09:31:36 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v2 5/6] Documentation/features/lib: Remove arch support status file for 'strncasecmp'
Date:   Sun,  8 Apr 2018 18:30:26 +0200
Message-Id: <1523205027-31786-6-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 .../features/lib/strncasecmp/arch-support.txt      | 33 ----------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 Documentation/features/lib/strncasecmp/arch-support.txt

diff --git a/Documentation/features/lib/strncasecmp/arch-support.txt b/Documentation/features/lib/strncasecmp/arch-support.txt
deleted file mode 100644
index 6148f42c3d902..0000000000000
--- a/Documentation/features/lib/strncasecmp/arch-support.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-#
-# Feature name:          strncasecmp
-#         Kconfig:       __HAVE_ARCH_STRNCASECMP
-#         description:   arch provides an optimized strncasecmp() function
-#
-    -----------------------
-    |         arch |status|
-    -----------------------
-    |       alpha: | TODO |
-    |         arc: | TODO |
-    |         arm: | TODO |
-    |       arm64: | TODO |
-    |         c6x: | TODO |
-    |       h8300: | TODO |
-    |     hexagon: | TODO |
-    |        ia64: | TODO |
-    |        m68k: | TODO |
-    |  microblaze: | TODO |
-    |        mips: | TODO |
-    |       nds32: | TODO |
-    |       nios2: | TODO |
-    |    openrisc: | TODO |
-    |      parisc: | TODO |
-    |     powerpc: | TODO |
-    |       riscv: | TODO |
-    |        s390: | TODO |
-    |          sh: | TODO |
-    |       sparc: | TODO |
-    |          um: | TODO |
-    |   unicore32: | TODO |
-    |         x86: | TODO |
-    |      xtensa: | TODO |
-    -----------------------
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
