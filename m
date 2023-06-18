Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA11FEB64DA
	for <linux-doc@archiver.kernel.org>; Sun, 18 Jun 2023 00:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbjFRAJ0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Jun 2023 20:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbjFRAJW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Jun 2023 20:09:22 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37048170A
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 17:09:21 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-25e7fe2fb9bso943835a91.3
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 17:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687046960; x=1689638960;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kxL2IQh8QsyzT6M8Esvdn0S5tsYGjEEcYbokMBIJOOA=;
        b=zAN4yl/yAf39StZnUGptrfSOQsv6LlI7o2HkFCAMqcoRQjjCgZ3r19ALi5wJn9JDPy
         u6bIXwRmOwOC838v8rtUVWtWyBTAhG48OwwangQhrI26phyUC36Mvw7FPmof3d4i8thI
         HskS9RE2wxly89AwCkzpOj3R7prtSydMxkqZ+ZJoQqCLhsVvoRJvCeU+kw56/h1Tq95V
         7xTx0H2mqfVUQNCwvin9J+4qUr0oZUX9SHG46zY+WPcusQv2dEzJTLeI1M/Uezu0MucY
         L0UArTP0fH+mSE7lERHIcQo2OODhzgmX1Azw0C2c/LZKL+qteyd4lSCgMSMmgLFAuRQz
         TPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687046960; x=1689638960;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxL2IQh8QsyzT6M8Esvdn0S5tsYGjEEcYbokMBIJOOA=;
        b=ivv6SBwkgHpWCqDCmhCaqmxQiehNX7lHB46Pg3eRPxzoo1ZiNjpjk9ZeT5OILL3sDU
         1CDRUYt270dhgVoUmPpD0J+JYgb6QbQ511Yxf+uFS8s7iqTbJKoL0baXS4W7bXJKuXzp
         vWT6bryxAI/t85PwdrQKxm6SLF5eot3LQeBTk1XmdVb0k9FJJetzL8gszXg6uDrVRhq4
         QdiRx1eRhX79StGGJHdvryEa6cBUevuQGphmLZxOM6A4DYQo119B3OGwR5pIsraDpp+i
         WdRzlfy6S8Ra2mzvuef3kpBij7/b7TiFVQcsSQ/A+d2LjuLOQoI2S8T7nm3j95ndsm1f
         aYKA==
X-Gm-Message-State: AC+VfDxOpIZ4pPyidggvXTjo8FaOweQOj4fzn+rXHRaCprj4eL+zsbd9
        E8iJ43u1WM8LTTCpP6aMzE/4zRqbUrja
X-Google-Smtp-Source: ACHHUZ667rmHgnnVMFyiOS98UlXH2hDjVOn68VnJ+dNKWA2D/uGC0vcKPrekHRymKGd05CoJKmuP1cPxyqdg
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a05:6a00:1a15:b0:654:8eb9:4607 with SMTP id
 g21-20020a056a001a1500b006548eb94607mr1818385pfv.4.1687046960661; Sat, 17 Jun
 2023 17:09:20 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Sun, 18 Jun 2023 00:08:55 +0000
In-Reply-To: <20230618000856.1714902-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230618000856.1714902-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230618000856.1714902-6-mizhang@google.com>
Subject: [PATCH 5/6] KVM: Documentation: Add the missing mmu_valid_gen into kvm_mmu_page
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

Add mmu_valid_gen into kvm_mmu_page description. mmu_valid_gen is used in
shadow MMU for fast zapping. Update the doc to reflect that.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 3dce2426ad6d..0dbdb7fb8cc6 100644
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

