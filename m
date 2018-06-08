Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DATE_IN_FUTURE_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C1AF7D085
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Jun 2018 11:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751549AbeFHLnm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Jun 2018 07:43:42 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:8655 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751466AbeFHLnl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Jun 2018 07:43:41 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 67B809AFA0F50;
        Fri,  8 Jun 2018 19:43:26 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.382.0; Fri, 8 Jun 2018 19:43:18 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <rkrcmar@redhat.com>, <corbet@lwn.net>, <christoffer.dall@arm.com>,
        <marc.zyngier@arm.com>, <linux@armlinux.org.uk>,
        <catalin.marinas@arm.com>, <will.deacon@arm.com>,
        <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <james.morse@arm.com>, <gengdongjiu@huawei.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>
Subject: [PATCH RESEND v4 1/2] arm64: KVM: export the capability to set guest SError syndrome
Date:   Sat, 9 Jun 2018 03:48:39 +0800
Message-ID: <1528487320-2873-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528487320-2873-1-git-send-email-gengdongjiu@huawei.com>
References: <1528487320-2873-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For the arm64 RAS Extension, user space can inject a virtual-SError
with specified ESR. So user space needs to know whether KVM support
to inject such SError, this interface adds this query for this capability.

KVM will check whether system support RAS Extension, if supported, KVM
returns true to user space, otherwise returns false.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Reviewed-by: James Morse <james.morse@arm.com>
---
 Documentation/virtual/kvm/api.txt | 11 +++++++++++
 arch/arm64/kvm/reset.c            |  3 +++
 include/uapi/linux/kvm.h          |  1 +
 3 files changed, 15 insertions(+)

diff --git a/Documentation/virtual/kvm/api.txt b/Documentation/virtual/kvm/api.txt
index 758bf40..fdac969 100644
--- a/Documentation/virtual/kvm/api.txt
+++ b/Documentation/virtual/kvm/api.txt
@@ -4603,3 +4603,14 @@ Architectures: s390
 This capability indicates that kvm will implement the interfaces to handle
 reset, migration and nested KVM for branch prediction blocking. The stfle
 facility 82 should not be provided to the guest without this capability.
+
+8.14 KVM_CAP_ARM_SET_SERROR_ESR
+
+Architectures: arm, arm64
+
+This capability indicates that userspace can specify the syndrome value reported
+to the guest OS when guest takes a virtual SError interrupt exception.
+If KVM has this capability, userspace can only specify the ISS field for the ESR
+syndrome, it can not specify the EC field which is not under control by KVM.
+If this virtual SError is taken to EL1 using AArch64, this value will be reported
+in ISS filed of ESR_EL1.
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 3256b92..38c8a64 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -77,6 +77,9 @@ int kvm_arch_dev_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PMU_V3:
 		r = kvm_arm_support_pmu_v3();
 		break;
+	case KVM_CAP_ARM_INJECT_SERROR_ESR:
+		r = cpus_have_const_cap(ARM64_HAS_RAS_EXTN);
+		break;
 	case KVM_CAP_SET_GUEST_DEBUG:
 	case KVM_CAP_VCPU_ATTRIBUTES:
 		r = 1;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index b02c41e..e88f976 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -948,6 +948,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_S390_BPB 152
 #define KVM_CAP_GET_MSR_FEATURES 153
 #define KVM_CAP_HYPERV_EVENTFD 154
+#define KVM_CAP_ARM_INJECT_SERROR_ESR 155
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
