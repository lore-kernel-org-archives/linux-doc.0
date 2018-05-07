Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 151607E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 10:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752132AbeEGKok (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 06:44:40 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:53513 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752248AbeEGKof (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 06:44:35 -0400
Received: by mail-wm0-f68.google.com with SMTP id a67so12569081wmf.3
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PTNSL307hN6TuBUwZjKrUPvOqxudW+GpR536POFupE4=;
        b=WKMrmAga929OQ+Q2mQVirPu1H8nLNe6FGaEImJvdkusVNI1TrQmlsrx2NrDwfV91xZ
         b6U70KLeQSf+FHHePmUOPTdV4wqgiKJjsij/Y1Zso7f0CDypD7yRVTixfXF1J5ULVOg4
         U/ergRSVbsDubRrYwYgDk3LH4mngL/mq/Lox8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PTNSL307hN6TuBUwZjKrUPvOqxudW+GpR536POFupE4=;
        b=JXhQlEImsz7hcq15JU8GourTeP99GSOa5ZKzm7c2ADQsT2l6eKUCWig1UhQ/u2zylc
         c3SrVWvbc/2mTTX0Rs2tvFyjk531EcRMyJaMEdhcJNJH0b2+t/h62HfH/bXno7R8OXtN
         B9VWD4kSfZRifvc+ogiPr1aOurWe3do03U89JyI/RGHyFEFAxYTUo2b9pUIQi9P1H5ai
         qprJ2RetqI7j27O/q93HjgMnOptetC9l4YX7iYr7gVe71Vjm5d2fugIdUC0fUTiU1i6C
         szkWbRAg1GLGopjumW5kRCtBCw2gSTxTYmo6SqyYiM0s/U8/rg95LTQ1GkzWgFL/qAjd
         acIA==
X-Gm-Message-State: ALKqPwcr3T2Gke/84rzWgrOzhxfy+Wn2rbLb8QtJy7abPYe7R44EMS5f
        G/XtrKYQP5Fody8BMv3ix4nBEA==
X-Google-Smtp-Source: AB8JxZrSrAl3qGxYuZDETeEpKsrGvXR2lukahyKBC2sl7Bfvns3RuQse4HbyCGM77hHfQ4dVQ0is1Q==
X-Received: by 2002:a1c:b78a:: with SMTP id h132-v6mr419143wmf.21.1525689874060;
        Mon, 07 May 2018 03:44:34 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id k82-v6sm7427307wmf.17.2018.05.07.03.44.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 07 May 2018 03:44:33 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v3 6/6] Documentation/features/vm: Remove arch support status file for 'pte_special'
Date:   Mon,  7 May 2018 12:43:43 +0200
Message-Id: <1525689823-3340-7-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525689823-3340-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1525689823-3340-1-git-send-email-andrea.parri@amarulasolutions.com>
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
