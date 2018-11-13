Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 370417D8BB
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 02:04:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730884AbeKML7m (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 06:59:42 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40942 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730805AbeKML7l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 06:59:41 -0500
Received: by mail-pg1-f194.google.com with SMTP id z10so4911887pgp.7
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 18:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=subject:date:message-id:in-reply-to:references:cc:from:to;
        bh=z1/UIs3s95nj4fpqBhO0b+gijTrwfsBw2mC/yrzV+uw=;
        b=PJcGYpjuiJEgki1sUH6Ps/OxW+uKZsZpdT8/5VFUfLtccEhdI4hEe7LQ4gJ/344Sje
         velnDB2Ci9clB3U8RmC6LUpwODoM9pOCDZuMGCQx2VSuoAwKNu3kCdG4cbG7HtQ2ybid
         vBfpuBSVXWNOMFOyhYdSCoaLmlQsBHLXU/acI20NUSC3IDI0e2lFUr0zksycuTao/O2I
         U0Z5TlMeSGKZS6RYv49+zvJGhFTH7V44wph+Pa4LM6I+ANjViJLl38AkocErnYfTKqyI
         fifq0V+oFxf1bQL6mNp+LG53CAJ6j1Vnd4w5qAQVnJYCzX1Qc1VvxxJOsrqZE0/p8GOM
         yhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :cc:from:to;
        bh=z1/UIs3s95nj4fpqBhO0b+gijTrwfsBw2mC/yrzV+uw=;
        b=k2aBHaUwNQecqLulrjm2s1LKB4RdIV6Cuxcd9mRRqXYRxtYMCRHGTun2cs9NlkgR7l
         5jfETQYddn9ms6KgPvCxVuqVWCuT4/Q2WNCO+ZubyZ6iPxxikxKGP58xoH0MXJgjxUZM
         1ydJhghvNCrgyuLvLyukF4qUJi5EnW5oRA9wsz2LjOj+crgvQFHi6p4H5D2L077YFMU/
         1tSRjZkNMWw8RSNvMFwmGjEmOtq23DvWuuRd1UEbFwOK23tUzv+VBKu4FY8zk8zFdrnp
         CnnG016D4/sl63GgmLGUJwtj7HL2+S6iJGL3G3dNDn/43aj0REyUDU1fBoDw+xNR7sPj
         Iwbg==
X-Gm-Message-State: AGRZ1gKLPAY3CQICQHX3apiSnDwNNalR/G8ySMIGWf9zV3OHoSLsHodh
        LCfVPPO2KnJraRg08R3eNlenHg==
X-Google-Smtp-Source: AJdET5ct8ctnBfDREcAnPKrFHawmpructpZQJT2RsxPhQnRrzxVtPOBTDDjCdJ6kSMH5pN66S4Z/hw==
X-Received: by 2002:a65:560e:: with SMTP id l14mr3024951pgs.168.1542074629519;
        Mon, 12 Nov 2018 18:03:49 -0800 (PST)
Received: from localhost ([216.9.110.13])
        by smtp.gmail.com with ESMTPSA id d3sm16479347pgl.64.2018.11.12.18.03.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 18:03:48 -0800 (PST)
Subject: [PATCH 7/7] doc: Indicate that RISC-V support pte_special
Date:   Mon, 12 Nov 2018 18:01:13 -0800
Message-Id: <20181113020113.29640-8-palmer@sifive.com>
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
 Documentation/features/vm/pte_special/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/vm/pte_special/arch-support.txt b/Documentation/features/vm/pte_special/arch-support.txt
index 2dc5df6a1cf5..3d492a34c8ee 100644
--- a/Documentation/features/vm/pte_special/arch-support.txt
+++ b/Documentation/features/vm/pte_special/arch-support.txt
@@ -23,7 +23,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |
-- 
2.18.1

