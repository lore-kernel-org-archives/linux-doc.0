Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964C4C636F8
	for <linux-doc@archiver.kernel.org>; Fri,  2 Dec 2022 10:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233276AbiLBKvf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 05:51:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232766AbiLBKv0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 05:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEA3CFE77
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 02:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669978228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e/WSDhCff5cI0oKVC2xG/rXWZdwpVxH3SgK+Cp6160A=;
        b=XrynmiK0wza+XQ3T3lCIYUWuee97+OOYwa2q/Q/9J0fkr6i+Tl6nJOw9MDHjbVRasqzoE+
        vOjdrVond2KMUkhacDfGA7Ty3slAPpJwaKWDRTfxVIwl+wN+q3ZZM5k0j53gujPhG42VQ9
        1CAX77zMZBAdGyB2NbjSFQr+z3NW4Ng=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-ebU7uHyWPfqscWzgm4U5WA-1; Fri, 02 Dec 2022 05:50:27 -0500
X-MC-Unique: ebU7uHyWPfqscWzgm4U5WA-1
Received: by mail-wr1-f71.google.com with SMTP id v14-20020adf8b4e000000b0024174021277so985855wra.13
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 02:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/WSDhCff5cI0oKVC2xG/rXWZdwpVxH3SgK+Cp6160A=;
        b=mgpXm70rRZX8MRehK8eFpJ1ATf+PyGR3v7bfV9sLBjF1jb6LqO/mXt9UT+pScRvsmH
         YyeMaLYg68+qaedZd6PyE2atbZdO+aVM+b04QAxcxKav5K407M5m7Rb3S5biCEsPZqG4
         Bs5aqTzD3kVF6KDr5mhzy8nF27Tqi7Zv4sN5emJbSJt8j3ri58aJ/XtrgTP5AcrB3llz
         DGo77NQoKPWB2rG1B1N1B1SeuqjVFRA4nRQPTk6HkcIDp9SxXn5AIkAaf7d4EIJaMr+l
         OWWJNEgdFGPrejZSKXVXbwRpEOw24wg3NFttF/kAtvycSlVEhyctDUl0J32koPr7Zyvc
         SioA==
X-Gm-Message-State: ANoB5pkpcfR/N4gPVEfCFZ5DLND0wEXuFwQn4pXYL1AwqGw/Fi6RCSXV
        G1DJAdGiQP/CTIPk+tG4h5P6RaX+6AxnhFizUW2o3g2ZAFyBdlcQ4oYecdTvHIwwx4pBkdxgOMO
        URyA6XZxAh8Q3X/vcRxcI
X-Received: by 2002:a1c:f216:0:b0:3d0:70fd:92bb with SMTP id s22-20020a1cf216000000b003d070fd92bbmr8875609wmc.14.1669978225707;
        Fri, 02 Dec 2022 02:50:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf685QZj2W6wR2OfJVqBlDm1LFTsF4LNxBCQdfUos9S5uMPZkJFB11z0tALtJyodHM0eSiyWmA==
X-Received: by 2002:a1c:f216:0:b0:3d0:70fd:92bb with SMTP id s22-20020a1cf216000000b003d070fd92bbmr8875597wmc.14.1669978225479;
        Fri, 02 Dec 2022 02:50:25 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b003a3170a7af9sm9728818wmb.4.2022.12.02.02.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 02:50:25 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sergio Lopez Pascual <slp@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Guang Zeng <guang.zeng@intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Wei Wang <wei.w.wang@intel.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 1/4] KVM: Delete all references to removed KVM_SET_MEMORY_REGION ioctl
Date:   Fri,  2 Dec 2022 11:50:08 +0100
Message-Id: <20221202105011.185147-2-javierm@redhat.com>
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

 Documentation/virt/kvm/api.rst | 16 ----------------
 include/uapi/linux/kvm.h       | 12 ------------
 tools/include/uapi/linux/kvm.h | 12 ------------
 3 files changed, 40 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index eee9f857a986..54af33645df3 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -272,18 +272,6 @@ the VCPU file descriptor can be mmap-ed, including:
   KVM_CAP_DIRTY_LOG_RING, see section 8.3.
 
 
-4.6 KVM_SET_MEMORY_REGION
--------------------------
-
-:Capability: basic
-:Architectures: all
-:Type: vm ioctl
-:Parameters: struct kvm_memory_region (in)
-:Returns: 0 on success, -1 on error
-
-This ioctl is obsolete and has been removed.
-
-
 4.7 KVM_CREATE_VCPU
 -------------------
 
@@ -1377,10 +1365,6 @@ the memory region are automatically reflected into the guest.  For example, an
 mmap() that affects the region will be made visible immediately.  Another
 example is madvise(MADV_DROP).
 
-It is recommended to use this API instead of the KVM_SET_MEMORY_REGION ioctl.
-The KVM_SET_MEMORY_REGION does not allow fine grained control over memory
-allocation and is deprecated.
-
 
 4.36 KVM_SET_TSS_ADDR
 ---------------------
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 0d5d4419139a..8899201d5964 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -86,14 +86,6 @@ struct kvm_debug_guest {
 /* *** End of deprecated interfaces *** */
 
 
-/* for KVM_CREATE_MEMORY_REGION */
-struct kvm_memory_region {
-	__u32 slot;
-	__u32 flags;
-	__u64 guest_phys_addr;
-	__u64 memory_size; /* bytes */
-};
-
 /* for KVM_SET_USER_MEMORY_REGION */
 struct kvm_userspace_memory_region {
 	__u32 slot;
@@ -1437,10 +1429,6 @@ struct kvm_vfio_spapr_tce {
 	__s32	tablefd;
 };
 
-/*
- * ioctls for VM fds
- */
-#define KVM_SET_MEMORY_REGION     _IOW(KVMIO,  0x40, struct kvm_memory_region)
 /*
  * KVM_CREATE_VCPU receives as a parameter the vcpu slot, and returns
  * a vcpu fd.
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index 0d5d4419139a..8899201d5964 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -86,14 +86,6 @@ struct kvm_debug_guest {
 /* *** End of deprecated interfaces *** */
 
 
-/* for KVM_CREATE_MEMORY_REGION */
-struct kvm_memory_region {
-	__u32 slot;
-	__u32 flags;
-	__u64 guest_phys_addr;
-	__u64 memory_size; /* bytes */
-};
-
 /* for KVM_SET_USER_MEMORY_REGION */
 struct kvm_userspace_memory_region {
 	__u32 slot;
@@ -1437,10 +1429,6 @@ struct kvm_vfio_spapr_tce {
 	__s32	tablefd;
 };
 
-/*
- * ioctls for VM fds
- */
-#define KVM_SET_MEMORY_REGION     _IOW(KVMIO,  0x40, struct kvm_memory_region)
 /*
  * KVM_CREATE_VCPU receives as a parameter the vcpu slot, and returns
  * a vcpu fd.
-- 
2.38.1

