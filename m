Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CF6C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiJME40 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Oct 2022 00:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiJME4Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 00:56:25 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894C310D68C
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 21:56:24 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id g8-20020a17090a128800b0020c79f987ceso3891506pja.5
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 21:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28zn6cgsHU6YtpOZu1YU2asuZjVGXsycTYTjxJ6pRUA=;
        b=O9XnoY1yPcJ8rbfuH000Q/NubRyjXPpGjHuUIzAcrc8zp4D2KRmC3Nu1hzSAtq3CeI
         ZyJ4LGZfAAVpvplG9HJ1twTStgWTomI7FGgrCkrPhjmcebLJST1t2hlaiHc/GWiEUkAw
         Ai+m5mIl0mWJ2EtkP3PRaUICKIAxUcpzfH6LGT+X0VIUocgbxq68qp3ykYt9NsnLB9x0
         56zVgFqh5p1hKK6CIaJJaatil2A3o2l6RIDcHrn2FQ+tk7LhUn4LRkwUqAN5dm39F4Wg
         F5Xi4+lVzqePnpDkvCuDTR8xNwymr93dXZtOfW4Q/YLKphDHtJSeDdWnecG6kqzXgdtY
         62ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28zn6cgsHU6YtpOZu1YU2asuZjVGXsycTYTjxJ6pRUA=;
        b=eLsZIDhsIt9xd5UkwrtZu32F401MSHJJPzjHn+h/zgaJFcFl0t5AHKhqEukKBUQInN
         Q4mUGcUdZV2UNaIj6j2N/BxqSceahAy5cCIcmhrJH89Dnui6uYpLWEElCqGpRj+rwhxR
         m488DRlVGVQuRzUB/QFTsa/GdlnKAMrtU/QcQk9n0kChrWID3Ia2B3Sb3w9liSOD4zXo
         1r0BYsPpmOFQdrwkP+/aCpOVcdMNgZJb1d/RwcxNktLt5W4JFv4IAZAWasd836CdD/06
         SiIt5GRCQ9tXTmY23DoLCSr5elNNJ7++cgwsbatpni9nsif9A/YMYxV1e7a718CBabsq
         P9Hw==
X-Gm-Message-State: ACrzQf3Uzh5rCU7R9ViVYVcPyth+eSPzdLJY1pr9F0vgzIeNL68JD+tP
        UXriU1rh3a5dwbeBfR105IaJDg==
X-Google-Smtp-Source: AMsMyM4ugjiBwSXQxda1eNvwHmBz2fBmeCwoTH5OfbxNJoRGhqGRqBSY9uGTlgP9MR/U/J7DH821hA==
X-Received: by 2002:a17:90a:5ac2:b0:205:de77:72be with SMTP id n60-20020a17090a5ac200b00205de7772bemr9337413pji.24.1665636983966;
        Wed, 12 Oct 2022 21:56:23 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902d41100b0017bb38e4591sm11385104ple.41.2022.10.12.21.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:23 -0700 (PDT)
Subject: [PATCH 3/4] Documentation: RISC-V: Mention the UEFI Standards
Date:   Wed, 12 Oct 2022 21:56:18 -0700
Message-Id: <20221013045619.18906-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013045619.18906-1-palmer@rivosinc.com>
References: <20221013045619.18906-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        conor.dooley@microchip.com, Atish Patra <atishp@rivosinc.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux@rivosinc.com,
        Palmer Dabbelt <palmer@rivosinc.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

The current patch acceptance policy requires that specifications are
approved by the RISC-V foundation, but we rely on external
specifications as well.  This explicitly calls out the UEFI
specifications that we're starting to depend on.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/patch-acceptance.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index 0a6199233ede..9fed6b318b49 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -20,9 +20,11 @@ Submit Checklist Addendum
 -------------------------
 We'll only accept patches for new modules or extensions if the
 specifications for those modules or extensions are listed as being
-"Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
-course, maintain their own Linux kernel trees that contain code for
-any draft extensions that they wish.)
+unlikely to be incompatibly changed in the future.  For
+specifications from the RISC-V foundation this means "Frozen" or
+"Ratified", for the UEFI forum specifications this means a published
+ECR.  (Developers may, of course, maintain their own Linux kernel trees
+that contain code for any draft extensions that they wish.)
 
 Additionally, the RISC-V specification allows implementors to create
 their own custom extensions.  These custom extensions aren't required
-- 
2.38.0

