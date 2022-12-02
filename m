Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DA5C4167B
	for <linux-doc@archiver.kernel.org>; Fri,  2 Dec 2022 10:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbiLBKvo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 05:51:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233241AbiLBKvd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 05:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08C0CF79E
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 02:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669978235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+/LEkekaTEo+dH48I9BDoWLnS9MzBRMjobxYQkKyym4=;
        b=TWSaEtZKfv0jB1NYokVAqzRYl3mL0toDHGfSexss9UulwwMMWMxoeOAK2vCY6gs4CT1vpn
        uXDbUkx2kR9RYNAvUzjizmuUKa0pLcOIg6syo8I/ZKZH3tkXpFwK1gxR0tWLanvEOEjyGk
        5OyBXPGtmjVsj5YmkUPpYHVts3jaGiw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-cJeY0a_AM0CDq5M-fQT-Rg-1; Fri, 02 Dec 2022 05:50:28 -0500
X-MC-Unique: cJeY0a_AM0CDq5M-fQT-Rg-1
Received: by mail-wm1-f69.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso2322902wmb.4
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 02:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/LEkekaTEo+dH48I9BDoWLnS9MzBRMjobxYQkKyym4=;
        b=Pw1oJjcnuM0kRkUjFl50kqcibVhmIAaUrKe7WB4wnDIVTrHRAyA9Ou1ripFIhgvay/
         ZVg3wwpoHyIk98bZQdnyDCmDQr+MJ2GrZqoqCLF3FSTOo4vBpCEMNlElUXODqxjRZPon
         YGppVAQc2p7rysCFRA7K1X/ZlWTJTT0dSXvkYj/rNgLmA++lik3z4eX5pSGRIPwoOaFG
         RkgSN2B1h9yGKIEa1HqRKqsIAsdzLqrcv8MayuCvYxo8S7mnqpAqA5KjFzrmQAWOAlJB
         vuIzGkpwBr/yzIZZMWj50qIRz+k8TVC0YrixAuUPBh+JuSJHLJVvmKLZIl2iF/iUVRPn
         IMRQ==
X-Gm-Message-State: ANoB5pl/BDJZZWyWwt43FsmzLEi7DbwDOQDp4eceJgvvgqB1PVK0CL0o
        3Od5kfry31+klsZz82FDMU/RfCxJ8yCd6vFgApna4SmWQzMuX/5j7tpNsj4AhliG1RVsO/9P5ho
        6pOJV/LGhleTsCWHNymXX
X-Received: by 2002:a1c:2743:0:b0:3c6:e471:7400 with SMTP id n64-20020a1c2743000000b003c6e4717400mr38026466wmn.98.1669978227532;
        Fri, 02 Dec 2022 02:50:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6LRw+Q5h08VxPWoFG1o+HyiLNocv2IiuqIXrVvaQwPWzbHSZnbDyo9D+lrAYgNTlYhm9tRrQ==
X-Received: by 2002:a1c:2743:0:b0:3c6:e471:7400 with SMTP id n64-20020a1c2743000000b003c6e4717400mr38026452wmn.98.1669978227323;
        Fri, 02 Dec 2022 02:50:27 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b003a3170a7af9sm9728818wmb.4.2022.12.02.02.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 02:50:26 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sergio Lopez Pascual <slp@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jing Liu <jing2.liu@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wei Wang <wei.w.wang@intel.com>,
        Yang Zhong <yang.zhong@intel.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, x86@kernel.org
Subject: [PATCH v2 2/4] KVM: Delete all references to removed KVM_SET_MEMORY_ALIAS ioctl
Date:   Fri,  2 Dec 2022 11:50:09 +0100
Message-Id: <20221202105011.185147-3-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202105011.185147-1-javierm@redhat.com>
References: <20221202105011.185147-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documentation says that the ioctl has been deprecated, but it has been
actually removed and the remaining references are just left overs.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 Documentation/virt/kvm/api.rst        | 11 -----------
 arch/x86/include/uapi/asm/kvm.h       |  8 --------
 include/uapi/linux/kvm.h              |  2 --
 tools/arch/x86/include/uapi/asm/kvm.h |  8 --------
 tools/include/uapi/linux/kvm.h        |  2 --
 5 files changed, 31 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 54af33645df3..85a5b12eb017 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -356,17 +356,6 @@ see the description of the capability.
 Note that the Xen shared info page, if configured, shall always be assumed
 to be dirty. KVM will not explicitly mark it such.
 
-4.9 KVM_SET_MEMORY_ALIAS
-------------------------
-
-:Capability: basic
-:Architectures: x86
-:Type: vm ioctl
-:Parameters: struct kvm_memory_alias (in)
-:Returns: 0 (success), -1 (error)
-
-This ioctl is obsolete and has been removed.
-
 
 4.10 KVM_RUN
 ------------
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 46de10a809ec..649e50a8f9dd 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -53,14 +53,6 @@
 /* Architectural interrupt line count. */
 #define KVM_NR_INTERRUPTS 256
 
-struct kvm_memory_alias {
-	__u32 slot;  /* this has a different namespace than memory slots */
-	__u32 flags;
-	__u64 guest_phys_addr;
-	__u64 memory_size;
-	__u64 target_phys_addr;
-};
-
 /* for KVM_GET_IRQCHIP and KVM_SET_IRQCHIP */
 struct kvm_pic_state {
 	__u8 last_irr;	/* edge detection */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 8899201d5964..6ba2928f8f18 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1435,8 +1435,6 @@ struct kvm_vfio_spapr_tce {
  */
 #define KVM_CREATE_VCPU           _IO(KVMIO,   0x41)
 #define KVM_GET_DIRTY_LOG         _IOW(KVMIO,  0x42, struct kvm_dirty_log)
-/* KVM_SET_MEMORY_ALIAS is obsolete: */
-#define KVM_SET_MEMORY_ALIAS      _IOW(KVMIO,  0x43, struct kvm_memory_alias)
 #define KVM_SET_NR_MMU_PAGES      _IO(KVMIO,   0x44)
 #define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)
 #define KVM_SET_USER_MEMORY_REGION _IOW(KVMIO, 0x46, \
diff --git a/tools/arch/x86/include/uapi/asm/kvm.h b/tools/arch/x86/include/uapi/asm/kvm.h
index 46de10a809ec..649e50a8f9dd 100644
--- a/tools/arch/x86/include/uapi/asm/kvm.h
+++ b/tools/arch/x86/include/uapi/asm/kvm.h
@@ -53,14 +53,6 @@
 /* Architectural interrupt line count. */
 #define KVM_NR_INTERRUPTS 256
 
-struct kvm_memory_alias {
-	__u32 slot;  /* this has a different namespace than memory slots */
-	__u32 flags;
-	__u64 guest_phys_addr;
-	__u64 memory_size;
-	__u64 target_phys_addr;
-};
-
 /* for KVM_GET_IRQCHIP and KVM_SET_IRQCHIP */
 struct kvm_pic_state {
 	__u8 last_irr;	/* edge detection */
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index 8899201d5964..6ba2928f8f18 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -1435,8 +1435,6 @@ struct kvm_vfio_spapr_tce {
  */
 #define KVM_CREATE_VCPU           _IO(KVMIO,   0x41)
 #define KVM_GET_DIRTY_LOG         _IOW(KVMIO,  0x42, struct kvm_dirty_log)
-/* KVM_SET_MEMORY_ALIAS is obsolete: */
-#define KVM_SET_MEMORY_ALIAS      _IOW(KVMIO,  0x43, struct kvm_memory_alias)
 #define KVM_SET_NR_MMU_PAGES      _IO(KVMIO,   0x44)
 #define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)
 #define KVM_SET_USER_MEMORY_REGION _IOW(KVMIO, 0x46, \
-- 
2.38.1

