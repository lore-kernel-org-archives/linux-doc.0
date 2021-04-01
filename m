Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2549C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:28:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3C5060C3E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:28:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234844AbhDAS2d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26433 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234733AbhDASVV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 14:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617301280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fSbJrig4iz7fFdIqz/+PkiSD1b/Ef+DRDQQn1jp3epQ=;
        b=EOKOXxl0ekhVQok0LoQ7+kRlTmujrUPUj4jw+zzBsm9Xiq/MZIBbLTaSFELoVHVe4adIV0
        6m5qhES4lf59wV0ZVXjl3TCMS+JBqYjt8/PRlcdwPEhU7Rru78N4nPJwtVnZiAMUdhrTOS
        RygvEBAjsSMwxVU+PSgXxNo/MHripLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-ln_fDGI4OYu4rSztEZz3TQ-1; Thu, 01 Apr 2021 10:19:00 -0400
X-MC-Unique: ln_fDGI4OYu4rSztEZz3TQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7687A835BD9;
        Thu,  1 Apr 2021 14:18:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.58])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B53D359469;
        Thu,  1 Apr 2021 14:18:39 +0000 (UTC)
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     kvm@vger.kernel.org
Cc:     x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
        Jim Mattson <jmattson@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Sean Christopherson <seanjc@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND
        64-BIT)), Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH 5/6] KVM: nSVM: avoid loading PDPTRs after migration when possible
Date:   Thu,  1 Apr 2021 17:18:13 +0300
Message-Id: <20210401141814.1029036-6-mlevitsk@redhat.com>
In-Reply-To: <20210401141814.1029036-1-mlevitsk@redhat.com>
References: <20210401141814.1029036-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

if new KVM_*_SREGS2 ioctls are used, the PDPTRs are
part of the migration state and thus are loaded
by those ioctls.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/nested.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index ac5e3e17bda4..b94916548cfa 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -373,10 +373,9 @@ static int nested_svm_load_cr3(struct kvm_vcpu *vcpu, unsigned long cr3,
 		return -EINVAL;
 
 	if (!nested_npt && is_pae_paging(vcpu) &&
-	    (cr3 != kvm_read_cr3(vcpu) || pdptrs_changed(vcpu))) {
+	    (cr3 != kvm_read_cr3(vcpu) || !kvm_register_is_available(vcpu, VCPU_EXREG_PDPTR)))
 		if (CC(!load_pdptrs(vcpu, vcpu->arch.walk_mmu, cr3)))
 			return -EINVAL;
-	}
 
 	/*
 	 * TODO: optimize unconditional TLB flush/MMU sync here and in
@@ -552,6 +551,8 @@ int enter_svm_guest_mode(struct kvm_vcpu *vcpu, u64 vmcb12_gpa,
 	nested_vmcb02_prepare_control(svm);
 	nested_vmcb02_prepare_save(svm, vmcb12);
 
+	kvm_register_clear_available(&svm->vcpu, VCPU_EXREG_PDPTR);
+
 	ret = nested_svm_load_cr3(&svm->vcpu, vmcb12->save.cr3,
 				  nested_npt_enabled(svm));
 	if (ret)
@@ -779,6 +780,8 @@ int nested_svm_vmexit(struct vcpu_svm *svm)
 
 	nested_svm_uninit_mmu_context(vcpu);
 
+	kvm_register_clear_available(&svm->vcpu, VCPU_EXREG_PDPTR);
+
 	rc = nested_svm_load_cr3(vcpu, svm->vmcb->save.cr3, false);
 	if (rc)
 		return 1;
@@ -1301,6 +1304,14 @@ static bool svm_get_nested_state_pages(struct kvm_vcpu *vcpu)
 	if (WARN_ON(!is_guest_mode(vcpu)))
 		return true;
 
+	if (vcpu->arch.reload_pdptrs_on_nested_entry) {
+		/* If legacy KVM_SET_SREGS API was used, it might have
+		 * loaded wrong PDPTRs from memory so we have to reload
+		 * them here (which is against x86 spec)
+		 */
+		kvm_register_clear_available(vcpu, VCPU_EXREG_PDPTR);
+	}
+
 	if (nested_svm_load_cr3(&svm->vcpu, vcpu->arch.cr3,
 				nested_npt_enabled(svm)))
 		return false;
-- 
2.26.2

