Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00221C001DF
	for <linux-doc@archiver.kernel.org>; Tue,  1 Aug 2023 00:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbjHAAVs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 20:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbjHAAVm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 20:21:42 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7617819A8
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 17:21:39 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c926075a50cso11466920276.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 17:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690849298; x=1691454098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lAQnhGDOkYRMbkZrdC3SL5zoWbQR4X7L8Yn3+Vr770Y=;
        b=mSlCLmLdSdPxkircK3iN8jwT5W5vP1eDs51MN2JElm1ENf0E0zV1+hxVIqVpBj8Lbq
         3YbA2/WyG5K4xCuq9Coj3iUMdMibr4FQcUpL6vKn/cEb0mcK+XtbQBYhpoD1utE9R/hw
         sNnyB6mq7sHFk+jZtZuvaN58hRjds+AE8Y+onHTyMUrpDQcsvWZDQTAAoX0qYG6i2kei
         BlqqustZeYnIPg8lYc6HCZmKcoW3EI/AsWv3P+mg4OOKdmJfb1bjcImHHRWilDTHx0WD
         OiGbBfE4+wE/VlffLCEkwsxzLb7nSfkAHH9Dkh8+py9OmsUsIBcfhvxGec3zqaWc+OQH
         1g3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690849298; x=1691454098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAQnhGDOkYRMbkZrdC3SL5zoWbQR4X7L8Yn3+Vr770Y=;
        b=KsQ/iaQNycMHkKpEoFrcKRe+Mt6cCnUhWMxjRHPO5JE7S7M0dNwD3sCwUxKeLD+LPp
         D88/MvxvUX1sLWbkhPqyTAQ6+xfG5qAUK3zKUUZ0OnaXPX2XDF/piE8B9DihG4Hq1yyu
         pIq5tayNRGe7E/kckKIoQVdVJJ+FA2KKb5esygg0VM0X2Fy5qewxbljaOV+MfTRgCbwU
         PukWiCVPDOShVCOWRzX6HZ33Oc+mfrK5j3WFYZyHU+wTXRY4eX+uDM9QO6Pj2nRi8PnN
         RAdG9U27+Vl8XBDo+rYLM1NnGZNiutH+bC/L3IjrfOaibEpRZn1GV555J9y+CKy+Kpg+
         Zlkw==
X-Gm-Message-State: ABy/qLZC+3nnS6z+4eNDnHCNEEXVMqphS8aV9Gr2eEpb5Q9mtFFcac+j
        GrBdIkvO31oXwwH5Qe/clFjMbgYEr0Cn
X-Google-Smtp-Source: APBJJlEbXDgaPfEPE0+Rh+gqu5EcA7wjOaPwSG51qBZAvMseTavHv77hIuRMa7UCmBrdjjzh7UNZF7RaBIf5
X-Received: from mizhang-super.c.googlers.com ([34.105.13.176]) (user=mizhang
 job=sendgmr) by 2002:a25:dfc3:0:b0:d15:53b5:509f with SMTP id
 w186-20020a25dfc3000000b00d1553b5509fmr119752ybg.2.1690849298640; Mon, 31 Jul
 2023 17:21:38 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Tue,  1 Aug 2023 00:21:25 +0000
In-Reply-To: <20230801002127.534020-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230801002127.534020-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230801002127.534020-6-mizhang@google.com>
Subject: [PATCH v3 5/6] KVM: Documentation: Add the missing description for
 mmu_valid_gen into kvm_mmu_page
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

Add the description for mmu_valid_gen into kvm_mmu_page description.
mmu_valid_gen is used in shadow MMU for fast zapping. Update the doc to
reflect that.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 40daf8beb9b1..581e53fa00a2 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -208,6 +208,16 @@ Shadow pages contain the following information:
     The page is not backed by a guest page table, but its first entry
     points to one.  This is set if NPT uses 5-level page tables (host
     CR4.LA57=1) and is shadowing L1's 4-level NPT (L1 CR4.LA57=1).
+  mmu_valid_gen:
+    The MMU generation of this page, used to fast zap of all MMU pages within a
+    VM without blocking vCPUs. Specifically, KVM updates the per-VM valid MMU
+    generation which causes the mismatch of mmu_valid_gen for each mmu page.
+    This makes all existing MMU pages obsolete. Obsolete pages can't be used.
+    Therefore, vCPUs must load a new, valid root before re-entering the guest.
+    The MMU generation is only ever '0' or '1'.  Note, the TDP MMU doesn't use
+    this field as non-root TDP MMU pages are reachable only from their owning
+    root.  Thus it suffices for TDP MMU to use role.invalid in root pages to
+    invalidate all MMU pages.
   gfn:
     Either the guest page table containing the translations shadowed by this
     page, or the base page frame for linear translations.  See role.direct.
-- 
2.41.0.585.gd2178a4bd4-goog

