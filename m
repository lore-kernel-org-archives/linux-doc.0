Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2BAD7D8E7
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 02:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730411AbeKML7c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 06:59:32 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34379 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730379AbeKML7c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 06:59:32 -0500
Received: by mail-pg1-f193.google.com with SMTP id 17so4655251pgg.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 18:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=subject:date:message-id:in-reply-to:references:cc:from:to;
        bh=zug94Vzv51FeDoXqv/Owc4YFJyg6F5D2pwdA3MiL4SU=;
        b=YAdEmi+5kk/cgx1xctWG+qmxX36D1PvrhrrbDX/PK/LF9hFo5ONINPCYv5v9XPgn30
         YzRs3lROa44aY3/3TmYxAJoc1N8Irl5484PizJ54uLQ5a3mgIDqQmSpdyDqIWN90Icoh
         7pu6JlhbtgxB/f3auysNbhR3cepIPuUGq7NTU9df+TMfkBWM0yugz50wV/qhxTWM5Qm1
         AK+ntg014r08knSk/3bXbFrdRBrW+C8/u1bZLE2SXuwgRL6NkHdewLS5DZOM3njQiC+H
         S3zdr7NEQMIs2ppp0nyGf10AagKDVPdEA2sVjePUlI5eGik23rNgdn+RJg0gGB72MtRH
         NDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :cc:from:to;
        bh=zug94Vzv51FeDoXqv/Owc4YFJyg6F5D2pwdA3MiL4SU=;
        b=bziuoZzNNQ9Y1lcJtL45SMyOegx9qNt4N9LLuRgkoXqfz7fg3xi+Hqe9bLoMCfCqVY
         tiIpDCst2WCnX3H5+MJ6lUwM1rdATICdYU3SBkOTrYYbGbFpTwudq3rZcM7TquyfiSkj
         euKUO5FUx2RtlqaPy3OEeWNJIcq7XKeaRd4zFEQ8C9E3NdWNNIBV6Cgr+nrh4DyK40Os
         I3WDykUa0iZsNtEvZtwoMeVQaibye+viTx9oTfl/BP4wbN51LVCPlBuA5Z2jAPisHJ+E
         GVh83i9XcrOPaUQSi2YaAxQ4V8Hb/ksDb/+t5EZSaB++YpmGrVfY4jpI+ZY2hZua86xp
         eHVQ==
X-Gm-Message-State: AGRZ1gLqDytwoPOu4112gaJXil8U6qb189KTeaNOnWuKO3Lz9MrPNl/L
        f6rTeoyLoFRUaiJ+Mkz3Quqy1w==
X-Google-Smtp-Source: AJdET5ck296g0AwMBEnRSJkYocK/d4MMQtsfrbskiCGncSc1RNOgf6o5kh4lgLi3cJYsOOORJPy9xQ==
X-Received: by 2002:a62:f24f:: with SMTP id y15-v6mr3213994pfl.25.1542074620349;
        Mon, 12 Nov 2018 18:03:40 -0800 (PST)
Received: from localhost ([216.9.110.1])
        by smtp.gmail.com with ESMTPSA id l63-v6sm15869850pfb.75.2018.11.12.18.03.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 18:03:39 -0800 (PST)
Subject: [PATCH 2/7] doc: Indicate that s390 supports KASAN
Date:   Mon, 12 Nov 2018 18:01:08 -0800
Message-Id: <20181113020113.29640-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
References: <20181113020113.29640-1-palmer@sifive.com>
Cc:     corbet@lwn.net, Palmer Dabbelt <palmer@sifive.com>,
        aou@eecs.berkeley.edu, ren_guo@c-sky.com,
        andrea.parri@amarulasolutions.com, Arnd Bergmann <arnd@arndb.de>,
        jhogan@kernel.org, dhowells@redhat.com, jcmvbkbc@gmail.com,
        keescook@chromium.org, yamada.masahiro@socionext.com,
        mathieu.desnoyers@efficios.com, mingo@kernel.org,
        rmk+kernel@armlinux.org.uk, Will Deacon <will.deacon@arm.com>,
        jglisse@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        david.abdurachmanov@gmail.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     linux-kernel@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This was suggested by features-refresh.sh

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/features/debug/KASAN/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/debug/KASAN/arch-support.txt b/Documentation/features/debug/KASAN/arch-support.txt
index 304dcd461795..c68adfc1db0e 100644
--- a/Documentation/features/debug/KASAN/arch-support.txt
+++ b/Documentation/features/debug/KASAN/arch-support.txt
@@ -24,7 +24,7 @@
     |      parisc: | TODO |
     |     powerpc: | TODO |
     |       riscv: | TODO |
-    |        s390: | TODO |
+    |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
     |          um: | TODO |
-- 
2.18.1

