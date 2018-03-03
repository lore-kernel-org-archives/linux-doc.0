Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DATE_IN_FUTURE_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E275E7E281
	for <lwn-linux-doc@archive.lwn.net>; Sat,  3 Mar 2018 08:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751950AbeCCIED (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 3 Mar 2018 03:04:03 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:5702 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751811AbeCCID7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 3 Mar 2018 03:03:59 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id DBA3E8E41A79B;
        Sat,  3 Mar 2018 16:03:41 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.361.1; Sat, 3 Mar 2018 16:03:37 +0800
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
Subject: [PATCH v10 1/5] arm64: KVM: Prepare set virtual SEI syndrome value
Date:   Sun, 4 Mar 2018 00:09:36 +0800
Message-ID: <1520093380-42577-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1520093380-42577-1-git-send-email-gengdongjiu@huawei.com>
References: <1520093380-42577-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Export one API to specify virtual SEI syndrome value
for guest, and add a helper to get the VSESR_EL2 value.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 5 +++++
 arch/arm64/include/asm/kvm_host.h    | 2 ++
 arch/arm64/kvm/inject_fault.c        | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 413dc82..3294885 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -71,6 +71,11 @@ static inline void vcpu_set_hcr(struct kvm_vcpu *vcpu, unsigned long hcr)
 	vcpu->arch.hcr_el2 = hcr;
 }
 
+static inline unsigned long vcpu_get_vsesr(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.vsesr_el2;
+}
+
 static inline void vcpu_set_vsesr(struct kvm_vcpu *vcpu, u64 vsesr)
 {
 	vcpu->arch.vsesr_el2 = vsesr;
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index a73f63a..3dc49b7 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -354,6 +354,8 @@ void handle_exit_early(struct kvm_vcpu *vcpu, struct kvm_run *run,
 int kvm_perf_init(void);
 int kvm_perf_teardown(void);
 
+void kvm_set_sei_esr(struct kvm_vcpu *vcpu, u64 syndrome);
+
 struct kvm_vcpu *kvm_mpidr_to_vcpu(struct kvm *kvm, unsigned long mpidr);
 
 static inline void __cpu_init_hyp_mode(phys_addr_t pgd_ptr,
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 60666a0..78ecb28 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -186,3 +186,8 @@ void kvm_inject_vabt(struct kvm_vcpu *vcpu)
 {
 	pend_guest_serror(vcpu, ESR_ELx_ISV);
 }
+
+void kvm_set_sei_esr(struct kvm_vcpu *vcpu, u64 syndrome)
+{
+	pend_guest_serror(vcpu, syndrome & ESR_ELx_ISS_MASK);
+}
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
