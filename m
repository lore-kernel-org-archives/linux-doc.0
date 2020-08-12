Return-Path: <SRS0=r/NW=BW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B29C433DF
	for <linux-doc@archiver.kernel.org>; Wed, 12 Aug 2020 14:05:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E8F220838
	for <linux-doc@archiver.kernel.org>; Wed, 12 Aug 2020 14:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9c86y9V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgHLOFy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Aug 2020 10:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgHLOFx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Aug 2020 10:05:53 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F6EC061383
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2020 07:05:53 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o13so1116629pgf.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2020 07:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Xd1JlhTQ+LLGkrxsiKUO3U1+DIxkbudA+7Iwr86BTU8=;
        b=F9c86y9VswsM0NUf74FtnnPIbwPvAQ9av1nET9wLixxZPMGcbjwrXQwXFtMX/zXngK
         SmteOy/Xapx4/roJdflzP4wkNi00uU+YCs5Fs17iom5qqsxoXJ3xszwJWsw4WZ5BTOtV
         vy3ecI9Xaep4Lctmf9PAETCTd5OGNtr2uXBjLD3m1Qf8dl4CO6h8ZaH30apV0dAYDE3G
         yj2BopxwB8J2ijJ5U1Iloe4L0UBBeadKBVq4avns03hDMvpeRdM0+jVZVFrhKhTkCnrZ
         v6OykPd4DwMDrN9nASoykO+ynV4Tyh87qnchtdZxqSmHOpMRFVvSXNyCZpbraJAzoi4H
         OnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Xd1JlhTQ+LLGkrxsiKUO3U1+DIxkbudA+7Iwr86BTU8=;
        b=GXf1APQN6pFWS8w8GMXLCqte10YV/D/cYzB6ddfVpxNwV2bV39NB+VdbaqTwL+k1mI
         DZjhgsnccuBYrDt1404brKzeLcs/s3E7eRTPCxivHhP/44FuFbC4hnCBet4x3ZBUbotT
         /Fawd7i7Youc0Zv9YoAG03+YOszQuOoU9s1b9hhoHxOR7PzMxXcFkw9GCKuhSupLjqTA
         0wv+qvdT9s24HasFy+k7FBNnA73rTPRJViySncGH7/qkuFWVlSvPmO4z0MfjfNdiYMnn
         lovLc6QUZw+vOhEF73vuA/qu1R81rBILBlTTzxPdo5gE8uFRpIeVLLO1CDiBP+7LzMml
         8/CA==
X-Gm-Message-State: AOAM530F5O1v/P57nddZbWess+qKPWHP5mTP3THLiSuFMNPtXii9T5Y9
        XkyRpwmSRO5XHJU06/4KSQ==
X-Google-Smtp-Source: ABdhPJxqZMYDPp3Rjza7Lj0jActSfJ6DzFH8hI5Qkgg6uv/KnZxmirsVuHYk65hKLNQ8yYsyIzjrTA==
X-Received: by 2002:a62:8081:: with SMTP id j123mr11569824pfd.80.1597241152533;
        Wed, 12 Aug 2020 07:05:52 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id s22sm2711033pfh.16.2020.08.12.07.05.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 07:05:51 -0700 (PDT)
From:   Pingfan Liu <kernelfans@gmail.com>
To:     kvmarm@lists.cs.columbia.edu
Cc:     Pingfan Liu <kernelfans@gmail.com>,
        James Morse <james.morse@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Marc Zyngier <maz@kernel.org>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm(64)/kvm: improve the documentation about HVC calls
Date:   Wed, 12 Aug 2020 22:05:33 +0800
Message-Id: <1597241133-3630-1-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Both arm and arm64 kernel entry point have the following prerequisite:
  MMU = off, D-cache = off, I-cache = dont care.

HVC_SOFT_RESTART call should meet this prerequisite before jumping to the
new kernel.

Furthermore, on arm64, el2_setup doesn't set I+C bits and keeps EL2 MMU
off, and KVM resets them when its unload. These are achieved by
HVC_RESET_VECTORS call.

Improve the document.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: James Morse <james.morse@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Julien Thierry <julien.thierry.kdev@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
To: kvmarm@lists.cs.columbia.edu
---
 Documentation/virt/kvm/arm/hyp-abi.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/arm/hyp-abi.rst b/Documentation/virt/kvm/arm/hyp-abi.rst
index d9eba93..a95bc30 100644
--- a/Documentation/virt/kvm/arm/hyp-abi.rst
+++ b/Documentation/virt/kvm/arm/hyp-abi.rst
@@ -40,9 +40,9 @@ these functions (see arch/arm{,64}/include/asm/virt.h):
 
 * ::
 
-    r0/x0 = HVC_RESET_VECTORS
+    x0 = HVC_RESET_VECTORS (arm64 only)
 
-  Turn HYP/EL2 MMU off, and reset HVBAR/VBAR_EL2 to the initials
+  Disable HYP/EL2 MMU and D-cache, and reset HVBAR/VBAR_EL2 to the initials
   stubs' exception vector value. This effectively disables an existing
   hypervisor.
 
@@ -54,7 +54,7 @@ these functions (see arch/arm{,64}/include/asm/virt.h):
     x3 = x1's value when entering the next payload (arm64)
     x4 = x2's value when entering the next payload (arm64)
 
-  Mask all exceptions, disable the MMU, move the arguments into place
+  Mask all exceptions, disable the MMU and D-cache, move the arguments into place
   (arm64 only), and jump to the restart address while at HYP/EL2. This
   hypercall is not expected to return to its caller.
 
-- 
2.7.5

