Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D707C7E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 10:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752328AbeEGKo6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 06:44:58 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:55193 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752296AbeEGKod (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 06:44:33 -0400
Received: by mail-wm0-f68.google.com with SMTP id f6so12613686wmc.4
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VUtJHWdNGSmsWFRb1uNEc1sl7rOWLfoI/0DYOT1mUlg=;
        b=ER0LXUayri8hLBXtxUaUned9YhduhtSiuTLO0nbYMuWdToo5egOnzp4IsFoLjWKP7v
         HCLqm9r3wqJG54IbKA8Tqwx76GbtOXZwWPRZGFKDfO2PuEel6+TT4K3SXpiqR8zakdIO
         nI3+VY6SfZAehgPj4996CvhHc0OyzSrjuWRFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VUtJHWdNGSmsWFRb1uNEc1sl7rOWLfoI/0DYOT1mUlg=;
        b=fAskoM+pqb8PRGnPV93u/n65TJCl0zhwh1RZaBEHjjgsPNi9XKa8c4+YxyEZo4wIAM
         7zER5qYd7TZCaXxfZ54EEy6hdez0UplexQaxX0UJUSbrb9hI35mSxwPtJjhr/Pcg9FWG
         gpMKqlvuxUpvNKJSxSuA2EwxqPaNIsSrJGCDtIdCeldzkVU7JILNs/46k3YzTOwjIcPi
         7Awl2Lwib+NJ4VbT9eI8PhWjvOT7fQntxcxa6O9LHEGSDZZ+iktNuwWvLFDaLTVc9sne
         Cn2N8SK1f+vHq1ii5WidWRZipij4mF5y9++c5Kd36AOXX7uHWP0Dkhi1mA+utx7WaFUZ
         n/qQ==
X-Gm-Message-State: ALQs6tCf7xwBtldxqavy20BptRAJ5SgvwvoMNbdP9CM4Y8AwUfhdNaEz
        SH6Eg4WOhA4NYcBbFeJ2qtc1dsA0
X-Google-Smtp-Source: AB8JxZruN7FCSfXuXbH5bV6gAvi8ah2MxrFT/WjCzKQClARJOU5DqcFlPoQLKm6VRVMoaa/kNAYvNQ==
X-Received: by 10.28.52.73 with SMTP id b70mr451353wma.42.1525689871814;
        Mon, 07 May 2018 03:44:31 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id k82-v6sm7427307wmf.17.2018.05.07.03.44.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 07 May 2018 03:44:31 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v3 5/6] Documentation/features/lib: Remove arch support status file for 'strncasecmp'
Date:   Mon,  7 May 2018 12:43:42 +0200
Message-Id: <1525689823-3340-6-git-send-email-andrea.parri@amarulasolutions.com>
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
