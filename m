Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7D1C64E7C
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:42:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D895A2173E
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgLBSmJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Dec 2020 13:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgLBSmI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 13:42:08 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BC3C0613D4
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 10:41:28 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p8so5161139wrx.5
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 10:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e1Z0+ryeRyyzeQLn6jGhUYGvGo5ZwSh+Fr7aG6B2ob4=;
        b=uGQ3UqtkSS7C/9Ig5EagS0UZtcKog6tYN0YJ626ZVKEoUo01ksdAhL62U2BxgB5dZg
         rKCLi4m9XeDs/EVYQVjrjSkppckrQyzq1uXhbodHw/LtotYn5WhiljcYpg28ij4XDQo7
         OSdj5eDzaFH9msYoZn7Z6yudMw6tKQHBtH7xHOsqC4bKN1o5QG7ieDpwai3tdBZiHSDA
         dn27L6K5sICUVX7LIEqbXYPZOzt9obFHGSxSaBJkYVYVhvggHwdhf8/r6EZpjifRJ3wp
         uFf5r+AlBEcTPVpofHwdMXXwAzsaSQMTW86s2Up8AIuC3yWifBI2drM9MxYFcrEADztu
         ONVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e1Z0+ryeRyyzeQLn6jGhUYGvGo5ZwSh+Fr7aG6B2ob4=;
        b=fMt88+gAe7XYpX4GMan33IiQtebQ4zSXhGIMFIF+S5rBJuZ/T6sAjARhixUPRewXCy
         vwhgYKiszq8U9ifpL3CvKNnPP1xt0jrCIIYW4OFqWn4APXS6aBsTPlkIpwXqLZNmp/6k
         lJqUPZ0MnTn8z/61grvtH0GVzGo5wPpvKNphp/p+y70ziMBhk+1EIleJ6WkIrxCzTaKy
         qrfaGlrW6dbX4r8dR/TurFTQj5VdgkOKoyj7tv5RDsHNOgqV90JpJLS21XjHwOShlOFp
         h0uOzlt6ZqCXhyNK/mvFy+svPx6v5L+D1T5UEytOaa2NqTZG8suKzbXHzN8CyAKd6I1p
         o4Hw==
X-Gm-Message-State: AOAM532HAEBdyJyyE6hEc7q44AM/lfhou4fZbh9Yo7tO73C2ffjPkrlh
        x9fspRQqIwCqIELdf1cesaUzew==
X-Google-Smtp-Source: ABdhPJx1w9Za4oKqZXg2Dy1UhvQI3Eu7AdD4tn4vLTpLkNPqMykN/lsubM91TR4YxORoVI+J/7iZTQ==
X-Received: by 2002:adf:fd0e:: with SMTP id e14mr4975271wrr.119.1606934486886;
        Wed, 02 Dec 2020 10:41:26 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id l23sm2800059wmh.40.2020.12.02.10.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 10:41:25 -0800 (PST)
From:   David Brazdil <dbrazdil@google.com>
To:     kvmarm@lists.cs.columbia.edu
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com, David Brazdil <dbrazdil@google.com>
Subject: [PATCH v4 00/26] Opt-in always-on nVHE hypervisor
Date:   Wed,  2 Dec 2020 18:40:56 +0000
Message-Id: <20201202184122.26046-1-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As we progress towards being able to keep guest state private to the
host running nVHE hypervisor, this series allows the hypervisor to
install itself on newly booted CPUs before the host is allowed to run
on them.

All functionality described below is opt-in, guarded by an early param
'kvm-arm.mode=protected'. Future patches specific to the new protected
mode should be hidden behind the same param.

The hypervisor starts trapping host SMCs and intercepting host's PSCI
calls which boot CPUs. It replaces the host's entry point with its own,
initializes the EL2 state of the new CPU and installs the nVHE hyp vector
before ERETing to the host's entry point.

The kernel checks new cores' features against the finalized system
capabilities. To avoid the need to move this code/data to EL2, the
implementation only allows to boot cores that were online at the time of
KVM initialization and therefore had been checked already.

Other PSCI SMCs are forwarded to EL3, though only the known set of SMCs
implemented in the kernel is allowed. Non-PSCI SMCs are also forwarded
to EL3. Future changes will need to ensure the safety of all SMCs wrt.
protected guests.

The host is still allowed to reset EL2 back to the stub vector, eg. for
hibernation or kexec, but will not disable nVHE when there are no VMs.

Tested on Rock Pi 4B, based on kvmarm/queue, itself on top of 5.10-rc4.

Patches also available at:
    https://android-kvm.googlesource.com/linux topic/psci-on-master_v4

changes since v3:
  * generic 'kvm-arm.mode' kernel param instead of 'kvm-arm.protected'
  * implement SYSTEM_SUSPEND
  * refactor PSCI driver to expose fn IDs more cleanly
  * init MAIR_EL2, TCR_EL2 from nVHE params struct

changes since v2:
  * avoid non-spec error in CPU_SUSPEND
  * refuse to init without PSCI
  * compute hyp VA args of hyp-init in hyp instead of using params struct
  * use hyp_symbol_addr in per-cpu calls
  * simplify memory.h/sysreg.h includes
  * rebase on kvmarm/queue, use trap handler args macros

changes since v1:
  * early param sets a capability instead of a static key
  * assume SMCCC v1.2 for host SMC forwarding
  * fix reserved SMC ID range for PSCI
  * split init_el2_state into smaller macros, move to el2_setup.h
  * many small cleanups

changes since RFC:
  * add early param to make features opt-in
  * simplify CPU_ON/SUSPEND implementation
  * replace spinlocks with CAS atomic
  * make cpu_logical_map ro_after_init

David Brazdil (26):
  kvm: arm64: Add kvm-arm.mode early kernel parameter
  kvm: arm64: Add ARM64_KVM_PROTECTED_MODE CPU capability
  psci: Support psci_ops.get_version for v0.1
  psci: Split functions to v0.1 and v0.2+ variants
  psci: Replace psci_function_id array with a struct
  psci: Add accessor for psci_0_1_function_ids
  arm64: Make cpu_logical_map() take unsigned int
  arm64: Extract parts of el2_setup into a macro
  kvm: arm64: Remove vector_ptr param of hyp-init
  kvm: arm64: Move hyp-init params to a per-CPU struct
  kvm: arm64: Init MAIR/TCR_EL2 from params struct
  kvm: arm64: Add .hyp.data..ro_after_init ELF section
  kvm: arm64: Support per_cpu_ptr in nVHE hyp code
  kvm: arm64: Create nVHE copy of cpu_logical_map
  kvm: arm64: Add SMC handler in nVHE EL2
  kvm: arm64: Bootstrap PSCI SMC handler in nVHE EL2
  kvm: arm64: Add offset for hyp VA <-> PA conversion
  kvm: arm64: Forward safe PSCI SMCs coming from host
  kvm: arm64: Extract __do_hyp_init into a helper function
  kvm: arm64: Add function to enter host from KVM nVHE hyp code
  kvm: arm64: Intercept host's CPU_ON SMCs
  kvm: arm64: Intercept host's CPU_SUSPEND PSCI SMCs
  kvm: arm64: Intercept host's SYSTEM_SUSPEND PSCI SMCs
  kvm: arm64: Keep nVHE EL2 vector installed
  kvm: arm64: Trap host SMCs in protected mode
  kvm: arm64: Fix EL2 mode availability checks

 .../admin-guide/kernel-parameters.txt         |  10 +
 arch/arm64/include/asm/cpucaps.h              |   3 +-
 arch/arm64/include/asm/el2_setup.h            | 182 ++++++++++
 arch/arm64/include/asm/kvm_arm.h              |   1 +
 arch/arm64/include/asm/kvm_asm.h              |  10 +-
 arch/arm64/include/asm/kvm_host.h             |  10 +
 arch/arm64/include/asm/kvm_hyp.h              |   4 +-
 arch/arm64/include/asm/kvm_mmu.h              |  24 ++
 arch/arm64/include/asm/percpu.h               |   6 +
 arch/arm64/include/asm/sections.h             |   1 +
 arch/arm64/include/asm/smp.h                  |   4 +-
 arch/arm64/include/asm/virt.h                 |  26 ++
 arch/arm64/kernel/asm-offsets.c               |   5 +
 arch/arm64/kernel/cpufeature.c                |  22 ++
 arch/arm64/kernel/head.S                      | 144 +-------
 arch/arm64/kernel/image-vars.h                |   6 +-
 arch/arm64/kernel/setup.c                     |   2 +-
 arch/arm64/kernel/vmlinux.lds.S               |  10 +
 arch/arm64/kvm/arm.c                          | 139 +++++++-
 .../arm64/kvm/hyp/include/nvhe/trap_handler.h |  18 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |   3 +-
 arch/arm64/kvm/hyp/nvhe/host.S                |  47 +++
 arch/arm64/kvm/hyp/nvhe/hyp-init.S            | 152 +++++---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  45 ++-
 arch/arm64/kvm/hyp/nvhe/hyp-smp.c             |  40 +++
 arch/arm64/kvm/hyp/nvhe/hyp.lds.S             |   1 +
 arch/arm64/kvm/hyp/nvhe/psci-relay.c          | 324 ++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/switch.c              |   5 +-
 arch/arm64/kvm/va_layout.c                    |  30 +-
 drivers/firmware/psci/psci.c                  | 126 ++++---
 include/linux/psci.h                          |   9 +
 31 files changed, 1150 insertions(+), 259 deletions(-)
 create mode 100644 arch/arm64/include/asm/el2_setup.h
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/hyp-smp.c
 create mode 100644 arch/arm64/kvm/hyp/nvhe/psci-relay.c

--
2.29.2.454.gaff20da3a2-goog
