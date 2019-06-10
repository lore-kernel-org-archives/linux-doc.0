Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0436E7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Jun 2019 10:04:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389157AbfFJKES (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Jun 2019 06:04:18 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34199 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389102AbfFJKES (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jun 2019 06:04:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id i2so3461081plt.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2019 03:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VL7W9fZL6/Afil2J/mxLoXGQm5gFl+AhFAq1/FWfRX0=;
        b=nvT1RwmQQ/JBz4RKD2P0rVy+N89TLx5YMde9RD10LFsH0HAcpr+nANhDP2FgyeXHd0
         Y9v3xUR9RaWVlWdqqxDIOJ9oITvDXXhuiOx16OMH3MIDaNNwpkuGCBFwcHNLof5ff1tK
         860ooraKaA1ihqw/0z2CfsmQz0RKdsZM7Mx4fIgx0QHGM6xI6BfnGwAANxE2+qduPwmI
         /fVFP2vWNeLqmnY63dOWisTn7PYv/j+h9WKo9H5hyEOOkjUUOGuaaB/UIzcrJ4uG4JcK
         f71+4P1a0641JjeX+8aK23Fhp5DmQnGjrcvrtgQ9J3cktgYrvEnbtf6r6sE2aLCDmCHW
         n50Q==
X-Gm-Message-State: APjAAAWZPNnlezIy7OcxlWzI2atAwAQXffB2cAoSu0NciRWqUmsucOq5
        oz96X+vjGiperaTRGRniPs7iAA==
X-Google-Smtp-Source: APXvYqzDr0J6ZRVKUD/yAIczeaILFdnQzJjOKMYBERKQCtn7Uet/99gmQt1F+I8Z8yK6peHQ1a6GTg==
X-Received: by 2002:a17:902:2926:: with SMTP id g35mr24078094plb.269.1560161057781;
        Mon, 10 Jun 2019 03:04:17 -0700 (PDT)
Received: from localhost ([122.177.221.32])
        by smtp.gmail.com with ESMTPSA id p2sm5604993pfb.118.2019.06.10.03.04.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 03:04:16 -0700 (PDT)
From:   Bhupesh Sharma <bhsharma@redhat.com>
To:     linuxppc-dev@lists.ozlabs.org
Cc:     arnd@arndb.de, bhsharma@redhat.com, bhupesh.linux@gmail.com,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [RESEND PATCH] Documentation/stackprotector: powerpc supports stack protector
Date:   Mon, 10 Jun 2019 15:33:39 +0530
Message-Id: <1560161019-3895-1-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

powerpc architecture (both 64-bit and 32-bit) supports stack protector
mechanism since some time now [see commit 06ec27aea9fc ("powerpc/64:
add stack protector support")].

Update stackprotector arch support documentation to reflect the same.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
---
Resend, this time Cc'ing Jonathan and doc-list.

 Documentation/features/debug/stackprotector/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/debug/stackprotector/arch-support.txt b/Documentation/features/debug/stackprotector/arch-support.txt
index 9999ea521f3e..32bbdfc64c32 100644
--- a/Documentation/features/debug/stackprotector/arch-support.txt
+++ b/Documentation/features/debug/stackprotector/arch-support.txt
@@ -22,7 +22,7 @@
     |       nios2: | TODO |
     |    openrisc: | TODO |
     |      parisc: | TODO |
-    |     powerpc: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
     |          sh: |  ok  |
-- 
2.7.4

