Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334A3EB64D9
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 18:20:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbjFZSUs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 14:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbjFZSUe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 14:20:34 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89AE410D5
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:28 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c108dd0d9deso3679440276.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687803627; x=1690395627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DC1JUUoeIHOkdglYQmr1DfzfpGQE2uWlWtSL5MUhKa8=;
        b=xYtXcmWxk0P1fCDcWTRmRHQ213fqB4rQuiXjexvxKc69fWrbx+jG1hAwG0llCkpycZ
         vIxsx2SNm225hbYaBdJVqoTck9XSOJKHlXh8DXvyqKg1GDw5gd8l+hSpY9QBLAiV12RY
         rv75429GaSsLG1+mV89FXylyGQezn4c2bMvPj3UN87MBkxdRUBLLYdkdL6DAdn3RGg72
         VAUFRTosn8/60fdz9qwFv3TJRj28bLsYQui4hfKh76McyD8vBN0+at6FZ+BkOw316Td+
         oESmYoDPXCHZZNA1rzDVevcOJ+5+8ZFPleApgNlncNDFxrTYp6OUsyfuI65KKgKe+AdK
         ayrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687803627; x=1690395627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DC1JUUoeIHOkdglYQmr1DfzfpGQE2uWlWtSL5MUhKa8=;
        b=lAXIijO9wzDEh8dLEqpB3TH7uYx22XvARhlaGvpYWt6D3EUKAZg0xPPspwnFNPFTbk
         UW6sZt5dbv0H7DLV0qf4TcrAfxhNplJNtPiwdkuEITaEn1hYV8Ch6aGnHHUriHiSardZ
         oo5xaZJI4zSw6Xir4Z13qYpb62wv1niy4vVhT0SPgNNHp5ZePJR3uvO30J78SRzf3orv
         W9th5yJBd/C+1GsF6VN1/yeVwmHsu1V7s3b0p1pOSs3RAabYzqyFmEPNJRm7AaWR+jYY
         9bG1tXo3HMsqDo2aiMd/8OnE061i4Fv+68QONfoxEuIVwd/rXoWoW807yvcm8//c/hmT
         9sBw==
X-Gm-Message-State: AC+VfDz88AIiwSU32eCGx0HYp33Ij1tOkDT+F8Xv3clRh8MxAwqv4JWe
        AWcYVHnM/HOEvr9kx4gsfVTmKmw6Wz1N
X-Google-Smtp-Source: ACHHUZ488Z5RLeNgsxoRg10Vnlrts0vwlnMOG3/l4w4TY2cIGhoT7SAOtLcxmF27YNT6IpiCb3oib0lZxORJ
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a05:6902:18c4:b0:c1c:e037:136c with SMTP id
 ck4-20020a05690218c400b00c1ce037136cmr3172718ybb.0.1687803627815; Mon, 26 Jun
 2023 11:20:27 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Mon, 26 Jun 2023 18:20:14 +0000
In-Reply-To: <20230626182016.4127366-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230626182016.4127366-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230626182016.4127366-5-mizhang@google.com>
Subject: [PATCH v2 4/6] KVM: Documentation: Add the missing description for
 tdp_mmu_root_count into kvm_mmu_page
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mingwei Zhang <mizhang@google.com>,
        Kai Huang <kai.huang@intel.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>, Xu Yilun <yilun.xu@intel.com>,
        Zhi Wang <zhi.wang.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the description of tdp_mmu_root_count into kvm_mmu_page description.
tdp_mmu_root_count is an atomic counter used only in TDP MMU. Its usage and
meaning is slightly different with root_counter in shadow MMU. Update the
doc.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 5cd6cd5e8926..97d695207e11 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -231,6 +231,11 @@ Shadow pages contain the following information:
     A counter keeping track of how many hardware registers (guest cr3 or
     pdptrs) are now pointing at the page.  While this counter is nonzero, the
     page cannot be destroyed.  See role.invalid.
+  tdp_mmu_root_count:
+    An atomic reference counter in TDP MMU root page that allows for parallel
+    accesses.  Accessing the page requires lifting the counter value. The
+    initial value is set to 2 indicating one reference from vCPU and one
+    from TDP MMU itself. Note this field is a union with root_count.
   parent_ptes:
     The reverse mapping for the pte/ptes pointing at this page's spt. If
     parent_ptes bit 0 is zero, only one spte points at this page and
-- 
2.41.0.162.gfafddb0af9-goog

