Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C26F77E88F
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Apr 2018 16:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752947AbeDHQdC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Apr 2018 12:33:02 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:38628 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752680AbeDHQbc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Apr 2018 12:31:32 -0400
Received: by mail-wr0-f194.google.com with SMTP id m13so6157089wrj.5
        for <linux-doc@vger.kernel.org>; Sun, 08 Apr 2018 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vDXXDp5CguB+/rPY7XduTJBDoYQbhUEjq3vSKBJeaKI=;
        b=IokSTXcG5V9F/hvmDOsN1tdaH4ncScNthogrX15nkOZ8/+h0rYDIqAUnaWnmwejZgG
         x3hLPHKTjHgAvnJ9LIcaqZ6J6WhCY7T2LGaX/MDXAwcPyYpCY6FU9jsIZFrJI0vyDWDy
         PqMD+Ax8aLCRKXRbhIoCJtO2a8JNlASqT6Bd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vDXXDp5CguB+/rPY7XduTJBDoYQbhUEjq3vSKBJeaKI=;
        b=nx02rQ3EbCSs6cUs5oVLngd4PDzhxdfDKjKRoWiYjjLMgu7XRUaeRNMzkd1Z8g8m6H
         CbTPPa1N1a3jUUe2W8ATK80WlvYQNOVrFd0vtr4OUmqGoBQlH2bNMFa/27/pT8veLZWd
         7yNHvoNcOnVh1wypqbsRAWebNhy1KUzff38vBo/Q6+zrE92HdeIKLKod/6OBtQmivTUB
         wUzjQA6ZODB/eNQ7PKseumfMfCVSvbkKB4py+HU8S+caI04dRXogDyRdy5gs84cOBJtC
         poHCeqOQ9gynTksKbzJDCtVhejRyLNK/e9CeJJu4MxDP+p2u6Hhgy34F824TbABL6lUA
         rENg==
X-Gm-Message-State: AElRT7GQEHXVGCvBjnt1dB1RK/PnZXRpS95tkQM7K60HGp8Qzbub7B46
        NSuXmY2mPoEPPsuyG4CJ6cchHA==
X-Google-Smtp-Source: AIpwx48FjpeTEQKts7jH/iN3slaZgQgr4mSalXwnKeFWnXFkQxo5GjINqrVuUyMfcK3k9Jp4YbKDZA==
X-Received: by 10.223.153.114 with SMTP id x105mr23348308wrb.108.1523205091468;
        Sun, 08 Apr 2018 09:31:31 -0700 (PDT)
Received: from localhost.localdomain ([95.235.67.87])
        by smtp.gmail.com with ESMTPSA id 10sm5335894wrz.58.2018.04.08.09.31.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Apr 2018 09:31:30 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v2 3/6] Documentation/features/core: Add arch support status files for 'cBPF-JIT' and 'eBPF-JIT'
Date:   Sun,  8 Apr 2018 18:30:24 +0200
Message-Id: <1523205027-31786-4-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 6077776b5908e split 'HAVE_BPF_JIT' into cBPF and eBPF variant.
Adds arch support status files for the new variants, and removes the
status file corresponding to 'HAVE_BPT_JIT'. The new status matrices
were auto-generated using the script 'features-refresh.sh'.

Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 .../features/core/BPF-JIT/arch-support.txt         | 33 ----------------------
 .../features/core/cBPF-JIT/arch-support.txt        | 33 ++++++++++++++++++++++
 .../features/core/eBPF-JIT/arch-support.txt        | 33 ++++++++++++++++++++++
 3 files changed, 66 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/features/core/BPF-JIT/arch-support.txt
 create mode 100644 Documentation/features/core/cBPF-JIT/arch-support.txt
 create mode 100644 Documentation/features/core/eBPF-JIT/arch-support.txt

diff --git a/Documentation/features/core/BPF-JIT/arch-support.txt b/Documentation/features/core/BPF-JIT/arch-support.txt
deleted file mode 100644
index d277f971ccd6b..0000000000000
--- a/Documentation/features/core/BPF-JIT/arch-support.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-#
-# Feature name:          BPF-JIT
-#         Kconfig:       HAVE_BPF_JIT
-#         description:   arch supports BPF JIT optimizations
-#
-    -----------------------
-    |         arch |status|
-    -----------------------
-    |       alpha: | TODO |
-    |         arc: | TODO |
-    |         arm: |  ok  |
-    |       arm64: |  ok  |
-    |         c6x: | TODO |
-    |       h8300: | TODO |
-    |     hexagon: | TODO |
-    |        ia64: | TODO |
-    |        m68k: | TODO |
-    |  microblaze: | TODO |
-    |        mips: |  ok  |
-    |       nds32: | TODO |
-    |       nios2: | TODO |
-    |    openrisc: | TODO |
-    |      parisc: | TODO |
-    |     powerpc: |  ok  |
-    |       riscv: | TODO |
-    |        s390: |  ok  |
-    |          sh: | TODO |
-    |       sparc: |  ok  |
-    |          um: | TODO |
-    |   unicore32: | TODO |
-    |         x86: |  ok  |
-    |      xtensa: | TODO |
-    -----------------------
diff --git a/Documentation/features/core/cBPF-JIT/arch-support.txt b/Documentation/features/core/cBPF-JIT/arch-support.txt
new file mode 100644
index 0000000000000..90459cdde3143
--- /dev/null
+++ b/Documentation/features/core/cBPF-JIT/arch-support.txt
@@ -0,0 +1,33 @@
+#
+# Feature name:          cBPF-JIT
+#         Kconfig:       HAVE_CBPF_JIT
+#         description:   arch supports cBPF JIT optimizations
+#
+    -----------------------
+    |         arch |status|
+    -----------------------
+    |       alpha: | TODO |
+    |         arc: | TODO |
+    |         arm: | TODO |
+    |       arm64: | TODO |
+    |         c6x: | TODO |
+    |       h8300: | TODO |
+    |     hexagon: | TODO |
+    |        ia64: | TODO |
+    |        m68k: | TODO |
+    |  microblaze: | TODO |
+    |        mips: |  ok  |
+    |       nds32: | TODO |
+    |       nios2: | TODO |
+    |    openrisc: | TODO |
+    |      parisc: | TODO |
+    |     powerpc: |  ok  |
+    |       riscv: | TODO |
+    |        s390: | TODO |
+    |          sh: | TODO |
+    |       sparc: |  ok  |
+    |          um: | TODO |
+    |   unicore32: | TODO |
+    |         x86: | TODO |
+    |      xtensa: | TODO |
+    -----------------------
diff --git a/Documentation/features/core/eBPF-JIT/arch-support.txt b/Documentation/features/core/eBPF-JIT/arch-support.txt
new file mode 100644
index 0000000000000..c90a0382fe667
--- /dev/null
+++ b/Documentation/features/core/eBPF-JIT/arch-support.txt
@@ -0,0 +1,33 @@
+#
+# Feature name:          eBPF-JIT
+#         Kconfig:       HAVE_EBPF_JIT
+#         description:   arch supports eBPF JIT optimizations
+#
+    -----------------------
+    |         arch |status|
+    -----------------------
+    |       alpha: | TODO |
+    |         arc: | TODO |
+    |         arm: |  ok  |
+    |       arm64: |  ok  |
+    |         c6x: | TODO |
+    |       h8300: | TODO |
+    |     hexagon: | TODO |
+    |        ia64: | TODO |
+    |        m68k: | TODO |
+    |  microblaze: | TODO |
+    |        mips: |  ok  |
+    |       nds32: | TODO |
+    |       nios2: | TODO |
+    |    openrisc: | TODO |
+    |      parisc: | TODO |
+    |     powerpc: |  ok  |
+    |       riscv: | TODO |
+    |        s390: |  ok  |
+    |          sh: | TODO |
+    |       sparc: |  ok  |
+    |          um: | TODO |
+    |   unicore32: | TODO |
+    |         x86: |  ok  |
+    |      xtensa: | TODO |
+    -----------------------
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
