Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 714167E868
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Apr 2018 16:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752623AbeDHQbn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Apr 2018 12:31:43 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:46118 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752796AbeDHQbl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Apr 2018 12:31:41 -0400
Received: by mail-wr0-f196.google.com with SMTP id d1so6141054wrj.13
        for <linux-doc@vger.kernel.org>; Sun, 08 Apr 2018 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PTNSL307hN6TuBUwZjKrUPvOqxudW+GpR536POFupE4=;
        b=e3RUdBcl2gOdg7UxPFuIixtuo/8VGwdBT8Qda+04k1KKESd8fh8NCgxXiIyxvGW1F5
         TZr98jRW1lIwkc8Z0/uQc1WnIni/RtFB7rICpZz3xoTuTtQAyKvq8ZZXglrKZcDFkzOn
         Ff0MvBkrd0+UNP6dy5I2E5vI9Jz/Xj4Y962yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PTNSL307hN6TuBUwZjKrUPvOqxudW+GpR536POFupE4=;
        b=p9gzf43yAw0yU15R3VILWudP4MFttnka95rat6SAt2S/4ww/D5hW8kzA4OR1ohLoxP
         +I0OaG08GWph3X3pJxP+6s320oote1CPnzFSjxwpotv1zXhrZTmZbjG42kJQsWzNjLn3
         wrQAzh6Xaaxu/bKeCZCH68xMK6KuN/1+6VmEvhd/9MCuKhC5SI9hEWFOMN8bWORJyb14
         ErPDhNIjbgutj0oyiwG60SRnZz/73/o2kGcKB0IaklBsS17nNbBBJkCYJCWzI0eBuygf
         WO4eXGyRzXtOFe5IaB5MqnIBc7dpx6ZQN0M7OwvX7FsPxyjYs500Z9wAra9PDnnm4w4D
         hlLg==
X-Gm-Message-State: AElRT7FC2tEBA82wBzHOCr+XxAS4jEzkCrq9FLuUaDip1zqQncYxi4d1
        iWvqEJziAwh7r7Cb4ZEvMRTIVg==
X-Google-Smtp-Source: AIpwx49p9dLTNbkrk1z6JPnw581N1aCxquYiUsrcnZoDvW+OkFFnsMFimWxL/kObxVD2HdUSg1KIKw==
X-Received: by 10.223.138.172 with SMTP id y41mr23190048wry.98.1523205099925;
        Sun, 08 Apr 2018 09:31:39 -0700 (PDT)
Received: from localhost.localdomain ([95.235.67.87])
        by smtp.gmail.com with ESMTPSA id 10sm5335894wrz.58.2018.04.08.09.31.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Apr 2018 09:31:39 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v2 6/6] Documentation/features/vm: Remove arch support status file for 'pte_special'
Date:   Sun,  8 Apr 2018 18:30:27 +0200
Message-Id: <1523205027-31786-7-git-send-email-andrea.parri@amarulasolutions.com>
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
 .../features/vm/pte_special/arch-support.txt       | 33 ----------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 Documentation/features/vm/pte_special/arch-support.txt

diff --git a/Documentation/features/vm/pte_special/arch-support.txt b/Documentation/features/vm/pte_special/arch-support.txt
deleted file mode 100644
index 6a608a6dcf71d..0000000000000
--- a/Documentation/features/vm/pte_special/arch-support.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-#
-# Feature name:          pte_special
-#         Kconfig:       __HAVE_ARCH_PTE_SPECIAL
-#         description:   arch supports the pte_special()/pte_mkspecial() VM APIs
-#
-    -----------------------
-    |         arch |status|
-    -----------------------
-    |       alpha: | TODO |
-    |         arc: |  ok  |
-    |         arm: |  ok  |
-    |       arm64: |  ok  |
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
-    |     powerpc: |  ok  |
-    |       riscv: | TODO |
-    |        s390: |  ok  |
-    |          sh: |  ok  |
-    |       sparc: |  ok  |
-    |          um: | TODO |
-    |   unicore32: | TODO |
-    |         x86: |  ok  |
-    |      xtensa: | TODO |
-    -----------------------
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
