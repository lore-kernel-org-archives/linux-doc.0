Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA9AC001DF
	for <linux-doc@archiver.kernel.org>; Tue,  1 Aug 2023 00:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjHAAVb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 20:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjHAAVb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 20:21:31 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AF5199E
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 17:21:30 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-563ab574cb5so3264568a12.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 17:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690849290; x=1691454090;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+wox7n0HGm6/MIYHbn+fgxMoQ9mtfs5CTs8dCYiGjc=;
        b=YKTsvhZ2yK8ijk1hvQnnvPjyJrUl4x9YYQigtkgJOdxwi8e5EDHLvzyUyj2vk/YVzV
         ekiC0pO2TtKJD66SiHJZnIibf42rePRdof640KqRxj8VIzBlJzSPwl8Nv3Cf7/N3ldth
         dGMqUsC83Gp+4oqcau6yKS4sZjKLLuPF6Ar5VeXi38GKp2ChE+gXsXyVmyb3mAYFif3I
         LTM5a4ZPX5OMHhjtleUviJslPw3SL0x8d4c4d6bDV64KvtlRtwrsXi/jRI1b44l8L2S7
         +6WP4Z/eh60ZvzMSyoYaPBCZME3nj2v23uiDCoQKCCLsFq0viP/MBQqDXzccOwOjHXbc
         JtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690849290; x=1691454090;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+wox7n0HGm6/MIYHbn+fgxMoQ9mtfs5CTs8dCYiGjc=;
        b=UtNs0/6s2mtJPZr3L9f2eP1PtkviCWG/sONo8/WNIA2iQW70029jxO+H6LHkPPyPYd
         l9V23EJST21Gt9Vp0UAUSKR1Vro+0rzDWBQS/OnEF0mFyprT8txvTE5t4oeuJt+A2III
         e2zdjXM/bnQUYANQXMXDTQXw7bmqe8AqwGExegyRXE1/+KGjyX6/3HyRJrkp1W/lc51s
         7aPybcSf3jjClBd8pIjKjqsnvDSeMHbbqz8mZryGUaQ9iZfo1QC/q6CQ+0+noLpcJmsX
         Zg5UfoxlCiVCbAqRQXTr8NdZnHzxa9mjolwT5Lp+qaTqcRyR1ZULo9MbfvKlWCrIYN/u
         C6Og==
X-Gm-Message-State: ABy/qLamcLh9GnaiWNGxF0RzWz+q2w8E/SljYacRlMtf/aqBW5UZQcUd
        eJUFgJES1ScjlWEHrAA1njtJPMK8fYgb
X-Google-Smtp-Source: APBJJlE0OuN5kF9ibnyFOkVhExXmb05tVThZCevDMYgY3YUyE3ZrbAfNXVORndtQ7keq6D5QKaDiMrGmSoTP
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a63:3e41:0:b0:563:9037:b725 with SMTP id
 l62-20020a633e41000000b005639037b725mr50244pga.3.1690849289749; Mon, 31 Jul
 2023 17:21:29 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Tue,  1 Aug 2023 00:21:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230801002127.534020-1-mizhang@google.com>
Subject: [PATCH v3 0/6] Update document description for kvm_mmu_page and kvm_mmu_page_role
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

This is the 3rd version and I made some changes according to feedback:

v2 -> v3:
 - update the description of shadowed_translation [sean,randy].
 - update the description of ptep for tdp mmu [sean].
 - update tdp_mmu_root_count into root_count and update the description
   [sean].
 - update mmu_valid_gen with more details suggested by [sean]
 - add extra description for tdp_mmu_page [sean]

Mingwei Zhang (6):
  KVM: Documentation: Add the missing description for guest_mode in
    kvm_mmu_page_role
  KVM: Documentation: Update the field name gfns and its description in
    kvm_mmu_page
  KVM: Documentation: Add the missing description for ptep in
    kvm_mmu_page
  KVM: Documentation: Add the missing description for tdp_mmu_root_count
    into kvm_mmu_page
  KVM: Documentation: Add the missing description for mmu_valid_gen into
    kvm_mmu_page
  KVM: Documentation: Add the missing description for tdp_mmu_page into
    kvm_mmu_page

 Documentation/virt/kvm/x86/mmu.rst | 44 ++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 9 deletions(-)


base-commit: 0b210faf337314e4bc88e796218bc70c72a51209
-- 
2.41.0.585.gd2178a4bd4-goog

