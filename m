Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E7B677E27F
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 10:44:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752253AbeEGKod (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 06:44:33 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:52946 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752139AbeEGKo3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 06:44:29 -0400
Received: by mail-wm0-f68.google.com with SMTP id w194so12583806wmf.2
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 03:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vDXXDp5CguB+/rPY7XduTJBDoYQbhUEjq3vSKBJeaKI=;
        b=qXV2aFfOXSfXA20o86OkzrWAAYarqIqt3KYAT6HWSpIPpU/b948k15LcUCLJK+mbdC
         MQ2kpeAzqY9n2YCULplItr9QAHMJZIOvY6tHDC1oaNellBw7LQQyrhmWx0ynKNo1RJ5s
         RjiXtVzTZ8MYZNPVxDLa6Kr+3D6qjtntUdYTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vDXXDp5CguB+/rPY7XduTJBDoYQbhUEjq3vSKBJeaKI=;
        b=siZkSoY3oSC07k56nZFrMLZCe9CGI5XJAaHsRKB+RLTemsfcXG5ffm4zWrp4yIbPOD
         jLxMr8DRuEJlJaOGgm7/r6LDjUYYZKX8tFtkccNL0YF+Pi+Ese8qj9mZ55iNkK7jtsiZ
         wUTFkevYampfwwb5p3W7IoMDFnYW0vtywKdToLHYT1dSFIMoXYOYqBfeQ2t9b1HXrfg1
         h1+Rdjmip327fM0BctNjvLI/AroSJAkruPlpRTtdw5eb2pX2nG1iVj41ybS3b5tsP1EZ
         jCyyPqXuHOkqpzZneZwmS/1Bh6S/oFvQ7LmQ3CldJidCfiXD2NRfjwfJiLXdgx1M4Tn0
         S8yQ==
X-Gm-Message-State: ALQs6tDRE0YBz1L2xqKMjBV6xRX+9LMg+YBlgTaAEb20rgyzZJ+jl0FD
        Uy+enOB+8g+H2N4+iZ+UZfjcbA==
X-Google-Smtp-Source: AB8JxZqa9+2KbBByN1a31dUvpiW/S/17dyB8xOpb6+Xc6qmJTbtmi49neDo7VCwVWstO80wWPY5Ydw==
X-Received: by 10.28.214.14 with SMTP id n14mr487353wmg.102.1525689867674;
        Mon, 07 May 2018 03:44:27 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id k82-v6sm7427307wmf.17.2018.05.07.03.44.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 07 May 2018 03:44:27 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v3 3/6] Documentation/features/core: Add arch support status files for 'cBPF-JIT' and 'eBPF-JIT'
Date:   Mon,  7 May 2018 12:43:40 +0200
Message-Id: <1525689823-3340-4-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525689823-3340-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1525689823-3340-1-git-send-email-andrea.parri@amarulasolutions.com>
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
