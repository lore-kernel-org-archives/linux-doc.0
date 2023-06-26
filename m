Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB365EB64DC
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 18:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbjFZSUr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 14:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbjFZSUf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 14:20:35 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1548A10E6
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:30 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b7f5436076so7557965ad.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687803629; x=1690395629;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fPTPHDUYMvFHPd69LEESu74mldUigTMG6iEPquT4JGU=;
        b=hpVsGk/fUm1QcLK2YtEYFckHIZf49A1mdzhhlT6g1Lz6cLQjxC+qmUoy7IFKkrxdTa
         DdRNgOP3WHMEjb/9x9YWNAnaxx26m44CG5C2oiexiZybtYsDWogSxj85PydZ5tc7FW3v
         +NmOpbnqJCiSPeMVd7pgp+giO/Ty5+TAP/8PbLWOW2Ec1BYSHUC+OcmcCAdZGmOycB25
         TxL3HUAGO524gTtd3orZ5coYXLol2k1UotilzoG9GZXIhx9ahPW0lvKpHXOCRiiyeYt/
         fDkfwtXNV/lD3DYHcYbAAhYcNpnmqcXsUfzRZ8sQlZpX0eFtjRio+vRcjZCpz8EvRJNG
         6MnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687803629; x=1690395629;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPTPHDUYMvFHPd69LEESu74mldUigTMG6iEPquT4JGU=;
        b=EXpINQP6ajyerprrIdPioadLBV43eECG8O1frJzPC8MjesJUs0FZ52+hWnTFKHcFgw
         vu8kUiu7PBtbOS8kth12R2ESQTuHCJljVE6fG0yM5U55xA2q6GDWDt4Tvh1xbBD0o2hj
         nTZVOjDfYFkMmEk4ccF4Yj4TNMdzTCHZrmZVLjSVE+VdcbAbIqZ8Ihbm/zg1qzjrmmeb
         H4lRMNrgMida6ocndBxirj7NBT9TiNbOrauMYDt1VMuYI0W1+4ygnOz2Feggb+62Hp9c
         nmlMxy0b74ES4gmXjzXVKeZSZKdub7YP0YU/kiiyc7tFpRl/A3ttEZdLYgEJp57ovDWy
         BYNw==
X-Gm-Message-State: AC+VfDwmT7V2mkDs+g7KIztEGqqcosvlME0qewVmElaNmA1ZdKW3Wm5z
        htNr98hu5xVNS97OQdmlME5M++aSV0/c
X-Google-Smtp-Source: ACHHUZ5i1zR1+WP8oLLG/LizLQqTDq0QVvfrsPT68I7W/9cAU32kCuDMhcHcXyiJKrkWI6nb/K9vN0SU7zL6
X-Received: from mizhang-super.c.googlers.com ([34.105.13.176]) (user=mizhang
 job=sendgmr) by 2002:a17:902:d58e:b0:1a6:c110:900a with SMTP id
 k14-20020a170902d58e00b001a6c110900amr1305666plh.3.1687803629637; Mon, 26 Jun
 2023 11:20:29 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Mon, 26 Jun 2023 18:20:15 +0000
In-Reply-To: <20230626182016.4127366-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230626182016.4127366-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230626182016.4127366-6-mizhang@google.com>
Subject: [PATCH v2 5/6] KVM: Documentation: Add the missing description for
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
        Zhi Wang <zhi.wang.linux@gmail.com>
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
 Documentation/virt/kvm/x86/mmu.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 97d695207e11..cc4bd190c93d 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -208,6 +208,10 @@ Shadow pages contain the following information:
     The page is not backed by a guest page table, but its first entry
     points to one.  This is set if NPT uses 5-level page tables (host
     CR4.LA57=1) and is shadowing L1's 4-level NPT (L1 CR4.LA57=1).
+  mmu_valid_gen:
+    Used by comparing against kvm->arch.mmu_valid_gen to check whether the
+    shadow page is obsolete thus a convenient variable for fast zapping.
+    Note that TDP MMU does not use mmu_valid_gen.
   gfn:
     Either the guest page table containing the translations shadowed by this
     page, or the base page frame for linear translations.  See role.direct.
-- 
2.41.0.162.gfafddb0af9-goog

