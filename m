Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6AEFD7E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 10:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752397AbeEGKpa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 06:45:30 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:51009 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751860AbeEGKob (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 06:44:31 -0400
Received: by mail-wm0-f68.google.com with SMTP id t11so12660243wmt.0
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 03:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8nCQFdj9n+qHbHH9QXWQkAqREtDxAhtk0hOQfc7byIs=;
        b=XIpITGxcDnbViGCQu2qPQ1W/Ujza38fjtMhN9jlir6aeoo8wu05nbflXX12cz5re3f
         3Rh/OkxKU/i9FSaHRLQOPWsMGljTP3pG1oGI0wGUoozqyc4h9a2qztaCCNQ9zQCSFHQH
         6nZ0uHb7hJAGB+fbYlHHcD+Id40WW5oDLDOnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8nCQFdj9n+qHbHH9QXWQkAqREtDxAhtk0hOQfc7byIs=;
        b=j748P5tlGID8/LtrgpBOxnOffV5Ebui3HsHip4hHWOtTiMGPsEjgZMTmgaxA5tVrdA
         INv3/bRbZpCXS3iFKfYnCLrLTmBaSAC31fLunnulvWSSjDaUAOVxEf5c39R7Ajbx3RUg
         J5xK+3UDVTiJv2VyCYEK7umCRNGjpBDUzrINZVkTYIbIdwLVYcUl/VRR73pMszQxA+1g
         9dW8GT8jYIZO8/xuc6hMdjFUH/21f4YQF7wjlFsgMowiRpQzTF5w7mhdEQZB6ewItYJa
         fcIvQDp8hg7tyjAOECPBC+3clPdKEI9YkrvXGLpgQ1k0Ys57xSOb8d++uKJA35bylaER
         Qj3A==
X-Gm-Message-State: ALKqPwdKdRdxXIt/b85/FG7aQEnNxfkqm7f0XNaxB5ruPKzK5T2BQ0um
        aFZeb4S9Rg0sjxd8LovLYED1tA==
X-Google-Smtp-Source: AB8JxZpOANKrx2RZvWgS+ZUXtHLxF3xQsgMOyBpki+lbOcfdVSWWUeahXnkEtdLWqGHIeoL58QQz3A==
X-Received: by 10.28.48.70 with SMTP id w67mr428119wmw.47.1525689869937;
        Mon, 07 May 2018 03:44:29 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id k82-v6sm7427307wmf.17.2018.05.07.03.44.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 07 May 2018 03:44:29 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v3 4/6] Documentation/features/locking: Use '!RWSEM_GENERIC_SPINLOCK' as Kconfig for 'rwsem-optimized'
Date:   Mon,  7 May 2018 12:43:41 +0200
Message-Id: <1525689823-3340-5-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525689823-3340-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1525689823-3340-1-git-send-email-andrea.parri@amarulasolutions.com>
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
