Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3BDF7DD32
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Apr 2018 16:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752745AbeDHQbi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Apr 2018 12:31:38 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:37072 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752668AbeDHQbf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Apr 2018 12:31:35 -0400
Received: by mail-wr0-f194.google.com with SMTP id l49so6170832wrl.4
        for <linux-doc@vger.kernel.org>; Sun, 08 Apr 2018 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8nCQFdj9n+qHbHH9QXWQkAqREtDxAhtk0hOQfc7byIs=;
        b=QBUwVVkGlOgM/V67xTY0kmTSrS8SBQ5GeCkwTnl/NStvqhitg4U7kSbUndFNOEExiB
         lM/uRg7Ao0xMTmZ9tsdTUM6a1MtFIUHABdGwMp31QdOGT/9K+3VoXPV3QX44lzTzamgZ
         Vt6w+96KMeItmh4wtfAtCV/eqMausNod7sV+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8nCQFdj9n+qHbHH9QXWQkAqREtDxAhtk0hOQfc7byIs=;
        b=p2NC1N5zmTzX+wHfX1GAJ/ncTsVDlXKJO5ZCVWxzm/MA5GAmgIjpeaa1gOZbtLrFvl
         ts2Q3E+Oya224sj3Ay6pWoLetBOuXz74nV1L2C4j47ZBiZu5l4ROCUeId/8eg7GjG25X
         DuLWVuuD6VRaxnFfihzFfwkE9P5SXpHGOMUX8oOBuSrocVeVKTkS3/Wu00t0K4t+4Upw
         FKeIRpiigPi7jDcGzOCsWnuO6eBJJAeSoio0oWGJg8CeMQyj2K9r/7XO1yhNiwPIhATd
         OWBvOSX8sexq23UH/hTMpIUtcjxcvQJW5LmOgHAtgqIMhWcTjer9aMQARueyieKAvjO4
         islg==
X-Gm-Message-State: AElRT7Guc4QD2FvSOx0sMjduTMcUb3KFNYkpgjneRQRRw3NWtHcA+vAy
        cMyiJsl6GmTF4QkIic3FltizAg==
X-Google-Smtp-Source: AIpwx4/3J6de4xSRZZIa3Wa4myA/8CnDXMb5KnGkbgi7Ip9Xtt/lMr0K5bx176/oQ+4JpHww1m/DKA==
X-Received: by 10.223.174.227 with SMTP id y90mr23019540wrc.76.1523205094548;
        Sun, 08 Apr 2018 09:31:34 -0700 (PDT)
Received: from localhost.localdomain ([95.235.67.87])
        by smtp.gmail.com with ESMTPSA id 10sm5335894wrz.58.2018.04.08.09.31.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Apr 2018 09:31:34 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v2 4/6] Documentation/features/locking: Use '!RWSEM_GENERIC_SPINLOCK' as Kconfig for 'rwsem-optimized'
Date:   Sun,  8 Apr 2018 18:30:25 +0200
Message-Id: <1523205027-31786-5-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Uses '!RWSEM_GENERIC_SPINLOCK' in place of 'Optimized asm/rwsem.h' as
Kconfig for 'rwsem-optimized': the new Kconfig expresses this feature
equivalently, while also enabling the script 'features-refresh.sh' to
operate on the corresponding arch support status file. Also refreshes
the status matrix by using the script 'features-refresh.sh'.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 Documentation/features/locking/rwsem-optimized/arch-support.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/features/locking/rwsem-optimized/arch-support.txt b/Documentation/features/locking/rwsem-optimized/arch-support.txt
index 8afe24ffa3ab4..e54b1f1a8091d 100644
--- a/Documentation/features/locking/rwsem-optimized/arch-support.txt
+++ b/Documentation/features/locking/rwsem-optimized/arch-support.txt
@@ -1,6 +1,6 @@
 #
 # Feature name:          rwsem-optimized
-#         Kconfig:       Optimized asm/rwsem.h
+#         Kconfig:       !RWSEM_GENERIC_SPINLOCK
 #         description:   arch provides optimized rwsem APIs
 #
     -----------------------
@@ -8,8 +8,8 @@
     -----------------------
     |       alpha: |  ok  |
     |         arc: | TODO |
-    |         arm: | TODO |
-    |       arm64: | TODO |
+    |         arm: |  ok  |
+    |       arm64: |  ok  |
     |         c6x: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
@@ -26,7 +26,7 @@
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |
-    |          um: | TODO |
+    |          um: |  ok  |
     |   unicore32: | TODO |
     |         x86: |  ok  |
     |      xtensa: |  ok  |
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
