Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5506DC4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 10:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2696560F38
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 10:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244844AbhHFKHt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Aug 2021 06:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244807AbhHFKHt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Aug 2021 06:07:49 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F24C061799
        for <linux-doc@vger.kernel.org>; Fri,  6 Aug 2021 03:07:33 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d17so6379671plr.12
        for <linux-doc@vger.kernel.org>; Fri, 06 Aug 2021 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x6feBf9HHFfTJo5VBeJadJAVn2sLzP1PBAkuOCFqAFQ=;
        b=O9w1LNgNGb8Oa24qAxBilCSvkVEcE9Ej9r2ANCue0ou4JfMF8ytKrogiWfKn1IdXW4
         /QyzIU3e9K0wdlVIdJVK9ysvFjopgir7+VRpkh9rZqO3DPoC8cSsskb3xkKyrqf4uU9Q
         p0+iMGAeZa5/5L9RDamJFqg0uAKCVe+flj0Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x6feBf9HHFfTJo5VBeJadJAVn2sLzP1PBAkuOCFqAFQ=;
        b=n1oL6XFmTgjz1wgFPtRhmSjMP6XZccaH0TEG8tizKYbTAMWwt5Y7OVv3pL7YsCbyoS
         8XbP5HtxuCJY82/En7sUv4gk5jkap7kMIqNMRDtP3RcyRAyb9CfeK4RbkS510vn5Rein
         niUhcCW1U/KWcfwepjLk7BqgR++Ab/OLgBy9ZFsVBASCet+riv/RAX0+L2CFx3fk+kF8
         UZ9BpPl97QC2m848e3yJD1RyGWMdCfSN7YfsaK7He8WxzmhJO3d2ZH1ZPQq0U7LCgMeM
         iygwKT8RBAH3VPzuR324XlOMATo1hh6GD58LwDbIasDV6Bz8velzEbjQ7IDPSatBUNuS
         GINA==
X-Gm-Message-State: AOAM531vFfbzeC44VcTd8C0jNxLIvRciyhH5Hjf4eeoNVhp5w3ktrxYX
        aDRZpb6Wo0oE9DteYMuLVS1TAw==
X-Google-Smtp-Source: ABdhPJyojKdf1A1mhaHwoS2sCbrTfC4tzRJhWfp4CTlAn1AbaMHcr7ba9JApUobqvx0Sm3+olsVflw==
X-Received: by 2002:a05:6a00:c81:b029:30e:21bf:4c15 with SMTP id a1-20020a056a000c81b029030e21bf4c15mr9975980pfv.70.1628244453447;
        Fri, 06 Aug 2021 03:07:33 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:b731:9e91:71e2:65e7])
        by smtp.gmail.com with UTF8SMTPSA id r14sm2394630pff.106.2021.08.06.03.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 03:07:32 -0700 (PDT)
From:   Hikaru Nishida <hikalium@chromium.org>
To:     linux-kernel@vger.kernel.org, dme@dme.org, tglx@linutronix.de,
        mlevitsk@redhat.com
Cc:     suleiman@google.com, Hikaru Nishida <hikalium@chromium.org>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Juergen Gross <jgross@suse.com>,
        Lai Jiangshan <laijs@linux.alibaba.com>,
        Mike Travis <mike.travis@hpe.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Sean Christopherson <seanjc@google.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Steve Wahl <steve.wahl@hpe.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, x86@kernel.org
Subject: [v2 PATCH 0/4] x86/kvm: Virtual suspend time injection support
Date:   Fri,  6 Aug 2021 19:07:06 +0900
Message-Id: <20210806100710.2425336-1-hikalium@chromium.org>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi,

This patch series adds virtual suspend time injection support to KVM.
(It is an updated version of the following series.)
https://lore.kernel.org/kvm/20210426090644.2218834-1-hikalium@chromium.org/

Changes to v1:

- Using IRQ instead of polling to detect the host's suspension.
- Removed unused arg "updated" from kvm_write_suspend_time()
- Improved comments and commit messages.

Please take a look again.

Thanks,

Hikaru Nishida



Hikaru Nishida (4):
  x86/kvm: Reserve KVM_FEATURE_HOST_SUSPEND_TIME and
    MSR_KVM_HOST_SUSPEND_TIME
  x86/kvm: Add definitions for virtual suspend time injection
  x86/kvm: Add host side support for virtual suspend time injection
  x86/kvm: Add guest side support for virtual suspend time injection

 Documentation/virt/kvm/cpuid.rst     |   3 +
 Documentation/virt/kvm/msr.rst       |  30 ++++++++
 arch/x86/Kconfig                     |  13 ++++
 arch/x86/include/asm/idtentry.h      |   4 +
 arch/x86/include/asm/irq_vectors.h   |   7 +-
 arch/x86/include/asm/kvm_host.h      |   5 ++
 arch/x86/include/asm/kvm_para.h      |   9 +++
 arch/x86/include/uapi/asm/kvm_para.h |   6 ++
 arch/x86/kernel/kvmclock.c           |  40 ++++++++++
 arch/x86/kvm/Kconfig                 |  13 ++++
 arch/x86/kvm/cpuid.c                 |   4 +
 arch/x86/kvm/x86.c                   | 109 ++++++++++++++++++++++++++-
 include/linux/kvm_host.h             |   8 ++
 include/linux/timekeeper_internal.h  |   4 +
 kernel/time/timekeeping.c            |  37 +++++++++
 15 files changed, 290 insertions(+), 2 deletions(-)

-- 
2.32.0.605.g8dce9f2422-goog

