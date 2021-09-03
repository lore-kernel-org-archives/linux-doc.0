Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5FDC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Sep 2021 13:08:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3704560E52
	for <linux-doc@archiver.kernel.org>; Fri,  3 Sep 2021 13:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349407AbhICNJ1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Sep 2021 09:09:27 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:36486 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhICNJ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Sep 2021 09:09:27 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7E4AD226F0;
        Fri,  3 Sep 2021 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1630674506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=NN5HIyhd2hnMW2pPqHYMruB3Bj3fGyUnsWK7Hj00imw=;
        b=T6lLGd6FQmb5ouXURJN/wpryYuxVyDYwFIXSM5ovqZU54Zy7M5ma6Mo9+sCnCBUy9rnA2y
        B1RFvgVp76vfG6u/8j7GCV8SVom0jO5vLkNpBSOJYRirwRZwHOpSqDORiG15hcaHLLMD+9
        aaEe5Z5h7+o8DLK+z5EBLnk6ybOdLxE=
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id BDFEF137D4;
        Fri,  3 Sep 2021 13:08:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id MJjBLEkeMmHYOAAAGKfGzw
        (envelope-from <jgross@suse.com>); Fri, 03 Sep 2021 13:08:25 +0000
From:   Juergen Gross <jgross@suse.com>
To:     kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     maz@kernel.org, ehabkost@redhat.com,
        Juergen Gross <jgross@suse.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu
Subject: [PATCH v2 0/6] x86/kvm: add boot parameters for max vcpu configs
Date:   Fri,  3 Sep 2021 15:08:01 +0200
Message-Id: <20210903130808.30142-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to be able to have a single kernel for supporting even huge
numbers of vcpus per guest some arrays should be sized dynamically.

The easiest way to do that is to add boot parameters for the maximum
number of vcpus and to calculate the maximum vcpu-id from that using
either the host topology or a topology hint via another boot parameter.

This patch series is doing that for x86. The same scheme can be easily
adapted to other architectures, but I don't want to do that in the
first iteration.

In the long term I'd suggest to have a per-guest setting of the two
parameters allowing to spare some memory for smaller guests. OTOH this
would require new ioctl()s and respective qemu modifications, so I let
those away for now.

I've tested the series not to break normal guest operation and the new
parameters to be effective on x86. For Arm64 I did a compile test only.

Changes in V2:
- removed old patch 1, as already applied
- patch 1 (old patch 2) only for reference, as the patch is already in
  the kvm tree
- switch patch 2 (old patch 3) to calculate vcpu-id
- added patch 4

Juergen Gross (6):
  x86/kvm: remove non-x86 stuff from arch/x86/kvm/ioapic.h
  x86/kvm: add boot parameter for adding vcpu-id bits
  x86/kvm: introduce per cpu vcpu masks
  kvm: use kvfree() in kvm_arch_free_vm()
  kvm: allocate vcpu pointer array separately
  x86/kvm: add boot parameter for setting max number of vcpus per guest

 .../admin-guide/kernel-parameters.txt         | 25 ++++++
 arch/arm64/include/asm/kvm_host.h             |  1 -
 arch/arm64/kvm/arm.c                          | 23 ++++--
 arch/x86/include/asm/kvm_host.h               | 26 +++++--
 arch/x86/kvm/hyperv.c                         | 25 ++++--
 arch/x86/kvm/ioapic.c                         | 12 ++-
 arch/x86/kvm/ioapic.h                         |  8 +-
 arch/x86/kvm/irq_comm.c                       |  9 ++-
 arch/x86/kvm/x86.c                            | 78 ++++++++++++++++++-
 include/linux/kvm_host.h                      | 26 ++++++-
 10 files changed, 198 insertions(+), 35 deletions(-)

-- 
2.26.2

