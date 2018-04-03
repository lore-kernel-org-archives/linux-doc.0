Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2CEF37DD32
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Apr 2018 16:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752814AbeDCQ45 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Apr 2018 12:56:57 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:51794 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752777AbeDCQ4p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Apr 2018 12:56:45 -0400
Received: by mail-wm0-f65.google.com with SMTP id v21so35206322wmc.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Apr 2018 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5+lPfA46xXretGRn41sUebo7VFyUNAHKOhcO0U3CPs8=;
        b=PNc25VDl4eXxnCrfPs6z8PY+I0mrYRWdZRDcnEPavElCqkzSxQM2ahhJbJOUIPwr1j
         Yh8vKuUwS0KrWhR4sezo1RxjG7N33UN7S49E2o3oXCWVjIyVqZ7Dn5+wzHBPe7YtyoAR
         QVT/sOaEkzHsSu0oVq6eRupeKlbGSgiEYzc7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5+lPfA46xXretGRn41sUebo7VFyUNAHKOhcO0U3CPs8=;
        b=Vkn0J47TSpPYwdagANFb02+NViqILDX4M5LfJgVeNID2E525r3J9umGj/Gg1eJ+MFh
         1yzbRpBvo3h5B69rw/gNDX0/nuMg9d7NRS9o71aneXENhfyvbV04Ao9TvSjJtygrV149
         vteEKoIUxnLoL9kFHlJD1V53dzdthh8HuABsUnBpuQw5kPby43xnJcsoul9QkNfv/Gv5
         ba68oNBhwOj4B+ntnyyfASnHFK3ji9SQG89ujpPDf2Filx1ISI+whi8c0e7qYPYxniub
         JlCtuXTHPKa3qxsx+C/BF1XW0v/UvKdZvXyTlNiy6OXT90moJe5K9u6tqFmd2yW38MyE
         dgcQ==
X-Gm-Message-State: AElRT7FDBBBUWhnPcB/+cBp9OdL5gl1DZVB6kjJqrSlZmfCIpVBxDrGJ
        RpUfeQrtkviPb1hutgxzOL8bfH7b
X-Google-Smtp-Source: AIpwx488AzuI4Ilh1+fSmqfWlFTcItBFw8a8+0+HotcPj3Ru4QL8P4LKYdrz7j21UKpyG6cjx3iyIw==
X-Received: by 10.28.109.146 with SMTP id b18mr4645349wmi.95.1522774604698;
        Tue, 03 Apr 2018 09:56:44 -0700 (PDT)
Received: from localhost.localdomain ([213.209.242.222])
        by smtp.gmail.com with ESMTPSA id 135sm1653885wmv.12.2018.04.03.09.56.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 03 Apr 2018 09:56:44 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [PATCH 2/3] Documentation/features/core: Add arch support status files for 'cBPF-JIT' and 'eBPF-JIT'
Date:   Tue,  3 Apr 2018 18:55:50 +0200
Message-Id: <1522774551-9503-3-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522774551-9503-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1522774551-9503-1-git-send-email-andrea.parri@amarulasolutions.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
---
 .../features/core/BPF-JIT/arch-support.txt         | 31 ----------------------
 .../features/core/cBPF-JIT/arch-support.txt        |  5 ++++
 .../features/core/eBPF-JIT/arch-support.txt        |  5 ++++
 3 files changed, 10 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/features/core/BPF-JIT/arch-support.txt
 create mode 100644 Documentation/features/core/cBPF-JIT/arch-support.txt
 create mode 100644 Documentation/features/core/eBPF-JIT/arch-support.txt

diff --git a/Documentation/features/core/BPF-JIT/arch-support.txt b/Documentation/features/core/BPF-JIT/arch-support.txt
deleted file mode 100644
index 0b96b4e1e7d4a..0000000000000
--- a/Documentation/features/core/BPF-JIT/arch-support.txt
+++ /dev/null
@@ -1,31 +0,0 @@
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
-    |       nios2: | TODO |
-    |    openrisc: | TODO |
-    |      parisc: | TODO |
-    |     powerpc: |  ok  |
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
index 0000000000000..2ae2a7106e67d
--- /dev/null
+++ b/Documentation/features/core/cBPF-JIT/arch-support.txt
@@ -0,0 +1,5 @@
+#
+# Feature name:          cBPF-JIT
+#         Kconfig:       HAVE_CBPF_JIT
+#         description:   arch supports cBPF JIT optimizations
+#
diff --git a/Documentation/features/core/eBPF-JIT/arch-support.txt b/Documentation/features/core/eBPF-JIT/arch-support.txt
new file mode 100644
index 0000000000000..c8b0b458b9cec
--- /dev/null
+++ b/Documentation/features/core/eBPF-JIT/arch-support.txt
@@ -0,0 +1,5 @@
+#
+# Feature name:          eBPF-JIT
+#         Kconfig:       HAVE_EBPF_JIT
+#         description:   arch supports eBPF JIT optimizations
+#
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
