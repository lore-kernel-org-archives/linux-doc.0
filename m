Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12677EB64DB
	for <linux-doc@archiver.kernel.org>; Sun, 18 Jun 2023 00:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbjFRAJa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Jun 2023 20:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233746AbjFRAJZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Jun 2023 20:09:25 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327861723
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 17:09:23 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b04dbcf0dbso19084765ad.1
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 17:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687046962; x=1689638962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1VCe6Te4dbtLGKgb4rOHMky/xQ+L+u4Ve7fRkEOuWfM=;
        b=eM6eEMdeAdA3q12h/4zPiNDSyzDv6iURF6JeeAlS92vFN138+Ea57eUPBYKXB/1hSK
         LO+sRsz7LswUmxtY2fR1MXtZ5ODEii85FISwNsl00srPgkpT+xOgRzsXGZenLTovEC4K
         5bCdZnpVEh3xw/+QxJve/qwSzVD1fa3TqfhTUHfYi7y0bg4vv9JGAYAycx//ck2bTtEa
         x0mjE8f8m8SfrfLilZa2KalRke5BniQVDR2ujyq/cZrSDYm/79+HVziX7w7RrRTnHlXw
         fYE6FC2kIKP7Hw3VUVpp7d1JE/EkJAqrZYwsEiLJj6sx6zDZWhNU/Od3Bkmt9PNwwxke
         +F7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687046962; x=1689638962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VCe6Te4dbtLGKgb4rOHMky/xQ+L+u4Ve7fRkEOuWfM=;
        b=HkQ6BfA4SKiyLWbp2HgMuHBZP6Fp/+jqI7vkZ84zbvKJiOPv9EeZ2U5HjQmH3Q8CEj
         MjkAsPM/MxWoYD+5IFOA+erFItBT7ZsRi2encak9bwQuAtz2PowGKGb5fVnLUSQCrvn7
         R3/69ZgNP4o/1qsfvRU5N4BHAnm1vihhO2o2DS6wjCYcdZmPFrpZYMMhvVuZCKwsb7yF
         Z2An9QRNaFuFRl6rUNWMuZZQU4/1rMgxI7V2tWvlWam+wdhkr9W5uy2aymHohkyDGoNW
         6NX7hXRZnkbnM7zF9rDaS4X/a3hq9IsEfqhTQgAkBH0SUL37nNfaxL/Jq5uy/29Gga1N
         wJYw==
X-Gm-Message-State: AC+VfDzYnLnDQ9RAdsJm/0zlayUDcEjC/DZY3Vc2y3x7DKfOzSczgKnE
        JalK16Yl19L6BqpSinHOhhDkTO8Ko9LS
X-Google-Smtp-Source: ACHHUZ587n83fnu4WPNdcoRuCpjN8gdiXgApo0KsiKTF4x3Syc0S5oMmIS04y4PImd7mWuJ5Od9KbFTaOwBX
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a17:902:e88b:b0:1a8:1f4:2d50 with SMTP id
 w11-20020a170902e88b00b001a801f42d50mr1222628plg.4.1687046962586; Sat, 17 Jun
 2023 17:09:22 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Sun, 18 Jun 2023 00:08:56 +0000
In-Reply-To: <20230618000856.1714902-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230618000856.1714902-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230618000856.1714902-7-mizhang@google.com>
Subject: [PATCH 6/6] KVM: Documentation: Add the missing tdp_mmu_page into kvm_mmu_page
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mingwei Zhang <mizhang@google.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add tdp_mmu_page into kvm_mmu_page description. tdp_mmu_page is a field to
differentiate shadow pages from TDP MMU and non-TDP MMU. When TDP MMU is
enabled, sp->tdp_mmu_page=1 indicates a shadow page for L1, while
sp->tdp_mmu_page=0 indicates a shadow page for an L2. When TDP MMU is
disabled, sp->tdp_mmu_page is always 0. So update the doc to reflect the
information.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 0dbdb7fb8cc6..cbad49c37629 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -277,6 +277,10 @@ Shadow pages contain the following information:
     since the last time the page table was actually used; if emulation
     is triggered too frequently on this page, KVM will unmap the page
     to avoid emulation in the future.
+  tdp_mmu_page:
+    Is 1 if the shadow page is a TDP MMU page. When TDP MMU is disabled,
+    this field is always 0.
+
 
 Reverse map
 ===========
-- 
2.41.0.162.gfafddb0af9-goog

