Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2CCEB64D9
	for <linux-doc@archiver.kernel.org>; Sun, 18 Jun 2023 00:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbjFRAJ3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Jun 2023 20:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbjFRAJU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Jun 2023 20:09:20 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875EA170A
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 17:09:19 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-53b9eb7bda0so1045724a12.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 17:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687046959; x=1689638959;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SZRhH39sdwsf6mf7jmU2xtyZAtu6JfAYC83IgKKrw3g=;
        b=yKkIRX0QpeQIZE1DidVGEAYWTGzy1a7kdjPPYLn8eK2kTitM+zJT9u6VA55WaqmtV6
         pWHjiKIuMZWbo2Pnap/dtOis3oRHJicAz7uD3wD5V/AnkB+f30edVXETNO//NaRsMPv0
         k/E+3VFdUlcad6EjHg+NVkBMrG8YirRZjg8CNYDb5HsmaTFw8gxIHruDw+7xEj5a/N9b
         s5WHerxEKQKPsUwVjAKK/8YaGjoM7Q8orVuDn+mfc8+Hw4YWUMIAnvwn2u9CkSdrJgFI
         sI+/eW+ixsQaT0cz+EHG9Hcon8LeQaDmkuRhNbgFglelLp5mNWJKezlzTzT9vI5/yjsC
         68sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687046959; x=1689638959;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZRhH39sdwsf6mf7jmU2xtyZAtu6JfAYC83IgKKrw3g=;
        b=LeCBMosuKsW+fM/FdMREn3JawfJCpVhAGD6jh2HFCZWM0DcGyezp4vtNQxmBACFLsY
         LXj5nhJTQE8PdpmAhfWe+Yb8ipCLBPUezTmbdvPr9DsnNVqqLxF9x9qPdZ7Z11JpFIEL
         /2WvKkxslm04s1Uk2bqiyF4aSleFPDQ7R46tK9QQve42dslLUP2z28Uj3b4gaGnjk9Pt
         brV3ypasZepf8cfsuIaoCszbcqMzLZQmApnvEfcmTl+wbAp3TCr7sSe7BTFboknEGogY
         Qxk12bnjJ63rcKCjPGNQ4Dy4gub6XsTyYWgba79U8jeasODZSqVQbpxm9pVnD4Mkqk9t
         jmYA==
X-Gm-Message-State: AC+VfDzM8eQgaYnByi3u6js4ftedhjP2vKhitmfJyDctfEtwHCPv79Zd
        7kVpIzJgH/twVdDznaZrg1sfP2oZGFeO
X-Google-Smtp-Source: ACHHUZ6s/0SDgBjDHb7lnw7v17wR8UYblxJ4u12S9rHeLlYYijB1xGLNmU6+VDed2EOc0mlXhPDl+/6YPoZi
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a63:782:0:b0:517:ce37:756e with SMTP id
 124-20020a630782000000b00517ce37756emr406250pgh.7.1687046959115; Sat, 17 Jun
 2023 17:09:19 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Sun, 18 Jun 2023 00:08:54 +0000
In-Reply-To: <20230618000856.1714902-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230618000856.1714902-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230618000856.1714902-5-mizhang@google.com>
Subject: [PATCH 4/6] KVM: Documentation: Add the missing tdp_mmu_root_count
 into kvm_mmu_page
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

Add tdp_mmu_root_count into kvm_mmu_page description. tdp_mmu_root_count is
an atomic counter used only in TDP MMU. Its usage and meaning is slightly
different with root_counter in shadow MMU. Update the doc.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 36bfe0fe02bb..3dce2426ad6d 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -230,6 +230,12 @@ Shadow pages contain the following information:
     A counter keeping track of how many hardware registers (guest cr3 or
     pdptrs) are now pointing at the page.  While this counter is nonzero, the
     page cannot be destroyed.  See role.invalid.
+  tdp_mmu_root_count:
+    An atomic reference counter in TDP MMU that allows for parallel
+    accesses.  Accessing the page requires lifting the counter value. The
+    initial value is set as 2 indicating one reference from vCPU and one
+    from TDP MMU itself. While this counter is nonzero, the page cannot be
+    destroyed. Note this field is a union with root_count.
   parent_ptes:
     The reverse mapping for the pte/ptes pointing at this page's spt. If
     parent_ptes bit 0 is zero, only one spte points at this page and
-- 
2.41.0.162.gfafddb0af9-goog

