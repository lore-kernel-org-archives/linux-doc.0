Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5C5A87D043
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Jul 2018 13:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752165AbeGBNka (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Jul 2018 09:40:30 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:57338 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751922AbeGBNk3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Jul 2018 09:40:29 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 8AC2889C52AEB;
        Mon,  2 Jul 2018 21:40:25 +0800 (CST)
Received: from localhost.localdomain (10.143.28.91) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.382.0; Mon, 2 Jul 2018 21:40:18 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <rkrcmar@redhat.com>, <corbet@lwn.net>, <christoffer.dall@arm.com>,
        <marc.zyngier@arm.com>, <catalin.marinas@arm.com>,
        <will.deacon@arm.com>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>
CC:     <gengdongjiu@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v6 0/2] support exception state migration and set VSESR_EL2 by user space
Date:   Mon, 2 Jul 2018 21:40:13 +0800
Message-ID: <1530538815-3847-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.91]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series patch is separated from https://www.spinics.net/lists/kvm/msg168917.html

1. Detect whether KVM can set set guest SError syndrome
2. Support to Set VSESR_EL2 and inject SError by user space.
3. Support live migration to keep SError pending state and VSESR_EL2 value

The user space patch is here: https://www.mail-archive.com/qemu-devel@nongnu.org/msg539534.html
BTW: The user space patch is needed to rebase


Dongjiu Geng (2):
  arm/arm64: KVM: Add KVM_GET/SET_VCPU_EVENTS
  arm64: KVM: export the capability to set guest SError syndrome

 Documentation/virtual/kvm/api.txt    | 44 ++++++++++++++++++++++++++++++----
 arch/arm64/include/asm/kvm_emulate.h |  5 ++++
 arch/arm64/include/asm/kvm_host.h    |  7 ++++++
 arch/arm64/include/uapi/asm/kvm.h    | 13 ++++++++++
 arch/arm64/kvm/guest.c               | 46 ++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/inject_fault.c        |  6 ++---
 arch/arm64/kvm/reset.c               |  4 ++++
 include/uapi/linux/kvm.h             |  1 +
 virt/kvm/arm/arm.c                   | 21 ++++++++++++++++
 9 files changed, 140 insertions(+), 7 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
