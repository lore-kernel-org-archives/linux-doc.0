Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1AF497D8A4
	for <lwn-linux-doc@archive.lwn.net>; Sun,  6 Jan 2019 19:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbfAFTZw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 Jan 2019 14:25:52 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42994 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfAFTZw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Jan 2019 14:25:52 -0500
Received: by mail-ed1-f67.google.com with SMTP id y20so36009620edw.9
        for <linux-doc@vger.kernel.org>; Sun, 06 Jan 2019 11:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IhG1ga+e4jMCr/1icaT0qzsbDovza4q20X40VnRy5Mw=;
        b=lCl9IyjMglES4cIfn8gPTV+/rkcu1w8CQpTU2F6v9KSW/PGPay9juxpdYv2tvQPc0R
         H9Vaq9c9kVnGf9rac+Dv/xeQqPFXNWmVJtqYXZ3yDKg712+InHT9JMMhLcIFkbPlviwK
         A6FgDvGWUMvl8dK+O3Ww+7FkfXKJMvXhoXvU1YVc97ucz+BAmuIs3UZe5mGZH/AhEOuM
         bzo/KBcAx1gJmPFvEIvOCNxxd0sMA8mbR9goOt4RmdhJwgYBvFlS3WuCFnqFZ9skkf3T
         P/lb5NhrH3R/DSbDWORSjFsefZ4HUPg1Pd0ctox+LlKaGgCbD5HSA9pIfWDBziOLFv4S
         fgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IhG1ga+e4jMCr/1icaT0qzsbDovza4q20X40VnRy5Mw=;
        b=DH4soh/0HL9aEMF8N3lKao4J/SAFnEGTw0b7PPHkELyNGuuBmEvpqB/NwRx+PoEBCD
         HcEntfS1PPSpcmj/t4Q44TvQhcRCKx/ASz2EPcWLkyrLqQWO44W0WWO6S+CNkkzqnTcl
         y+gkzRfc60bM2DoNTP6Gt4XdqlC4tIuL8694dq1hrL2g9TKXk/zyuHq19u/T7mmtljgo
         PxZIkpfyJCeFBchj97k0l8F8nbs6/uK3zdG9EnsowRvMzTdAU0T6IbQ+a8iNiM/2k1bV
         WNJeKwWMwltkBUS+5U4OCbqaNkGpI4bRJrmmJa7CVGxWHci6nwry5paSOD9Ih1nnhdk1
         VrTw==
X-Gm-Message-State: AA+aEWYnTPx4oGE9n6JLlHpBpEtCaxna/cYgAc+ssCWJ9q/BSy3RkkHy
        3frD0eB56K+OO+3fmW4+VFASfQ==
X-Google-Smtp-Source: AFSGD/Vnaq+2h7rtM9sf3o4XRBNoHEGHN4J0XOQA2T3TH7NRYXYEVkR2rHRWz8pPDSe+8LVaqgyruA==
X-Received: by 2002:a17:906:6a9b:: with SMTP id p27-v6mr45497776ejr.235.1546802750477;
        Sun, 06 Jan 2019 11:25:50 -0800 (PST)
Received: from localhost.localdomain ([156.212.65.252])
        by smtp.gmail.com with ESMTPSA id b46sm29994035edd.94.2019.01.06.11.25.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Jan 2019 11:25:49 -0800 (PST)
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
Subject: [PATCH V8 10/11] KVM: Log ROE violations in system log
Date:   Sun,  6 Jan 2019 21:23:44 +0200
Message-Id: <20190106192345.13578-11-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190106192345.13578-1-ahmedsoliman@mena.vt.edu>
References: <20190106192345.13578-1-ahmedsoliman@mena.vt.edu>
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

