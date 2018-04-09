Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DATE_IN_FUTURE_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A56617E86A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 13:33:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751875AbeDINbN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 09:31:13 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7162 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751652AbeDINbM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Apr 2018 09:31:12 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 89E62E10076A2;
        Mon,  9 Apr 2018 21:30:56 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Mon, 9 Apr 2018 21:30:52 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <rkrcmar@redhat.com>, <corbet@lwn.net>,
        <christoffer.dall@linaro.org>, <marc.zyngier@arm.com>,
        <james.morse@arm.com>, <linux@armlinux.org.uk>,
        <catalin.marinas@arm.com>, <rjw@rjwysocki.net>, <bp@alien8.de>,
        <lenb@kernel.org>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-acpi@vger.kernel.org>,
        <devel@acpica.org>
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
        <zhengxiang9@huawei.com>
Subject: [PATCH v11 0/4] set VSESR_EL2 by user space and support NOTIFY_SEI notification
Date:   Tue, 10 Apr 2018 05:36:32 +0800
Message-ID: <1523309796-36423-1-git-send-email-gengdongjiu@huawei.com>
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

 Documentation/virtual/kvm/api.txt    | 39 ++++++++++++++++++++++++--
 arch/arm/include/asm/kvm_host.h      |  6 ++++
 arch/arm/kvm/guest.c                 | 12 ++++++++
 arch/arm64/include/asm/kvm_emulate.h |  5 ++++
 arch/arm64/include/asm/kvm_host.h    |  7 +++++
 arch/arm64/include/asm/system_misc.h |  1 +
 arch/arm64/include/uapi/asm/kvm.h    | 12 ++++++++
 arch/arm64/kernel/traps.c            |  4 +++
 arch/arm64/kvm/guest.c               | 31 +++++++++++++++++++++
 arch/arm64/kvm/inject_fault.c        |  7 ++++-
 arch/arm64/kvm/reset.c               |  4 +++
 arch/arm64/mm/fault.c                | 10 +++++++
 drivers/acpi/apei/Kconfig            | 15 ++++++++++
 drivers/acpi/apei/ghes.c             | 53 ++++++++++++++++++++++++++++++++++++
 include/acpi/ghes.h                  |  1 +
 include/uapi/linux/kvm.h             |  1 +
 virt/kvm/arm/arm.c                   | 21 ++++++++++++++
 17 files changed, 226 insertions(+), 3 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
