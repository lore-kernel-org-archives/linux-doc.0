Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DATE_IN_FUTURE_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B1EEB7E282
	for <lwn-linux-doc@archive.lwn.net>; Sat,  3 Mar 2018 08:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751825AbeCCIDu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 3 Mar 2018 03:03:50 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:43826 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751814AbeCCIDt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 3 Mar 2018 03:03:49 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 02D146B7A0E62;
        Sat,  3 Mar 2018 16:03:42 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.361.1; Sat, 3 Mar 2018 16:03:36 +0800
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
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>
Subject: [PATCH v10 0/5] set VSESR_EL2 by user space and support NOTIFY_SEI notification
Date:   Sun, 4 Mar 2018 00:09:35 +0800
Message-ID: <1520093380-42577-1-git-send-email-gengdongjiu@huawei.com>
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

Dongjiu Geng (5):
  arm64: KVM: Prepare set virtual SEI syndrome value
  arm64: KVM: export the capability to set guest SError syndrome
  arm/arm64: KVM: Introduce set and get per-vcpu event
  ACPI / APEI: Add SEI notification type support for ARMv8
  arm64: handle NOTIFY_SEI notification by the APEI driver

 Documentation/virtual/kvm/api.txt    | 37 +++++++++++++++++++++++--
 arch/arm/include/asm/kvm_host.h      |  6 ++++
 arch/arm/kvm/guest.c                 | 12 ++++++++
 arch/arm64/include/asm/kvm_emulate.h |  5 ++++
 arch/arm64/include/asm/kvm_host.h    |  7 +++++
 arch/arm64/include/asm/system_misc.h |  1 +
 arch/arm64/include/uapi/asm/kvm.h    | 10 +++++++
 arch/arm64/kernel/traps.c            |  4 +++
 arch/arm64/kvm/guest.c               | 26 ++++++++++++++++++
 arch/arm64/kvm/inject_fault.c        |  5 ++++
 arch/arm64/kvm/reset.c               |  4 +++
 arch/arm64/mm/fault.c                | 10 +++++++
 drivers/acpi/apei/Kconfig            | 15 ++++++++++
 drivers/acpi/apei/ghes.c             | 53 ++++++++++++++++++++++++++++++++++++
 include/acpi/ghes.h                  |  1 +
 include/uapi/linux/kvm.h             |  1 +
 virt/kvm/arm/arm.c                   | 18 ++++++++++++
 17 files changed, 213 insertions(+), 2 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
