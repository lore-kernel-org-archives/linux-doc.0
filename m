Return-Path: <SRS0=bcQJ=C7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84303C4727D
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 00:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ED2923A32
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 00:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kdyVgyus"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgIVAks (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Sep 2020 20:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729007AbgIVAko (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Sep 2020 20:40:44 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3018C0613D0
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 17:40:44 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 140so13602485ybf.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 17:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=V3Xr2zBCrWRdkK+k7x0nVhZayUYo5UZWzWiSfnS90fI=;
        b=kdyVgyusZNzoXrTJhguQAb+Mx6TJNWHRXlrjar7ZHpeVOaXSPFcnqpBVcrKSj7jdY/
         Z9S2h73yYxQ9ye0LpN+CnHJtEkvDKrW9dX9pf4gz/5JYMJcccJoedfYoOR8AT6arrG/0
         ux966VV/bda9j4D3905gY+7QxO5ycI5EIzvDsYywy96gVK8JhFGFJMy2GicwDum9X/7W
         5AEWANjjafFjdR3tEOf/Btn3rFXzJXaLz1TU4p2opSJylwS9O8Y07YUPXzdI/9WSkVZ9
         xceQndQbqE8aM4VfKijgA1/KGV6BKYHLXzO7PTdnAOW4uHnL0OrmfA8n9UcoRW9J8H5E
         Wt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=V3Xr2zBCrWRdkK+k7x0nVhZayUYo5UZWzWiSfnS90fI=;
        b=sQ3jsSMNzlAKbD1IQxL8zV/HfRAMOR1tSSgWwTcuDoSm1juYV1vQ4H3JEmRN2VwJHg
         nZ6Tz6Spgq1KOknQOvTmmYvhC+2AN4+fIGwZN9BJezxatp5XoAKx3FUDI8QDOMI5oq69
         kSQ32Pr6jX3Ew+ZkOP8gqFlQHXq9yg7mmTBT+DK7jTV9QD4h7DdSHR86sU9h8cyRyDfb
         sH1xCbDpPCVGJ40Q8Nkv/xmbUTq67TCq0noaiRIgoIDBs135fSdqWNEXBpapiG9Ca9+4
         CBZ3gtrB2nRwij7CZ2BG6mHzU0YnMdOxGlH9aJygU7PhaTjQ71t1fNLh7TQUwSyQ1LAo
         0XGw==
X-Gm-Message-State: AOAM532swvdJyomBDWv0YCSYgpQacGdgr10Cd5FfAn2zuE1KTRwVg1gS
        awTkZUczeklcuALLdVElseK9YgvxS+X6
X-Google-Smtp-Source: ABdhPJxDC6JLVG11hhZe1uOVPGKcetCubbINqx66dzuSedg2x2A03OBC/7sbWEURwwLPReMPnq569d3iROp7
Sender: "vipinsh via sendgmr" <vipinsh@vipinsh.kir.corp.google.com>
X-Received: from vipinsh.kir.corp.google.com ([2620:0:1008:10:1ea0:b8ff:fe75:b885])
 (user=vipinsh job=sendgmr) by 2002:a25:900b:: with SMTP id
 s11mr3389263ybl.426.1600735243795; Mon, 21 Sep 2020 17:40:43 -0700 (PDT)
Date:   Mon, 21 Sep 2020 17:40:22 -0700
Message-Id: <20200922004024.3699923-1-vipinsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [RFC Patch 0/2] KVM: SVM: Cgroup support for SVM SEV ASIDs
From:   Vipin Sharma <vipinsh@google.com>
To:     thomas.lendacky@amd.com, pbonzini@redhat.com,
        sean.j.christopherson@intel.com, tj@kernel.org, lizefan@huawei.com
Cc:     joro@8bytes.org, corbet@lwn.net, brijesh.singh@amd.com,
        jon.grimm@amd.com, eric.vantassell@amd.com, gingell@google.com,
        rientjes@google.com, kvm@vger.kernel.org, x86@kernel.org,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

This patch series adds a new SEV controller for tracking and limiting
the usage of SEV ASIDs on the AMD SVM platform.

SEV ASIDs are used in creating encrypted VM and lightweight sandboxes
but this resource is in very limited quantity on a host.

This limited quantity creates issues like SEV ASID starvation and
unoptimized scheduling in the cloud infrastructure.

SEV controller provides SEV ASID tracking and resource control
mechanisms.

Patch 1 - Overview, motivation, and implementation details of the SEV
          controller.
Patch 2 - Kernel documentation of the SEV controller for both
	  cgroup v1 and v2.

Thanks

Vipin Sharma (2):
  KVM: SVM: Create SEV cgroup controller.
  KVM: SVM: SEV cgroup controller documentation

 Documentation/admin-guide/cgroup-v1/sev.rst |  94 +++++
 Documentation/admin-guide/cgroup-v2.rst     |  56 ++-
 arch/x86/kvm/Makefile                       |   1 +
 arch/x86/kvm/svm/sev.c                      |  16 +-
 arch/x86/kvm/svm/sev_cgroup.c               | 414 ++++++++++++++++++++
 arch/x86/kvm/svm/sev_cgroup.h               |  40 ++
 include/linux/cgroup_subsys.h               |   3 +
 init/Kconfig                                |  14 +
 8 files changed, 634 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/admin-guide/cgroup-v1/sev.rst
 create mode 100644 arch/x86/kvm/svm/sev_cgroup.c
 create mode 100644 arch/x86/kvm/svm/sev_cgroup.h

-- 
2.28.0.681.g6f77f65b4e-goog

