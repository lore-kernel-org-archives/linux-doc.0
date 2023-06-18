Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71466EB64D9
	for <linux-doc@archiver.kernel.org>; Sun, 18 Jun 2023 00:09:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjFRAJN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Jun 2023 20:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjFRAJN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Jun 2023 20:09:13 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF95170E
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 17:09:12 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-54ff7ab1e4dso1752552a12.3
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 17:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687046951; x=1689638951;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymRd0fdFh05CtNVNiLUjlDKK/2gV3v4AfyLZi4whH8g=;
        b=rMMgGNr8vOsgIkOwkRLQIIhyAjefMdQun+/xW0SYS17CmY6HzQ06lgWc6nsxtEfJTv
         Ht+YODtZPWTHujruU9N3ACex9+1Dv9mnBumypRTC2rrba1NQNUZyxoh2qvP++oAnMbOe
         FTLLemr0Z4m1wethMrX1dXSWMKUgENWDCm7hM9la9tX8ZgYuWu8nJ5eeioSr8a3YWGvE
         2FfkBIalA3Jc0giJsyLWj+lRkA2dnltrX66kqGs7FTP48zPkLEpNFf00nJy/53tnaBRA
         TH6QP/ReTgdCAU4enlYNi7Exx5f1Yojwdz8ryHo3mJ7Rqw3+6KkY56ON8inJK6Pzqik1
         0h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687046951; x=1689638951;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymRd0fdFh05CtNVNiLUjlDKK/2gV3v4AfyLZi4whH8g=;
        b=ONlAPjiLbIpccI9wYgZ/Bf/zcsrg1C094T3TFNL/X70CgpVipIQz29BHYvJOenzf5m
         8dnpslQVQ/ZDv+t0qvoAEJ/LrxDzoGF0qimGBygWkKsKOl2Rylckz4y6Rdwk7TAJgYD5
         k2PVCS0tbQGCNiQcZkWXdFeuzUTnPcjUv3m2btMcQ2+ycadrEjhllzIEerKIy37gIxBx
         YVYyHyappGjixrQFmB0z7RBvnWP0DtmQax+hLo2+xK1n5TS3uXqwh7ze/oPkGZHzfetU
         xb+qpk/plVGyF+CJNtgqx0e27kW1CLkoWaHCYBOyVnNsb3Tb/gvbinSSTsJTFh5OcrX7
         AGCA==
X-Gm-Message-State: AC+VfDy4x9NuoLeEmKc02r6axKDd+fRkvtHggkLrwawYfi4HDcxTOmvY
        NuxaiNpPTEmVCtm44z4ZBS2WMAlT7ayH
X-Google-Smtp-Source: ACHHUZ7GBo3wRFRwvXCrjp6qeYjQCJ/WI3qJ0vD6yL18cd/w9bx5ricJ9hcD5llEl1GlDMxTKrwzIOWwXMmF
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a17:902:a705:b0:1b3:ec39:f41b with SMTP id
 w5-20020a170902a70500b001b3ec39f41bmr915256plq.7.1687046951468; Sat, 17 Jun
 2023 17:09:11 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Sun, 18 Jun 2023 00:08:50 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230618000856.1714902-1-mizhang@google.com>
Subject: [PATCH 0/6] KVM: Documentation: Update document description for
 kvm_mmu_page and kvm_mmu_page_role
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

When reading the KVM MMU documentation for nested virtualization, I feel
that the description of kvm_mmu_page (and kvm_mmu_page_role) has been
lagging for around 1-2 years. The descriptions for several fields in struct
kvm_mmu_page and struct kvm_mmu_page_role are missing. So I think it might
be good to add them to make it consistent with the current code.

Note that there are still some fields not added in this series:
 - kvm_mmu_page.nx_huge_page_disallowed
 - kvm_mmu_page.possible_nx_huge_page_link
 - kvm_mmu_page.hash_link
 - kvm_mmu_page.link

For the above, I thought the description might be just better to be
inlined or there is already good description inlined.

Mingwei Zhang (6):
  KVM: Documentation: Add the missing guest_mode in kvm_mmu_page_role
  KVM: Documentation: Update the field name gfns in kvm_mmu_page
  KVM: Documentation: Add the missing ptep in kvm_mmu_page
  KVM: Documentation: Add the missing tdp_mmu_root_count into
    kvm_mmu_page
  KVM: Documentation: Add the missing mmu_valid_gen into kvm_mmu_page
  KVM: Documentation: Add the missing tdp_mmu_page into kvm_mmu_page

 Documentation/virt/kvm/x86/mmu.rst | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)


base-commit: 265b97cbc22e0f67f79a71443b60dc1237ca5ee6
-- 
2.41.0.162.gfafddb0af9-goog

