Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BE6657D8AA
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Dec 2018 12:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbeLGMuI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Dec 2018 07:50:08 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38344 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbeLGMsy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Dec 2018 07:48:54 -0500
Received: by mail-wm1-f65.google.com with SMTP id m22so4430496wml.3
        for <linux-doc@vger.kernel.org>; Fri, 07 Dec 2018 04:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DU7M5piB0Rvr3KyQYQ6V1yh0wa36ooPj9QZW0CCD+Y8=;
        b=cSU1cVB9KCuBGlEeWVp6IcB3lNQiouoLV/w/JRBvclbuTZthEsJ6tnxD6hSXO2+4dK
         8JC2tibVV0lv6hFG2jpXY+wLTXKpXT9I+ApY51qsiPLsoDJiMeoK3tmPP4cMVE/3Ixsm
         2H03FCopLGrTTIfAxUlFP7ndXtBdMJpLqvLXtYrD8Y3P4yh+vvFwT0jMhoghr3VR0h4X
         Pu3URCe6HknbBOry1QaRvs1P1wAgMKoYJ64hnxjHdmLLVeTyS2xQ96tkKkDqPV6qcOMp
         VJ98RFEyhkixt/wdsrLjYLlhHEKp0t8I5I0DYqNRsnH01O0uGugvZZHo2Oc76ZSjcXVq
         CxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DU7M5piB0Rvr3KyQYQ6V1yh0wa36ooPj9QZW0CCD+Y8=;
        b=j3Rcj9KnnQ+dey3zXpY9gVdxXG+Y6QzW/gzFK/cyoOnwb0ywHkNxKW+M/Y7BO7vSLA
         0an5/gIvCyWTkrg7U3UQNwPzUAjdaqUbH/uy9gfNRqMOqRS3Nxwb8zqqpXyHGAiKwwpx
         X8dUiT7K/9CYFfh7QowJDp60UI73SFRq9M1yM1sOcvN3numSznRovizgeoIZ7Ht/uDc7
         O09u+cbWAPsDTQkmW0h3da4hKeDjG8JFpQcG3TddIFDy1F9Gxm2kqrcQz1Rh9EynKrQE
         T6f91EFEzQnSc8C38n0VzpHitB85r3cvgjHzYTGjDyCiwf6ZUUjmFainV1cvy6j6r/Lh
         Qi5w==
X-Gm-Message-State: AA+aEWa/pP54o3EPBcIJffHHzfWLxBw7TRroGJk5GCTqiL4T6OW+rxB/
        CMUks6CzO3/w30GhQwj0+9HQeA==
X-Google-Smtp-Source: AFSGD/VD5A9bP8tcLxrmke4ui26mgs0SJBgedL/b6iChfzDt0Fm09UUCW7OdnezygTMA0WRirXDUIA==
X-Received: by 2002:a1c:544f:: with SMTP id p15mr2079564wmi.37.1544186932211;
        Fri, 07 Dec 2018 04:48:52 -0800 (PST)
Received: from localhost.localdomain ([156.213.98.90])
        by smtp.gmail.com with ESMTPSA id i192sm4362949wmg.7.2018.12.07.04.48.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Dec 2018 04:48:51 -0800 (PST)
From:   Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
To:     Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahmedsoliman0x666@gmail.com, ovich00@gmail.com,
        kernel-hardening@lists.openwall.com, nigel.edwards@hpe.com,
        Boris Lukashev <blukashev@sempervictus.com>,
        Igor Stoppa <igor.stoppa@gmail.com>
Cc:     Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
Subject: [PATCH 01/10] KVM: State whether memory should be freed in kvm_free_memslot
Date:   Fri,  7 Dec 2018 14:47:54 +0200
Message-Id: <20181207124803.10828-2-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207124803.10828-1-ahmedsoliman@mena.vt.edu>
References: <20181207124803.10828-1-ahmedsoliman@mena.vt.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The conditions upon which kvm_free_memslot are kind of ad-hock,
it will be hard to extend memslot with allocatable data that needs to be
freed, so I replaced the current mechanism by clear flag that states if
the memory slot should be freed.

Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
---
 virt/kvm/kvm_main.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2679e476b6..039c1ef9a7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -549,9 +549,10 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
  * Free any memory in @free but not in @dont.
  */
 static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *free,
-			      struct kvm_memory_slot *dont)
+			      struct kvm_memory_slot *dont,
+			      enum kvm_mr_change change)
 {
-	if (!dont || free->dirty_bitmap != dont->dirty_bitmap)
+	if (change == KVM_MR_DELETE)
 		kvm_destroy_dirty_bitmap(free);
 
 	kvm_arch_free_memslot(kvm, free, dont);
@@ -567,7 +568,7 @@ static void kvm_free_memslots(struct kvm *kvm, struct kvm_memslots *slots)
 		return;
 
 	kvm_for_each_memslot(memslot, slots)
-		kvm_free_memslot(kvm, memslot, NULL);
+		kvm_free_memslot(kvm, memslot, NULL, KVM_MR_DELETE);
 
 	kvfree(slots);
 }
@@ -1063,14 +1064,14 @@ int __kvm_set_memory_region(struct kvm *kvm,
 
 	kvm_arch_commit_memory_region(kvm, mem, &old, &new, change);
 
-	kvm_free_memslot(kvm, &old, &new);
+	kvm_free_memslot(kvm, &old, &new, change);
 	kvfree(old_memslots);
 	return 0;
 
 out_slots:
 	kvfree(slots);
 out_free:
-	kvm_free_memslot(kvm, &new, &old);
+	kvm_free_memslot(kvm, &new, &old, change);
 out:
 	return r;
 }
-- 
2.19.2

