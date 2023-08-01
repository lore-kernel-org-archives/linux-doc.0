Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA86C001DF
	for <linux-doc@archiver.kernel.org>; Tue,  1 Aug 2023 00:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjHAAV5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 20:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbjHAAVn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 20:21:43 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E10C1BE6
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 17:21:41 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d063bd0bae8so6018515276.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 17:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690849300; x=1691454100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IZ3RpcngQEoYF628RWUm7FlAucMXyfC7tt8DVxrqfpY=;
        b=57IFX5W4Q+tAl7op44Oy2FM4bWgLYmdYlV0ogtgE5VG/ceIH+YmCPWbyTsDo7fM9HN
         Lnws4wIpSYfJP0UKGkymy0Y9qXgPTHZMA1sxCxyWUSD9ih6zw8bvFEzlCftl0K6cQTss
         +cPMLOtCZiICXqKSWGuNnDiPpNVODe1ajPspNsrTYIclyEnCffPmoeUMnORWiwoduSCr
         zQS61STgZlvgz8Yu1+FnDARWgqHun0qtMl3aGJbVHKvXfCsV3YJQ7Ij8D9Nt6LV81ioT
         7+p+yXyQJEPBAvWCncTEjzJ/A8lxjPAogZ7LriiCKW6wLSbz0zZujQ/ZJU30KoiZfXYq
         lz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690849300; x=1691454100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZ3RpcngQEoYF628RWUm7FlAucMXyfC7tt8DVxrqfpY=;
        b=h60V7FolCpWyzkN/iRKp2wFv1JjaZXNMcM+gVO14INwzcp47jYcKc0M4c3RlQRyHin
         JVgcmTHaDOY5Eu2nBvJM/8Ur7p7CGPpuUqmQtxgAjPL8ZWaUGohIDCEgvt4Es6/v2KP3
         KEeG3xjEvmggatSCeu+zOSrAIK0MP/8u+Bi6DUZangVQWaLKTLPs6qhKPBqNsyVL4zDP
         1fN+ldlSEaRlOOAlzIYr7jMIK3G0iS5kq6y4hOPucBGd8Kv9OyWuBoqgE966bnBichtt
         Jt9dHPbnnBBkrhx0x+mfPH1A9La2R1mJIh60ysfUXLlWQkBXtCBOKh4n6dUTNAYFrYFX
         lblA==
X-Gm-Message-State: ABy/qLbjc8vIh9J2tYiB8BYM2J457vNjqpgsYKSCzfLoa0Uq+11n8zGf
        Mw9R7xm1ItRs0F+raeLqkfxobXimm3Vt
X-Google-Smtp-Source: APBJJlGJZOcCOYVE+Z3Mr3gxRHTtU7mDeCgTwRv8AU1gHlMS/GALs031HQ+FAdpW5/GEBF/82uyGtU1Fbz42
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a25:dbcc:0:b0:c4d:9831:9712 with SMTP id
 g195-20020a25dbcc000000b00c4d98319712mr65659ybf.0.1690849300437; Mon, 31 Jul
 2023 17:21:40 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Tue,  1 Aug 2023 00:21:26 +0000
In-Reply-To: <20230801002127.534020-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230801002127.534020-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230801002127.534020-7-mizhang@google.com>
Subject: [PATCH v3 6/6] KVM: Documentation: Add the missing description for
 tdp_mmu_page into kvm_mmu_page
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

Add the description for tdp_mmu_page into kvm_mmu_page description.
tdp_mmu_page is a field to differentiate shadow pages from TDP MMU and
non-TDP MMU.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 581e53fa00a2..3be646a6daf5 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -283,6 +283,10 @@ Shadow pages contain the following information:
     since the last time the page table was actually used; if emulation
     is triggered too frequently on this page, KVM will unmap the page
     to avoid emulation in the future.
+  tdp_mmu_page:
+    Is 1 if the shadow page is a TDP MMU page. This variable is used to
+    bifurcate the control flows for KVM when walking any data structure that may
+    contain pages from both TDP MMU and shadow MMU.
 
 Reverse map
 ===========
-- 
2.41.0.585.gd2178a4bd4-goog

