Return-Path: <SRS0=SGxC=AF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA1DC433DF
	for <linux-doc@archiver.kernel.org>; Wed, 24 Jun 2020 20:59:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EF9220B80
	for <linux-doc@archiver.kernel.org>; Wed, 24 Jun 2020 20:59:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ht//4dFC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389963AbgFXU7I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Jun 2020 16:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389708AbgFXU6S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Jun 2020 16:58:18 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE83FC061797
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 13:58:16 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id f130so3544863yba.9
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 13:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0vYZtvNiMw5LFIFKa+iHi1yqO9mFLTJ7LRF4fjft6YQ=;
        b=Ht//4dFCRi5Ycs+UMuxNJ7MV/84NLNKbMMrbLHuEjXQGLBEQPIpFzadQ2ao7vcuRer
         GOsbiPE75wfUufWuNvRORj1w7XTppFNHZFb/w9vysRIKLTiJA+xHpDaE+N3XmZZUH7MH
         7lhF9i0xb8VvBZ80IiWVYGeXmeCW1iu7iamWPbdRq557jmWCZkqp+qV8y6jB2OCJy6VA
         GRc001gVOpxxqc8MYG1JaA8vAVmiGkBrQE6r3W6gpRO7/UpoQZRQV1myeC7/+NUvoKC7
         jr4U5f2PnAS3X2qv6X8g99vU6G58oTPXti+dwKaI8fPvVdUIML6AitHtRQ3va9rivd/F
         VRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0vYZtvNiMw5LFIFKa+iHi1yqO9mFLTJ7LRF4fjft6YQ=;
        b=QLk9eKHRzsNLv1K2oAGOUjevrF6DT3sdb1Eyb7V2zrQJeDOVL7fwSDvzwulCiRC23j
         cnSXgkZ2DX4Pm5mg+0BESckcAwZC5+lxYL4dYmpNJhkvD2oL13oQlYltw9dc81LbqtYN
         Cy2M6g76FnEwN2eSldCdyVQNCA1k+ciZA34+E6Ap4RMzmCgzVFuGVbcJ/p/Ov+Lu0+RU
         aAM5P0MozXj+CO9tmt1993xX/6kko0yVpGfiwByUNDe3ZXn2P8jVlMicZaLX6Gbs8Y7/
         efQs7r5P/iYSbHMbjlxPOIXm1+L1GDuNWEnLVxgCVTkN/BUZQYqvG2Y06JlGwbdEfixs
         F2mg==
X-Gm-Message-State: AOAM532YvdYMWVth4VJoB3CFfSTqssI2Oua82SVydEfHSPdR0n/ZEBDz
        SKGa/wraeUYya+eaZnPxVaA3aSAQ4tD3ANvxZzC2fA==
X-Google-Smtp-Source: ABdhPJwOWDerhRlyEc+SD7GJHD/aFxbe2dcsXrDdYmbTX35zuFg+yS8T/ZZb/3aA+5pG2lFXNE77oD59Izt1xQSc+67yag==
X-Received: by 2002:a25:8403:: with SMTP id u3mr47227886ybk.276.1593032295892;
 Wed, 24 Jun 2020 13:58:15 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:55:43 -0700
In-Reply-To: <20200624205550.215599-1-brendanhiggins@google.com>
Message-Id: <20200624205550.215599-5-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200624205550.215599-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v4 04/11] arch: powerpc: add linker section for KUnit test suites
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        monstr@monstr.eu, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, chris@zankel.net, jcmvbkbc@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, linux-um@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a linker section to powerpc where KUnit can put references to its test
suites. This patch is an early step in transitioning to dispatching all
KUnit tests from a centralized executor rather than having each as its
own separate late_initcall.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 326e113d2e456..0cc97dbfde0ad 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -202,6 +202,10 @@ SECTIONS
 		CON_INITCALL
 	}
 
+	.kunit_test_suites : {
+		KUNIT_TEST_SUITES
+	}
+
 	. = ALIGN(8);
 	__ftr_fixup : AT(ADDR(__ftr_fixup) - LOAD_OFFSET) {
 		__start___ftr_fixup = .;
-- 
2.27.0.212.ge8ba1cc988-goog

