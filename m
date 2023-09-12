Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A827EE3F0B
	for <linux-doc@archiver.kernel.org>; Tue, 12 Sep 2023 18:46:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235304AbjILSqU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Sep 2023 14:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237559AbjILSqO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Sep 2023 14:46:14 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590DF172B
        for <linux-doc@vger.kernel.org>; Tue, 12 Sep 2023 11:46:06 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1bf60f85d78so83484505ad.3
        for <linux-doc@vger.kernel.org>; Tue, 12 Sep 2023 11:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694544366; x=1695149166; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XcIQx89b7EXA4Jd30psh2om9W5cX9cr0aEmWIDQQPw0=;
        b=kZrO76abI+5Y7yb5qnQK8fohA9OAUhhARJhdzXibtKW9ISWk52Oe0jVG3iNwF+frPC
         VweDyg/qdaOGycLMaBqOKJyn+q7+aSkaL4nBKzsqiIA0f7jp/T6O21SrufoSfMrHNm3e
         1wLzbE7L0vZcnZG1NGCb/IdecABMSNj5pXjZlTmVtiWRRAxDe7NmePFihn5/pE9Aaq/E
         XjSp8xbBJ0xtM4kSDI4zMMm5bauKY5QFkhZOlCMh6/UMCZuTntfQ0v+P81tt6AauJDrU
         CTWG3inqQ1+5VmhtsTA0Tj0OZpPdyKoJ6IL0D8XmPpjLAMg0kp/n9jEToTXr8PrqS/50
         2GMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694544366; x=1695149166;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XcIQx89b7EXA4Jd30psh2om9W5cX9cr0aEmWIDQQPw0=;
        b=mbrwVwdY7/9zg2n88/9wvYWentSpJFeLkVJpNlNUn/gYS6n5MpaazeXtVF3D60QpqT
         82H8Db3OAf7LyZjjnx7dnMTvX7DoJU5my0nO/k2QVxmZK6HI0utC0EQtD8uONBvwT+LZ
         LHKBq5TdffRTsBqCOSiGRePkekOtGMsWSox9lYXD1ZEBW+naUEDU2BmfHfRk+xeY/zjH
         nm1hNuhA2xc3DsA7EdFnrH607WTerKVcECOvgTE6dBv8MQmVkZw9MGm99ZqJZ+pq1rRj
         dLPU+ftdMnalQrXZ3VfdsV0ELGvSjxxEJNI820vkMtTgmqPyOwx/WpcDFAg5j9X5ANH7
         0S7Q==
X-Gm-Message-State: AOJu0YwJd6gp/XJ5KTmAUGuclWS60CEbaHidKRbz9GaE6zhxcrJiWqUk
        sejgwiNIGarFm5n/DkCQ4yI3tVZzv49n
X-Google-Smtp-Source: AGHT+IGqq6x9d5HVPWndODMEBXDlwAy8Xp83EGfJSqGJEHDZ9LhqD2Cj4ch/JRrq3iQPJn9/ImPHNYbFcoBO
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a17:902:e749:b0:1b8:a593:7568 with SMTP id
 p9-20020a170902e74900b001b8a5937568mr86132plf.8.1694544365752; Tue, 12 Sep
 2023 11:46:05 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Tue, 12 Sep 2023 18:45:52 +0000
In-Reply-To: <20230912184553.1887764-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230912184553.1887764-1-mizhang@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230912184553.1887764-6-mizhang@google.com>
Subject: [PATCH v4 5/6] KVM: Documentation: Add the missing description for
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
index 4a82fa016833..16d5d6a1c174 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -208,6 +208,16 @@ Shadow pages contain the following information:
     The page is not backed by a guest page table, but its first entry
     points to one.  This is set if NPT uses 5-level page tables (host
     CR4.LA57=1) and is shadowing L1's 4-level NPT (L1 CR4.LA57=0).
+  mmu_valid_gen:
+    The MMU generation of this page, used to fast zap of all MMU pages within a
+    VM without blocking vCPUs too long. Specifically, KVM updates the per-VM
+    valid MMU generation which causes the mismatch of mmu_valid_gen for each mmu
+    page. This makes all existing MMU pages obsolete. Obsolete pages can't be
+    used. Therefore, vCPUs must load a new, valid root before re-entering the
+    guest. The MMU generation is only ever '0' or '1'. Note, the TDP MMU doesn't
+    use this field as non-root TDP MMU pages are reachable only from their
+    owning root. Thus it suffices for TDP MMU to use role.invalid in root pages
+    to invalidate all MMU pages.
   gfn:
     Either the guest page table containing the translations shadowed by this
     page, or the base page frame for linear translations.  See role.direct.
-- 
2.42.0.283.g2d96d420d3-goog

