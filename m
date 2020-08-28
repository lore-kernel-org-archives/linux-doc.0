Return-Path: <SRS0=skC6=CG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97409C433E6
	for <linux-doc@archiver.kernel.org>; Fri, 28 Aug 2020 13:47:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69EA720714
	for <linux-doc@archiver.kernel.org>; Fri, 28 Aug 2020 13:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klaFOwH0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgH1NrL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Aug 2020 09:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgH1Nqm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Aug 2020 09:46:42 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3237AC061232
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2020 06:40:22 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id c142so610921pfb.7
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2020 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FG3XCoXB/aty+ooJaX6AfmzW3u7+uhF6LOoAHszXFMo=;
        b=klaFOwH0ElHAR7McpnZD67Y7Y2E4ysRVd65Eh0X8Xr9Z5ZyWbIBjWtyCrwOB4Od/DA
         XRJMjfQSPlBZrjbgkR+aWt+dMTPdm3RfYYKFYmMffLNpvXiND2Idjh7oautoaA2MYL+q
         /aMHMhbMTXmSQQM3HOmFP7V4IB7vdF95uncZUymzdTq0dWQt129AmStxuUL6cEE+bT4X
         ToHwNGA6N4Gj9pNw6HzkGUknEsJK+o2/5MFoKW275e2o2HRQHyMHs2gDiU2W4mbgmwCP
         XasIdGHL8WGH0oaEbsJ7Xh/05/Dwf1tS5KwbhE/Qhy1BOMowRz0YOo1D2uxsKLKSaOvR
         A8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FG3XCoXB/aty+ooJaX6AfmzW3u7+uhF6LOoAHszXFMo=;
        b=Zu9IWKnaCd8FWg/cs3MCTGVQs7BIalzF213JcJk0UYBuVSZHgnfXqH0N2aobY23hsd
         csVMWMiYbVqEUieF8HaDa3D82cUUneY5oEcdl7SoHDhuJNXTVG2q7+iOvZmLXPIecJWE
         O4F39bBgBVzebzsa0pkUg4YD3YA4cbGr3Kew2hU2iv5u4bNSGIVUAxNLgg/GtU9k6WzI
         JuutnHRlJg5+gMKTNRrzKTlhmkLxMSr1NV1IikSIMb9kA1nKrkhhNTvDM5aJAjLxdMSy
         kVV16lDqQHrASY1F8glUk3Zw9wCEMPwCXUhWhKpD7Sk/cPDNzoPLzAYE7h3LKsLnnh1U
         cHJg==
X-Gm-Message-State: AOAM530pISadTUuzwJH3hfIjkLd91spqcsVUsefO7L596RXbVLGQB7Ai
        Oc19k7cubTTrjLgZQfxM+Q==
X-Google-Smtp-Source: ABdhPJwM7vdnpfEicNNMs9GsRsbhv34l6T2Wg0n67dn0Hmq86jCu4vPZ+wdNmQARVjSSpiwV50Risw==
X-Received: by 2002:a63:b10a:: with SMTP id r10mr1314017pgf.431.1598622021821;
        Fri, 28 Aug 2020 06:40:21 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id k1sm1806559pfp.86.2020.08.28.06.40.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Aug 2020 06:40:21 -0700 (PDT)
From:   Pingfan Liu <kernelfans@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Pingfan Liu <kernelfans@gmail.com>,
        James Morse <james.morse@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Geoff Levand <geoff@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-doc@vger.kernel.org, kvmarm@lists.cs.columbia.edu
Subject: [PATCHv2 2/2] Documentation/kvm/arm: improve description of HVC_SOFT_RESTART
Date:   Fri, 28 Aug 2020 21:39:58 +0800
Message-Id: <1598621998-20563-2-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1598621998-20563-1-git-send-email-kernelfans@gmail.com>
References: <1598621998-20563-1-git-send-email-kernelfans@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Besides disabling MMU, HVC_SOFT_RESTART also clears I+D bits. These behaviors
are what kexec-reboot expects, so describe it more precisely.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Geoff Levand <geoff@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Julien Thierry <julien.thierry.kdev@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-doc@vger.kernel.org
Cc: kvmarm@lists.cs.columbia.edu
To: linux-arm-kernel@lists.infradead.org
---
 Documentation/virt/kvm/arm/hyp-abi.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/arm/hyp-abi.rst b/Documentation/virt/kvm/arm/hyp-abi.rst
index d9eba93..83cadd8 100644
--- a/Documentation/virt/kvm/arm/hyp-abi.rst
+++ b/Documentation/virt/kvm/arm/hyp-abi.rst
@@ -54,9 +54,9 @@ these functions (see arch/arm{,64}/include/asm/virt.h):
     x3 = x1's value when entering the next payload (arm64)
     x4 = x2's value when entering the next payload (arm64)
 
-  Mask all exceptions, disable the MMU, move the arguments into place
-  (arm64 only), and jump to the restart address while at HYP/EL2. This
-  hypercall is not expected to return to its caller.
+  Mask all exceptions, disable the MMU, clear I+D bits, move the arguments
+  into place (arm64 only), and jump to the restart address while at HYP/EL2.
+  This hypercall is not expected to return to its caller.
 
 Any other value of r0/x0 triggers a hypervisor-specific handling,
 which is not documented here.
-- 
2.7.5

