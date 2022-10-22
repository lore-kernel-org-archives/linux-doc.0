Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1872ECDFA1
	for <linux-doc@archiver.kernel.org>; Sat, 22 Oct 2022 15:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiJVPsa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Oct 2022 11:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiJVPs3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Oct 2022 11:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454A7AE4F
        for <linux-doc@vger.kernel.org>; Sat, 22 Oct 2022 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666453706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SFuETpa6kYA2kfLTdzptBf2PIFoZB2DGXGMPa7uX8z4=;
        b=b35ztFSC9dYLT/WP2/WaH5ALXm36d15Jw+pHKo4rdR92IJZ79pVEIbg0op/L+kQMfiHa3P
        9RLTX3lAVzPF39cjAMfTKSLyWrHvko4uCbQs7whwnJLotyaMw8RuFTKhdyrzBFT+qu3ZJZ
        pO2nt9hLkHXKxGFm4CJfXmGcCpN9/qQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-Pe_Wdq8lNOudrwKkAqkw_g-1; Sat, 22 Oct 2022 11:48:23 -0400
X-MC-Unique: Pe_Wdq8lNOudrwKkAqkw_g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56FBE862FEC;
        Sat, 22 Oct 2022 15:48:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ECC3C4A9268;
        Sat, 22 Oct 2022 15:48:21 +0000 (UTC)
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
To:     kvm@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 1/4] linux-headers/linux/kvm.h: introduce kvm_userspace_memory_region_list ioctl
Date:   Sat, 22 Oct 2022 11:48:16 -0400
Message-Id: <20221022154819.1823133-2-eesposit@redhat.com>
In-Reply-To: <20221022154819.1823133-1-eesposit@redhat.com>
References: <20221022154819.1823133-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introduce new KVM_KICK_ALL_RUNNING_VCPUS and KVM_RESUME_ALL_KICKED_VCPUS
ioctl that will be used respectively to pause and then resume all vcpus
currently executing KVM_RUN in kvm.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/uapi/linux/kvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index eed0315a77a6..d3cba8d4ca91 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -2227,4 +2227,7 @@ struct kvm_s390_zpci_op {
 /* flags for kvm_s390_zpci_op->u.reg_aen.flags */
 #define KVM_S390_ZPCIOP_REGAEN_HOST    (1 << 0)
 
+#define KVM_KICK_ALL_RUNNING_VCPUS		_IO(KVMIO,  0xd2)
+#define KVM_RESUME_ALL_KICKED_VCPUS		_IO(KVMIO,  0xd3)
+
 #endif /* __LINUX_KVM_H */
-- 
2.31.1

