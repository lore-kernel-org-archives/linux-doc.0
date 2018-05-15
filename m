Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DATE_IN_FUTURE_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 934FE7D085
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 May 2018 12:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752897AbeEOMwy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 May 2018 08:52:54 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7252 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752135AbeEOMwv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 May 2018 08:52:51 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E4D4ABD545022;
        Tue, 15 May 2018 20:52:34 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.382.0; Tue, 15 May 2018 20:52:26 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <rkrcmar@redhat.com>, <corbet@lwn.net>, <christoffer.dall@arm.com>,
        <marc.zyngier@arm.com>, <james.morse@arm.com>,
        <linux@armlinux.org.uk>, <catalin.marinas@arm.com>,
        <rjw@rjwysocki.net>, <bp@alien8.de>, <lenb@kernel.org>,
        <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-acpi@vger.kernel.org>,
        <devel@acpica.org>
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
        <zhengxiang9@huawei.com>
Subject: [PATCH v12 0/4] set VSESR_EL2 by user space and support NOTIFY_SEI notification
Date:   Wed, 16 May 2018 04:58:03 +0800
Message-ID: <1526417887-25843-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

1. Detect whether KVM can set set guest SError syndrome
2. Support to Set VSESR_EL2 and inject SError by user space.
3. Support live migration to keep SError pending state and VSESR_EL2 value.
4. ACPI 6.1 adds support for NOTIFY_SEI as a GHES notification mechanism, so support this
   notification in software, KVM or kernel ARCH code call handle_guest_sei() to let ACP driver
   to handle this notification.

Change since V11:
Address James's comments, thanks James
1. Align the struct of kvm_vcpu_events to 64 bytes
2. Avoid exposing the stale ESR value in the kvm_arm_vcpu_get_events()
3. Change variables 'injected' name to 'serror_pending' in the kvm_arm_vcpu_set_events()
4. Change to sizeof(events) from sizeof(struct kvm_vcpu_events) in kvm_arch_vcpu_ioctl()
5. Update the patches commit message and document description


Change since V10:
Address James's comments, thanks James
1. Merge the helper function with the user.
2. Move the ISS_MASK into pend_guest_serror() to clear top bits
3. Make kvm_vcpu_events struct align to 4 bytes
4. Add something check in the kvm_arm_vcpu_set_events()
5. Check kvm_arm_vcpu_get/set_events()'s return value.
6. Initialise kvm_vcpu_events to 0 so that padding transferred to user-space doesn't
    contain kernel stack.


Dongjiu Geng (4):
  arm64: KVM: export the capability to set guest SError syndrome
  arm/arm64: KVM: Add KVM_GET/SET_VCPU_EVENTS
  ACPI / APEI: Add SEI notification type support for ARMv8
  arm64: handle NOTIFY_SEI notification by the APEI driver

 Documentation/virtual/kvm/api.txt    | 42 ++++++++++++++++++++++++++--
 arch/arm/include/asm/kvm_host.h      |  6 ++++
 arch/arm/kvm/guest.c                 | 12 ++++++++
 arch/arm64/include/asm/kvm_emulate.h |  5 ++++
 arch/arm64/include/asm/kvm_host.h    |  7 +++++
 arch/arm64/include/asm/system_misc.h |  1 +
 arch/arm64/include/uapi/asm/kvm.h    | 13 +++++++++
 arch/arm64/kernel/traps.c            |  4 +++
 arch/arm64/kvm/guest.c               | 36 ++++++++++++++++++++++++
 arch/arm64/kvm/inject_fault.c        |  7 ++++-
 arch/arm64/kvm/reset.c               |  4 +++
 arch/arm64/mm/fault.c                | 10 +++++++
 drivers/acpi/apei/Kconfig            | 15 ++++++++++
 drivers/acpi/apei/ghes.c             | 53 ++++++++++++++++++++++++++++++++++++
 include/acpi/ghes.h                  |  1 +
 include/uapi/linux/kvm.h             |  1 +
 virt/kvm/arm/arm.c                   | 21 ++++++++++++++
 17 files changed, 234 insertions(+), 4 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
