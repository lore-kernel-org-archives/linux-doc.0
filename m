Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529A0C4708E
	for <linux-doc@archiver.kernel.org>; Fri,  2 Dec 2022 10:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbiLBKve (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 05:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbiLBKv0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 05:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737FDCFE7D
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 02:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669978231;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1ZiLhwAB4T5DlsifWPEOUp55KcHRF76jPNns8olDBLs=;
        b=Hc4NLD78+J6CD/ItmgTJgM2ITujoOJl44UrVS2ORnwjbqr6lR5k9B4HyljCz95d+P9xuWm
        mhUbFKYadcF/qwhAqAYATiYP/A8wbFscVucdZDa7Su/hY5v40QTR06Uc4FNidV2jMoUsdn
        zogq9cPOCVREkrPjN0EXFubUtBnn5X8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-QHb82eHVN5KDG1oY9d4UGw-1; Fri, 02 Dec 2022 05:50:30 -0500
X-MC-Unique: QHb82eHVN5KDG1oY9d4UGw-1
Received: by mail-wm1-f69.google.com with SMTP id f1-20020a1cc901000000b003cf703a4f08so1745867wmb.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 02:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZiLhwAB4T5DlsifWPEOUp55KcHRF76jPNns8olDBLs=;
        b=thBJDE5dgvgMMReRyuucwb6Iht+/92GlBi+QdtSDubj1pL8Ysg6vgIvzVtMoIUEQsd
         F+hkqGI/kx7ph515P1e0WzhbNmGV+nQsdk60hXQv4wlaWsuW1wAu66FVH4VFwcsSCzdk
         0SG0E9311Rk99Po4/1i5vCYLX63Em1oDoceKIDsManKP3T9nSE65R/LtXknC1XpkgDMi
         E1avcYb2EcdZjWtEDtdMJU0CIquGfLANAHLtVuMHOnN6UAsYljMGA86JKXM93gkNKik5
         h7EhBeTqsa1isrOYcQBkgQPAQD01zL+xyMGUmprvaQaXWuLCnoI6aRfPM8IaZ4xyXLo8
         69oA==
X-Gm-Message-State: ANoB5pk6zO1h/alZUPW8KVl5YarNlR4BE3iC4wT1Ks1CRAFMcOxMhu7T
        2xLHwIA2nnv6LevKdpiKcySh8LERDyludDloVM47Aj9kkur5s8ZEezlaiv2TKoZHlleJDRUiGVA
        5nieImyHyGrCVS2cO/Yo1
X-Received: by 2002:a05:6000:983:b0:236:aacc:ea07 with SMTP id by3-20020a056000098300b00236aaccea07mr45038544wrb.36.1669978229095;
        Fri, 02 Dec 2022 02:50:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5xmf8N/KoyM3E7rvK+vbyjX3grYot4oQfWOk16THK9TJ5D1uAwksRui+qdQ92XRGd+sHEYog==
X-Received: by 2002:a05:6000:983:b0:236:aacc:ea07 with SMTP id by3-20020a056000098300b00236aaccea07mr45038533wrb.36.1669978228835;
        Fri, 02 Dec 2022 02:50:28 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b003a3170a7af9sm9728818wmb.4.2022.12.02.02.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 02:50:28 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sergio Lopez Pascual <slp@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Guang Zeng <guang.zeng@intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jing Liu <jing2.liu@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Wei Wang <wei.w.wang@intel.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 3/4] KVM: Reference to kvm_userspace_memory_region in doc and comments
Date:   Fri,  2 Dec 2022 11:50:10 +0100
Message-Id: <20221202105011.185147-4-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202105011.185147-1-javierm@redhat.com>
References: <20221202105011.185147-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are still references to the removed kvm_memory_region data structure
but the doc and comments should mention struct kvm_userspace_memory_region
instead, since that is what's used by the ioctl that replaced the old one
and this data structure support the same set of flags.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 Documentation/virt/kvm/api.rst | 2 +-
 include/linux/kvm_host.h       | 4 ++--
 include/uapi/linux/kvm.h       | 6 +++---
 tools/include/uapi/linux/kvm.h | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 85a5b12eb017..b15ea129f9cf 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1309,7 +1309,7 @@ yet and must be cleared on entry.
 	__u64 userspace_addr; /* start of the userspace allocated memory */
   };
 
-  /* for kvm_memory_region::flags */
+  /* for kvm_userspace_memory_region::flags */
   #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
   #define KVM_MEM_READONLY	(1UL << 1)
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 18592bdf4c1b..759ed18dabb7 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -50,8 +50,8 @@
 #endif
 
 /*
- * The bit 16 ~ bit 31 of kvm_memory_region::flags are internally used
- * in kvm, other bits are visible for userspace which are defined in
+ * The bit 16 ~ bit 31 of kvm_userspace_memory_region::flags are internally
+ * used in kvm, other bits are visible for userspace which are defined in
  * include/linux/kvm_h.
  */
 #define KVM_MEMSLOT_INVALID	(1UL << 16)
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 6ba2928f8f18..e42be6b45b9b 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -96,9 +96,9 @@ struct kvm_userspace_memory_region {
 };
 
 /*
- * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
- * other bits are reserved for kvm internal use which are defined in
- * include/linux/kvm_host.h.
+ * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
+ * userspace, other bits are reserved for kvm internal use which are defined
+ * in include/linux/kvm_host.h.
  */
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index 6ba2928f8f18..21d6d29502e4 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -96,9 +96,9 @@ struct kvm_userspace_memory_region {
 };
 
 /*
- * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
- * other bits are reserved for kvm internal use which are defined in
- * include/linux/kvm_host.h.
+ * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
+ * userspace, other bits are reserved for kvm internal use which are defined
+ *in include/linux/kvm_host.h.
  */
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
-- 
2.38.1

