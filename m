Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F28067D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 02:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730828AbeKML7i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 06:59:38 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41394 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730827AbeKML7i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 06:59:38 -0500
Received: by mail-pg1-f196.google.com with SMTP id 70so4905324pgh.8
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 18:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=subject:date:message-id:in-reply-to:references:cc:from:to;
        bh=KwRK/8QusrPt9E60VsZ+F/UZc9LhXH3dVrppBh4GkT0=;
        b=dHDtII3SPhynR8V8WQ6RhY4iIrwmmAHy+ZinjdkXtAm6sTkEaaNuEfub+dqf8SZI3B
         dTR9Mi7Ofc/EDidTtGRZGq2FOn2yrZ5AjhcKGCXlipf7oXVnGNVQ5D9IZlZ8qkS29ZDZ
         vLBb1DTN8fTFH2mUvlsCLTryVkC5RaACkNLhkGdoesX76++l56Rec0ivX5NQwfxlFEEF
         XFylgfi91mBrEPDtddjEdg9ZGYDi8/twxrOKKwpUlSs3OyQLPqnEL1kymjS/P5AK6LGK
         uSPu7xhD6XsiKqEDE2xJmtLfJsmnY0Eqvolu66Rsj3rVTchSqEFlVYLHuRSEju2ldVkY
         Idjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :cc:from:to;
        bh=KwRK/8QusrPt9E60VsZ+F/UZc9LhXH3dVrppBh4GkT0=;
        b=UcfJVtFbC5J7FtXy/3eIk04//aTzWxItOcIjZOd1pNrKruu29VZkqApbkv8IuMKR6D
         mSFpuWgYyeYZ7Xruv5Mx5/LtT8HkulSCZ+ughTB+PVca1thK2WlX1WybC9UpZFj+Bngh
         sPcFOIvhlOwpGaOsP2sL+vj1Dc7GV8Ru4PO8E91DbM54gAWtflUGXMneNwxhPNaOQNGT
         N5dOOCIle8KWbT28sZWSnz2UhXvrwedjRRg+MZZSP84Xcqx/B4ejBtPjTr2kKekLejFk
         Z77gIaRbNMfL+gqMDyaEpfTa0BqvDAzbrpDs+WsgGQbEA3e1S5hMy3KSFWJyRwLvFsml
         uMzw==
X-Gm-Message-State: AGRZ1gIV+Vtz/35vxHjLr6ALYiD1q6o99oaIi7t7m+qPsbZ+5rEtKPBe
        ven2OTY9iZzKE72lsic3zFbbiw==
X-Google-Smtp-Source: AJdET5eNU9kgcQE7rm+1rijBilcpE7dY75n5yG5XoGYN5pAdXkENPvN/pzgS0E8cPu4WG9WX/bx8Aw==
X-Received: by 2002:a63:8043:: with SMTP id j64mr3036868pgd.405.1542074626048;
        Mon, 12 Nov 2018 18:03:46 -0800 (PST)
Received: from localhost ([216.9.110.1])
        by smtp.gmail.com with ESMTPSA id f10-v6sm11693569pfa.188.2018.11.12.18.03.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 18:03:45 -0800 (PST)
Subject: [PATCH 5/7] doc: Indicate that arm64 support queued-spinlocks
Date:   Mon, 12 Nov 2018 18:01:11 -0800
Message-Id: <20181113020113.29640-6-palmer@sifive.com>
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
 .../features/locking/queued-spinlocks/arch-support.txt          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
index e3080b82aefd..743aa6691715 100644
--- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
@@ -9,7 +9,7 @@
     |       alpha: | TODO |
     |         arc: | TODO |
     |         arm: | TODO |
-    |       arm64: | TODO |
+    |       arm64: |  ok  |
     |         c6x: | TODO |
     |        csky: | TODO |
     |       h8300: | TODO |
-- 
2.18.1

