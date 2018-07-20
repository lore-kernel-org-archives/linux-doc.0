Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 203DD7D085
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 23:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbeGUAXF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Jul 2018 20:23:05 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42523 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727812AbeGUAXF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jul 2018 20:23:05 -0400
Received: by mail-ed1-f65.google.com with SMTP id r4-v6so10937974edp.9;
        Fri, 20 Jul 2018 16:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cLjT3vDDaVHSaWh6gTnGy+dRSK1GnnPM9EMQvi377jo=;
        b=NXQG/jU6198crjMVy8jcviLsbgPVEJvQugzQbEbYSOUeQ96ECMDPet/9knmOLTEUgb
         N/mTBHBZKXywZc+DHupS0tYKBIR2EmpakKre7CL4c8NBByE0/agTE5aXeuqPYYgdknws
         xo+qwRfXNQhWhM6wZFKMpIhGuKx85sC+jmEffGmKlCSAS6a9mOzhzXqJQCYwohoXsrnz
         oy1mmIVoJf6jL/nrWO13ZeIuPMFAoBx2CbVdWa/tPMIGt/BnGrBCQXJ1JeOE4eTuQVTj
         nJJNqdYVT3ZU8n6BE921ptm6miUjcaZur5C/MnpfG/CGU7VTVnwFSar8Zf3JIA7sJ1w4
         9o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cLjT3vDDaVHSaWh6gTnGy+dRSK1GnnPM9EMQvi377jo=;
        b=djszcWu6JviXrAar/XPzm9tGlZuqGuS7VCqAXZoCB+6lIWJm/dbLqtgSJsIEeI3j60
         GpoIBBTqh2cDCr6JWxq+Mqn7FOCrkDOnKPF7FByeOwbfcjqo0N0FUzJB4vENAaUwVkyI
         FMDLppDRL9ioZO9223Q/ZyYlp+wsghmp/bNp8kBgLPSy1XxVXgXq+58l5AJYEhCz4v75
         663DtX58PEs1nyRNrr8hZdB6aNPo+VoWN26GSKhYmruNh3nsGk1e3m4Ngun6a8ZDEJoR
         1hbft1OVbkaGo8dJhSIAYpLggc/S8t+9dD0u5YUApSwUONxqa7QOIlj5zElfepvFALIo
         9LAg==
X-Gm-Message-State: AOUpUlF4LE7hXIEAoIBCbFnh5MPDJVS8Xl8fZevTfzXkDU9SzM8nIaqB
        uWLW4duNZvIN9xJ8SQPYYQV3w1+Cd+Y=
X-Google-Smtp-Source: AAOMgpfVJdsdOPEb5TXI60VDSyIjF7cGZLlKN6WhVasV/yn0N3GUxdh21cRxFmVuwoZsZfH7gvLTfQ==
X-Received: by 2002:a50:f145:: with SMTP id z5-v6mr4551976edl.0.1532129555838;
        Fri, 20 Jul 2018 16:32:35 -0700 (PDT)
Received: from localhost.localdomain ([41.35.209.101])
        by smtp.gmail.com with ESMTPSA id p12-v6sm1117092eds.13.2018.07.20.16.32.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jul 2018 16:32:35 -0700 (PDT)
From:   Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>
To:     kvm@vger.kernel.org,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        virtualization@lists.linux-foundation.org,
        linux-doc@vger.kernel.org, x86@kernel.org,
        xen-devel@lists.xensource.com
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
Subject: Memory Read Only Enforcement: VMM assisted kernel rootkit mitigation for KVM V4
Date:   Sat, 21 Jul 2018 01:31:27 +0200
Message-Id: <20180720233130.14129-1-ahmedsoliman0x666@gmail.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Here is change log from V3 To V4:
- Fixing spelling/grammar mistakes suggested by Randy Dunlap
- Changing the hypercall interface to be able to process multiple pages
  per one hypercall also suggested by Randy Dunlap. It turns out that
  this will save lots of vmexist/memory slot flushes when protecting many
  pages.

[PATCH RFC V4 1/3] KVM: X86: Memory ROE documentation
[PATCH RFC V4 2/3] KVM: X86: Adding arbitrary data pointer in kvm memslot iterator functions
[PATCH RFC V4 3/3] KVM: X86: Adding skeleton for Memory ROE

Summary:

 Documentation/virtual/kvm/hypercalls.txt |  14 ++++
 arch/x86/include/asm/kvm_host.h          |  11 ++-
 arch/x86/kvm/Kconfig                     |   7 ++
 arch/x86/kvm/mmu.c                       | 127 ++++++++++++++++++++++---------
 arch/x86/kvm/x86.c                       | 104 ++++++++++++++++++++++++-
 include/linux/kvm_host.h                 |   3 +
 include/uapi/linux/kvm_para.h            |   1 +
 virt/kvm/kvm_main.c                      |  29 ++++++-
 8 files changed, 254 insertions(+), 42 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
