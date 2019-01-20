Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8D6347D917
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Jan 2019 08:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbfAUIE5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 03:04:57 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37590 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729656AbfAUIE5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jan 2019 03:04:57 -0500
Received: by mail-wr1-f65.google.com with SMTP id s12so22128011wrt.4
        for <linux-doc@vger.kernel.org>; Mon, 21 Jan 2019 00:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IhG1ga+e4jMCr/1icaT0qzsbDovza4q20X40VnRy5Mw=;
        b=vPY8CKyF4BZgHUvB9f+hTiC4cuY5UAnYYG9Lexcqx7DTbCm925fQ9AMbHHWoxa/BPW
         OpAktjU2Y9R7ncJshPKtn6/mWocevKPSQqT2VND91cqmRabjphUqCDeF0eKTHRrgo54E
         ia1NVcOtQxFjM907lZSXRSHtSy86MjLjmZueYrWCOsXvynd8UnmC4LeCytW2BvPbyCVI
         xSIiAavK5pn4MgtrZdPKEKnfXTxvInD7mwV8hjFLxns9e1SLnfJU1G0rWTrY5MhDVW8b
         cwUIEqse0kiTlNHvk8yi0Ky3IV0u9yYkxzw6wLrUzIixsD4rzup9+nBdpUkuqhHJuelH
         nEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IhG1ga+e4jMCr/1icaT0qzsbDovza4q20X40VnRy5Mw=;
        b=IC943iIapD0SnpZkblhfhHnscVsCWYNa2T7aOu/bGfH8qvYowmTSvcdtylZwvyvzbM
         qmmxGucPKaV42lDW4ePiXDj3edvFyxvBTuM8lnDpZlHpYlYlpphxgTF5rDezY7MiriFv
         gK+1z5f5gg8U2cp5UVfdF81DgPGBTWp7eGbielmGrqrmg7OdPT1HJKZeJyAbtLIQjvk6
         wssxfpJfDilEuwtKoISJmmfkH9+1ZvBUj/MIfwJttXNkdCMp7W5etyAotcve3ev1Wbs+
         /VVQjNKmVkRjbpZf05xRyGjlvgG/mhkb66hWYPkV/sD2GrkydPS9tf93Ul+FJ2gcGEpo
         qTrg==
X-Gm-Message-State: AJcUukceRWTR1xE3TSGr17uqJ+eXEaxQEm6n6bA4NU7GMPQnMSefEhPD
        rptnO1518qDgPTw9iZzSGU8LTg==
X-Google-Smtp-Source: ALg8bN4Y+xaNp3oVkt+57vV4ZLidw9dYYAcjBRI3aruZ8x1uvjg7qcZTEuQvUQ7ijUbKgU31CHGC4g==
X-Received: by 2002:a5d:60cc:: with SMTP id x12mr24587573wrt.193.1548027701035;
        Sun, 20 Jan 2019 15:41:41 -0800 (PST)
Received: from localhost.localdomain ([156.212.82.83])
        by smtp.gmail.com with ESMTPSA id e9sm76576753wro.16.2019.01.20.15.41.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Jan 2019 15:41:40 -0800 (PST)
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
Subject: [RESEND PATCH V8 10/11] KVM: Log ROE violations in system log
Date:   Mon, 21 Jan 2019 01:39:39 +0200
Message-Id: <20190120233940.15282-11-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
References: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
---
 virt/kvm/kvm_main.c    |  3 ++-
 virt/kvm/roe.c         | 25 +++++++++++++++++++++++++
 virt/kvm/roe_generic.h |  3 ++-
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d92d300539..b3dc7255b0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1945,13 +1945,14 @@ static u64 roe_gfn_to_hva(struct kvm_memory_slot *slot, gfn_t gfn, int offset,
 	addr = __gfn_to_hva_many(slot, gfn, NULL, false);
 	return addr;
 }
+
 static int __kvm_write_guest_page(struct kvm_memory_slot *memslot, gfn_t gfn,
 			          const void *data, int offset, int len)
 {
 	int r;
 	unsigned long addr;
-
 	addr = roe_gfn_to_hva(memslot, gfn, offset, len);
+	kvm_roe_check_and_log(memslot, gfn, data, offset, len);
 	if (kvm_is_error_hva(addr))
 		return -EFAULT;
 	r = __copy_to_user((void __user *)addr + offset, data, len);
diff --git a/virt/kvm/roe.c b/virt/kvm/roe.c
index 9540473f89..e424b45e1c 100644
--- a/virt/kvm/roe.c
+++ b/virt/kvm/roe.c
@@ -76,6 +76,31 @@ void kvm_roe_free(struct kvm_memory_slot *slot)
 	kvfree(slot->prot_list);
 }
 
+static void kvm_warning_roe_violation(u64 addr, const void *data, int len)
+{
+	int i;
+	const char *d = data;
+	char *buf = kvmalloc(len * 3 + 1, GFP_KERNEL);
+
+	for (i = 0; i < len; i++)
+		sprintf(buf+3*i, " %02x", d[i]);
+	pr_warn("ROE violation:\n");
+	pr_warn("\tAttempt to write %d bytes at address 0x%08llx\n", len, addr);
+	pr_warn("\tData: %s\n", buf);
+	kvfree(buf);
+}
+
+void kvm_roe_check_and_log(struct kvm_memory_slot *memslot, gfn_t gfn,
+		const void *data, int offset, int len)
+{
+	if (!memslot)
+		return;
+	if (!gfn_is_full_roe(memslot, gfn) &&
+		!kvm_roe_check_range(memslot, gfn, offset, len))
+		return;
+	kvm_warning_roe_violation((gfn << PAGE_SHIFT) + offset, data, len);
+}
+
 static void kvm_roe_protect_slot(struct kvm *kvm, struct kvm_memory_slot *slot,
 		gfn_t gfn, u64 npages, bool partial)
 {
diff --git a/virt/kvm/roe_generic.h b/virt/kvm/roe_generic.h
index f1ce4a8aec..6c5f0cf381 100644
--- a/virt/kvm/roe_generic.h
+++ b/virt/kvm/roe_generic.h
@@ -14,5 +14,6 @@ void kvm_roe_free(struct kvm_memory_slot *slot);
 int kvm_roe_init(struct kvm_memory_slot *slot);
 bool kvm_roe_check_range(struct kvm_memory_slot *slot, gfn_t gfn, int offset,
 		int len);
-
+void kvm_roe_check_and_log(struct kvm_memory_slot *memslot, gfn_t gfn,
+		const void *data, int offset, int len);
 #endif
-- 
2.19.2

