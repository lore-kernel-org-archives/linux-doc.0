Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A9AC04FE0
	for <linux-doc@archiver.kernel.org>; Tue,  1 Aug 2023 00:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjHAAVj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 20:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbjHAAVh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 20:21:37 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B834019A3
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 17:21:35 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c8f360a07a2so3911683276.2
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 17:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690849295; x=1691454095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=X6gKOGhlGB8pLW0DYtQuv9ffBJaXjDy6pmjMuBOFYgg=;
        b=kQoqrjZUSpYSVWxRkD8CyHapEmqNssIKnU0p8DbOeOtORHqvQa2sRcXhVsWCzU4YXH
         zZKas3OblcCNpHead2nGTkpMYThMQMfZeHh41WgRE1hPLNiwbHntVRxHiv/NqnNsu6We
         KNZIuYEWFnyjDmvXcOy5RwHVYQaGudAGf1nLCyRoZSHMxNSpdZrY7aU4AzRIfp1+8ha8
         gqHlW5ZZCXCmF7ZW8oxl02SvyyCRoY3Egwy9Mv5L85kKyaSF/yQkV7Trl0FnFZ+9EL1R
         mMTvAT/jSm6uCb3HkZgyPqa4An9p+T65XcE0u04cE0v+XXg1hINDwPuIhtIjwA+Za4dr
         /fEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690849295; x=1691454095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6gKOGhlGB8pLW0DYtQuv9ffBJaXjDy6pmjMuBOFYgg=;
        b=DTeJi/j242DIEeyQkfKoS46H1I3mwc9gw4p6VhmEyc/Ly0J96+OfXVBCLAodGvM/qu
         oO/kjptAGo2jDBj+50Zqxw6jqpF3SiNVJe/49CMC3q4RYXU2EyoTCX5wE7plaOVNQq9O
         nncj4Jz8Zn1+KmxdvRzR0MnOcOx4EKLtTM5+aEJBRiz7cx0hNZ5zsbNjjN2YUP0Byupu
         MlAcoBgwdojngYrXx2NUF8H6Qc/xAgfgcuW8Ue6+kvtyOHGObEnk+C0UM/7S6vdDBnfb
         ZAKQ+I5FDrzi47T/z7cXGFKkmQ0sSd3Ja6E+cYSEYtAp2xlfrE/yb2uxnYfhPH4amZTi
         VYnQ==
X-Gm-Message-State: ABy/qLYbS+/KdDnKtinZvTze93J6dykj3VCEPD+SG03j5javvUcBpZLd
        y6thjsq3nvLv+ypl8WB3acyJNFjO0LAS
X-Google-Smtp-Source: APBJJlGQXpt19T8IbJ/4u2FYTII6o/ixlgwOW+5f/+XsCEFskp5UWl0qK1dtlRzD0c0+xHtP+LDk5mW3oGkO
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a05:6902:11ca:b0:d09:b19:fe2c with SMTP id
 n10-20020a05690211ca00b00d090b19fe2cmr70907ybu.12.1690849294946; Mon, 31 Jul
 2023 17:21:34 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Tue,  1 Aug 2023 00:21:23 +0000
In-Reply-To: <20230801002127.534020-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230801002127.534020-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230801002127.534020-4-mizhang@google.com>
Subject: [PATCH v3 3/6] KVM: Documentation: Add the missing description for
 ptep in kvm_mmu_page
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mingwei Zhang <mizhang@google.com>,
        Kai Huang <kai.huang@intel.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>, Xu Yilun <yilun.xu@intel.com>,
        Zhi Wang <zhi.wang.linux@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the missing description for ptep in kvm_mmu_page description. ptep is
used when TDP MMU is enabled and it shares the storage with parent_ptes.
Update the doc to help readers to get up-to-date info.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 35e642303962..17d90974204e 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -239,6 +239,9 @@ Shadow pages contain the following information:
     parent_ptes points at this single spte, otherwise, there exists multiple
     sptes pointing at this page and (parent_ptes & ~0x1) points at a data
     structure with a list of parent sptes.
+  ptep:
+    The kernel virtual address of the SPTE that points at this shadow page.
+    Used exclusively by the TDP MMU, this field is a union with parent_ptes.
   unsync:
     If true, then the translations in this page may not match the guest's
     translation.  This is equivalent to the state of the tlb when a pte is
-- 
2.41.0.585.gd2178a4bd4-goog

