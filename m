Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6863FC43461
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 11:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3286E61131
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 11:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbhDZLPE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 07:15:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51701 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233189AbhDZLPC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 07:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619435660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J6QpiXrmkz74Z5aFxXMspDWckRqkg6aIoMxgiuYm/ss=;
        b=W4MFRqUSUVt/dFMf3Zv+bpR39yj+eEPGN361NiIBkGp/48ASbApXzMDbBmkF9OaljzJQYQ
        kJnGdKwelN0C8rnt0qYgr/gsQ2KkojvME8El0SJRlYFCvH/E09pGrqeMMF1Gh4PNr94evG
        vMN73VYrS/NmMnIKqFkDNCkVsWMZgb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-oHRwvXoNOX6AZc-KWGmTSA-1; Mon, 26 Apr 2021 07:14:18 -0400
X-MC-Unique: oHRwvXoNOX6AZc-KWGmTSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B59610CE780;
        Mon, 26 Apr 2021 11:14:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.73])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DA21A5D9D0;
        Mon, 26 Apr 2021 11:14:01 +0000 (UTC)
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     kvm@vger.kernel.org
Cc:     linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
        linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND
        64-BIT)), "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH v2 5/6] KVM: nSVM: avoid loading PDPTRs after migration when possible
Date:   Mon, 26 Apr 2021 14:13:32 +0300
Message-Id: <20210426111333.967729-6-mlevitsk@redhat.com>
In-Reply-To: <20210426111333.967729-1-mlevitsk@redhat.com>
References: <20210426111333.967729-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

if new KVM_*_SREGS2 ioctls are used, the PDPTRs are
a part of the migration state and are correctly
restored by those ioctls.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/nested.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index ceb37ed1dc98..9624fa81e830 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1356,7 +1356,8 @@ static bool svm_get_nested_state_pages(struct kvm_vcpu *vcpu)
 	if (WARN_ON(!is_guest_mode(vcpu)))
 		return true;
 
-	if (!nested_npt_enabled(svm) && is_pae_paging(vcpu))
+	if (vcpu->arch.pdptr_reload_on_nesting_needed &&
+	    !nested_npt_enabled(svm) && is_pae_paging(vcpu))
 		/*
 		 * Reload the guest's PDPTRs since after a migration
 		 * the guest CR3 might be restored prior to setting the nested
-- 
2.26.2

