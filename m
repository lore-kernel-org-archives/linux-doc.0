Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B4FEF7D919
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Jul 2019 16:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388258AbfGPQ46 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Jul 2019 12:56:58 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41293 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388196AbfGPQ4t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jul 2019 12:56:49 -0400
Received: by mail-qt1-f194.google.com with SMTP id d17so20255492qtj.8
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2019 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OHreDCpotkEUucxoE5EiEKrcc9yzecv+duVH9vOORKc=;
        b=GGIQw/kgAUl/eG3d2NKYO7rrigP3xCd6L3ITkDfbZyMEUnoEj0yVHLsV2LlbgRYbC+
         wxGDoUKvbsOD49xDxxVjVMA/cVW24Ta7j9hj3+wxoFsCV7bE/6zX1BcHliTfmRJa2HL6
         t1GMulrmuUdkYdtWJR3tWcDBbewttH11SYty1lYTYPi9/xqOKf63ADEYQ5vRWxW8OT6H
         VHjxbQVnM+5FFok1c8bap5vm+E40C8t2yYrwiy22m4L+k24TpV5SxJbfpoBHfRpCqzb2
         H6dm0a1hIjm8g/mZThetxdugoRf8Pcyv6ZduRuCZRIwQmu9srFbLpacSM3DPtY1OABO9
         4vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHreDCpotkEUucxoE5EiEKrcc9yzecv+duVH9vOORKc=;
        b=IHh4kjB3t9mnLDB8XbziqJQJ7rLiNYvv5AnRSOUcksIrPKupapeTULBMoRvDAYMheR
         CYMynUTgSoxgJN0UghYMUV4ZfREM+kdsxLFgHph2gkqm4sofei8QGErQVMv1ZYipvVSE
         8Xi2wfUmvA4RORiJfip9eOc/AlaunoT/uIZutsr2PvrkUeO9oDTVV0VaICg0dH1CVaY6
         YPBUpEor7hPexr9yVCP8tIavCvK2mo8shtFHBGPrR2FaQZaIDWio37brTOFrzZMQ/IR5
         Xdi91aPz9TKHrbm4LRW0rjjdsmtH25xvUiQMipEg4EkplKq1JTCuM/Vd6UrNagtt8Uc9
         a67Q==
X-Gm-Message-State: APjAAAWeLNmgNTnr1A33pr5SjcTATFvdk9euhgCumtkCh1yOcYnWo+VV
        mKlh8uFuqBbrgf2xp7XXK9M=
X-Google-Smtp-Source: APXvYqwxJ0A/FHhU5OVW66jrPFnnHKm79duNOHFiKTe25GUCXmo7/DTY10UCE+L1XIgV2bRdwMnQ6w==
X-Received: by 2002:ac8:41d1:: with SMTP id o17mr23857397qtm.17.1563296207876;
        Tue, 16 Jul 2019 09:56:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id f20sm8519538qkh.15.2019.07.16.09.56.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 09:56:47 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RFC v1 4/4] arm64: Keep MMU on while kernel is being relocated
Date:   Tue, 16 Jul 2019 12:56:41 -0400
Message-Id: <20190716165641.6990-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190716165641.6990-1-pasha.tatashin@soleen.com>
References: <20190716165641.6990-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It is inefficient to do kernel relocation with MMU disabled. This is
because if MMU is disabled,  dcache must also be disabled.

Now, that we have identity page table we can disable MMU after relocation
is completed.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 arch/arm64/kernel/cpu-reset.S       |  8 -------
 arch/arm64/kernel/relocate_kernel.S | 36 ++++++++++++++++++-----------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/kernel/cpu-reset.S b/arch/arm64/kernel/cpu-reset.S
index 6ea337d464c4..d5cfc17b8e1f 100644
--- a/arch/arm64/kernel/cpu-reset.S
+++ b/arch/arm64/kernel/cpu-reset.S
@@ -30,14 +30,6 @@
  * flat identity mapping.
  */
 ENTRY(__cpu_soft_restart)
-	/* Clear sctlr_el1 flags. */
-	mrs	x12, sctlr_el1
-	ldr	x13, =SCTLR_ELx_FLAGS
-	bic	x12, x12, x13
-	pre_disable_mmu_workaround
-	msr	sctlr_el1, x12
-	isb
-
 	cbz	x0, 1f				// el2_switch?
 	mov	x0, #HVC_SOFT_RESTART
 	hvc	#0				// no return
diff --git a/arch/arm64/kernel/relocate_kernel.S b/arch/arm64/kernel/relocate_kernel.S
index c1d7db71a726..e2724fedd082 100644
--- a/arch/arm64/kernel/relocate_kernel.S
+++ b/arch/arm64/kernel/relocate_kernel.S
@@ -36,18 +36,6 @@ ENTRY(arm64_relocate_new_kernel)
 	mov	x14, xzr			/* x14 = entry ptr */
 	mov	x13, xzr			/* x13 = copy dest */
 
-	/* Clear the sctlr_el2 flags. */
-	mrs	x0, CurrentEL
-	cmp	x0, #CurrentEL_EL2
-	b.ne	1f
-	mrs	x0, sctlr_el2
-	ldr	x1, =SCTLR_ELx_FLAGS
-	bic	x0, x0, x1
-	pre_disable_mmu_workaround
-	msr	sctlr_el2, x0
-	isb
-1:
-
 	/* Check if the new image needs relocation. */
 	tbnz	x16, IND_DONE_BIT, .Ldone
 
@@ -63,10 +51,10 @@ ENTRY(arm64_relocate_new_kernel)
 	add     x20, x0, #PAGE_SIZE
 	sub     x1, x15, #1
 	bic     x0, x0, x1
-2:	dc      ivac, x0
+1:	dc      ivac, x0
 	add     x0, x0, x15
 	cmp     x0, x20
-	b.lo    2b
+	b.lo    1b
 	dsb     sy
 
 	mov x20, x13
@@ -104,6 +92,26 @@ ENTRY(arm64_relocate_new_kernel)
 	dsb	nsh
 	isb
 
+	/* Clear sctlr_el1 flags. */
+	mrs	x12, sctlr_el1
+	ldr	x13, =SCTLR_ELx_FLAGS
+	bic	x12, x12, x13
+	pre_disable_mmu_workaround
+	msr	sctlr_el1, x12
+	isb
+
+	/* Clear the sctlr_el2 flags. */
+	mrs	x0, CurrentEL
+	cmp	x0, #CurrentEL_EL2
+	b.ne	2f
+	mrs	x0, sctlr_el2
+	ldr	x1, =SCTLR_ELx_FLAGS
+	bic	x0, x0, x1
+	pre_disable_mmu_workaround
+	msr	sctlr_el2, x0
+	isb
+2:
+
 	/* Start new image. */
 	mov	x0, x18
 	mov	x1, xzr
-- 
2.22.0

