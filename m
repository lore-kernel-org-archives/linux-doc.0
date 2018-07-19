Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B40307D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Jul 2018 21:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730651AbeGSWZJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 18:25:09 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41663 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730638AbeGSWZI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 18:25:08 -0400
Received: by mail-ed1-f66.google.com with SMTP id s24-v6so8166342edr.8;
        Thu, 19 Jul 2018 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yvcM8h5p7whjEv93lnAc89bX0Y0PnpWl508XB98yDHI=;
        b=CK2iWGKi+zcQFg+bEnJEGWaOF/XV0YSfVH1mu0yUgktEHXilRA7oYQTqRRvXNYY2sJ
         6jo1Vlp00sq+HOGwmKkldi71JNVvMAc2uiJUms1wOWETVx4M32eDSH+eaT7x9E58Th0L
         KquJxDGe9khVjzW0Kn+PjWHukUsuo1CeD7nu3rGu/NlTHSy7wCdv9qgSfcDj95RWZW/n
         kBIbI7G9Zx44qFNJJY2RhquqsYaxJJYfTb/+1SMrC9H+KfX2g4r6znFzYaQM1u0CcDxu
         wY56xkv68WtHLW2EEBYPbWuBPgRMrCrG4FdO+9J9PcGrKSlhq4Cx+R35ynnF+cVPZcUO
         QQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yvcM8h5p7whjEv93lnAc89bX0Y0PnpWl508XB98yDHI=;
        b=nW+qCT6kruxn9SssBnbINRPEIVMO1zayEiUrcqktyK6Ym32ynGW/JfqjPnVjkw6j4Z
         6AUkMzpSqtDclBDXzmBK2R2PHzQF2jfpqlvMdfw4ZSBgsqeLSjnrUpKmES7ZCO3HGPHf
         hqGFHdG3nc1uwZjQX7gVpsvdWuSOztKugac5PLiDRiQr3jPS/wwqVK2mAj/tl6vooPkK
         Ee4o748BtCKqyfKld9k3E9E6HIVNd9UZ3iYR+aEJgNERxgPMR2i+3Q7Feexct80FuhGe
         feo8aPnhZkacRVSCkqCfcTtLm4V88nNY3sy7KnNqEHlw0w3naYCGX87Ql4EbX35u0UIR
         3Obg==
X-Gm-Message-State: AOUpUlGbETPQpVnqZpKTnmnqq1G06b85Wp7ICbv5UeSHs9L8y/uWovPl
        tu/kcGSAgpovKTQ0pBHCkFtu69qugWM=
X-Google-Smtp-Source: AAOMgpcrQZINh+cKVlZPOCfn18fgVdYjUfcrAb/W2sufOwfYtWU3/A4zS2+S7nVG6D/vmB1rWmYckw==
X-Received: by 2002:a50:9943:: with SMTP id l3-v6mr12494973edb.272.1532036407430;
        Thu, 19 Jul 2018 14:40:07 -0700 (PDT)
Received: from localhost.localdomain ([41.35.209.101])
        by smtp.gmail.com with ESMTPSA id g9-v6sm224049edq.34.2018.07.19.14.40.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jul 2018 14:40:06 -0700 (PDT)
From:   Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>
To:     kvm@vger.kernel.org,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        virtualization@lists.linux-foundation.org,
        linux-doc@vger.kernel.org, x86@kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        nathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, hpa@zytor.com,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Boris Lukashev <blukashev@sempervictus.com>,
        David Vrabel <david.vrabel@nutanix.com>, nigel.edwards@hpe.com,
        Rik van Riel <riel@surriel.com>
Subject: Memory Read Only Enforcement: VMM assisted kernel rootkit mitigation for KVM 
Date:   Thu, 19 Jul 2018 23:37:59 +0200
Message-Id: <20180719213802.17161-1-ahmedsoliman0x666@gmail.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

This is my first set of patches that works as I would expect, and the
third revision I sent to mailing lists.

Following up with my previous discussions about kernel rootkit mitigation
via placing R/O protection on critical data structure, static data,
privileged registers with static content. These patches present the
first part where it is only possible to place these protections on
memory pages. Feature-wise, this set of patches is incomplete in the sense of:
- They still don't protect privileged registers
- They don't protect guest TLB from malicious gva -> gpa page mappings.
But they provide sketches for a basic working design. Note that I am totally
noob and it took lots of time and effort to get to this point. So sorry in
advance if I overlooked something.

[PATCH 1/3] [RFC V3] KVM: X86: Memory ROE documentation
[PATCH 2/3] [RFC V3] KVM: X86: Adding arbitrary data pointer in kvm memslot itterator functions
[PATCH 3/3] [RFC V3] KVM: X86: Adding skeleton for Memory ROE

Summery:

 Documentation/virtual/kvm/hypercalls.txt |  14 ++++
 arch/x86/include/asm/kvm_host.h          |  11 ++-
 arch/x86/kvm/Kconfig                     |   7 ++
 arch/x86/kvm/mmu.c                       | 127 ++++++++++++++++++++++---------
 arch/x86/kvm/x86.c                       |  82 +++++++++++++++++++-
 include/linux/kvm_host.h                 |   3 +
 include/uapi/linux/kvm_para.h            |   1 +
 virt/kvm/kvm_main.c                      |  29 ++++++-
 8 files changed, 232 insertions(+), 42 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
