Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383620;
	b=rwBSxaeDBT6sn8GeYlf2KYrkEa1MMKw/AfGUsJ27LZbw7wygGZQp6Sk3aBSxW2ALKXoK
	 2JUE7YUcLpBCUJQYwYjJhmFIAS7KngwnGn1WJLlm2H/ph8abA4E2qJprYxbar9Ow14wwk
	 nRL8jhqDMRkgFQoFo4fVwLC/tbxaM63+tCLuR601RZOkVrvBhjFzZ9AgxyB3F1OvzIvca
	 eb9w/cZ5t+P1Vs4vKUiUF0aUbIUm/uHcKnumMzaLeUw+F9foQU67ejgb6RhUcBlvfOD/y
	 /PesrnRcQXKZXrJPiWLU4k1jjVa7FGdyxg3+G198Sw71rx2uRGbSvu6Zij+4T3hmUuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=sK/H9HvHFSTiGugEGJQyMUnIkFUyigqct4WxtQyCZAI=;
	b=1JN/Ft4CF6bKZSdx7y6+qumOdPGm/5UDIrzATtEEAGhDJv9wOcY+COTP/k8VJQEP1sSJ
	 4rKkRFN4EBaJs6ciBfquUFhgCodZsIx08NQ/QRY0aQ97DrEDb0y4MYU/KdxpmOBmKls8e
	 e6s3ILE5urEaZ9TGfS2TNLv1Ew/6/+hCbcMaupDhuD+UQHwcb5qxVNOx7sXaGkivh4Ee8
	 2XiNeqaJvOxE1jeiVhtiXpsMSLOkrrnbiDiwZw1ITu/XLbVN517ivC1NCqXWbuLpCSAyn
	 9OMwAK1ln3xdk1gXNy0R6osaymBj2l6q/BhOgMdJt532zZWpmXFPUD8xp/gS4eLknAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xaDRSLAB;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFA960A2601
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 07:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFA960A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xaDRSLAB
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso1266135b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383620; x=1794988420; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sK/H9HvHFSTiGugEGJQyMUnIkFUyigqct4WxtQyCZAI=;
        b=xaDRSLABpfcz35+Jp7pKiITUvAgjZWk7/Jh/8WetpYrTZp9CkHwV1EFlgkfEgMjmYv
         CAloFN3rxioko73QaTac1MJq4Cz7jyUCaeLiA6+2dXFCbPQpfk0fEAMmN6TJuRIhT/jM
         r4DvfBb3kH3jy0wwVbSjIj9ATNuoAA338rnD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383620; x=1794988420;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sK/H9HvHFSTiGugEGJQyMUnIkFUyigqct4WxtQyCZAI=;
        b=mPETTxt3mPSCk04u4/xmmQ1s1UGOrExQfoMolJzrSgI6JDL5dXySjQLaxOyfzl/qf/
         37871IXA883/IJeLC+8ZI0dsjnRh94cDBF888MmQChjwHIdxqSgNqyiQ+eofevEl1vgU
         5TxvTAj2cD0cch4aap/JbLOyRtvk4p8gsXIdbVw03eZsyJENLnh1nw87Oe6Uy60M7NW+
         jPVxTSshcoC3M/KFRfpRTuDWjApDkOiPjVUKzEptuNt0p6XKz99zt7ZnS55bq2x6hjja
         wQgehHdUAr51ASBruAsWwqKtSdqOcZLVausLmem2nJl6JqqsmMNDmCtFW8DGcbccyh8h
         PkHQ==
X-Forwarded-Encrypted: i=1; AL+hErEsHJPhLlPjeoDXnUJ1WA6zZ2zvKZwL9ATR+q/2ynzsl12M7/3JeZ4gtfKa6k1ady+kkrnWQTfUlrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FkRZUAwWvsSefUzPQND/zGS72EJBMgkx/H6LyfWjqo6QHTkVK
	3jKnFLg9NDFJylwzsvrHhfg8RIvLDSoMwrf4bHx0gtR9Gptw2aGk/a0qadl2OZc/T+0=
X-Gm-Gg: AYBFou2bXsTHSqqw2Mq9qWLgzhg5pE/6KZQIItHGEqBmRAmTS/BN24GtvNWtt71fdDA
	OUm9iXyB74H4PjfraH1t3umXx6a99auqW5miCOm2bVwhjjNMTyZYMyr3ppWbG0cxbdBQGOwEx6H
	0vQOZzlf6oHrSYhkcj3LvcWC5fTcnBvLKixIrtazYyEUlKkC3gmdh23RWZeITsPhmBcj/Zobaqe
	86ybX2PonoUwHgrl9OfkmO+g2qTCRmuSZutjJI1qowTuEK73cvKqs+fBAvb6fx31X5fwTUexc8b
	hdfZzm9KFUAWZTbCyiKfsZA9xgCGtjYtMIpsRB9Y+yTmcR4sAA28yzrTlOxq47Y0XIxaUKVtv5x
	tCxsbxctrNLIbQac1qS+vw1kZHhfgDLmj6ojiwoFw26rF7f8Qd+MLjQkXJSD/Cj/wW8R2m2ACFf
	ajJ6efBT2D0ypZDX+LXaLn5I+64D2H0gcAGSvPV9KywA5TnVj84MTzdRnCJLNUbTO0SgEa3pKPV
	z067r+Hxb+W4Sf+I5ccl4BBRw/ZMgFLBxF4ZQ9aKflZ+5V38rln2Ky91DymUFQ1FmSSY2KIhLCD
	Sz3ANnRdxyq8iiwmVbVeNg3Ipv7UyHVqqRxGlQqIJYEfz/RYMzGbBTZH4w5N6Ze76aDuwYTmDwl
	u9GesluDFvOKoe+GBvHpTUlTTLpqBY0cwmI605ezPV2HRntLZeu00BIbCxwwOvQq5MCO9EovrAC
	spVKVC3KcH/n59Br7iTP9v2IAwz8viZMpFWzDFWV39JeXJssY+TdK4vA==
X-Received: by 2002:a05:6a00:2d2a:b0:8a0:1e49:71bb with SMTP id d2e1a72fcca58-8bc1ddf8792mr1803838b3a.57.1794383619946;
        Tue, 10 Nov 2026 23:53:39 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6c51sm1842597b3a.14.2026.11.10.23.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:39 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:35 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 7/9] kho: Report how much handover memory is preserved and
 restored
Message-ID: <920192d01c6534b5754648e12840f73cdcfa73de.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Most memory the previous kernel preserved stays reserved until its user
restores it through KHO, either to use it again or to free it. If
nothing does, it stays reserved for as long as the kernel runs. On a
hypervisor host that can be gigabytes, but amusingly nothing really
shows it reliably. The host simply has less memory than it should, which
is not exactly obvious.

All preserved memory is reserved in kho_preserved_memory_reserve(), and
everything restored through KHO goes through kho_restore_page(), so KHO
can count both easily. Let's add preserved_size and restored_size, in
bytes, to /sys/kernel/kexec/kho_incoming/.

For example, after a live update preserving a 64 MiB memfd:

                     preserved_size  restored_size
    before retrieval       67403776           8192
    after retrieval        67403776       67395584

The 8 KiB left are the incoming KHO FDT and LUO's FLB header.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../ABI/testing/sysfs-kernel-kexec-kdump      | 10 ++++++++
 Documentation/admin-guide/mm/kho.rst          |  3 +++
 kernel/liveupdate/kexec_handover.c            | 23 +++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index 5636cd060cb2..2b9f9917d2d4 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -79,3 +79,13 @@ Description:	read only
 		           the walk of its preserved memory map.
 		"failed"   The kernel rejected the handover.
 User:		system monitoring
+
+What:		/sys/kernel/kexec/kho_incoming/preserved_size
+What:		/sys/kernel/kexec/kho_incoming/restored_size
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Bytes preserved by the previous kernel and bytes restored
+		through KHO, respectively. Both are 0 unless the incoming
+		state is "revived".
+User:		system monitoring
diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 9d74d4ce18b5..37a62daa7622 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -91,6 +91,9 @@ sysfs Interfaces
 ``/sys/kernel/kexec/kho_incoming/state``
     Status of the incoming KHO handover.
 
+``/sys/kernel/kexec/kho_incoming/preserved_size`` and ``restored_size``
+    Bytes preserved by the previous kernel and bytes restored through KHO.
+
 See Documentation/ABI/testing/sysfs-kernel-kexec-kdump for the sysfs ABI.
 
 debugfs Interfaces
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index dfd6fa7e4a71..fe6b66270124 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -110,6 +110,8 @@ struct kho_in {
 	char previous_release[__NEW_UTS_LEN + 1];
 	u32 kexec_count;
 	enum kho_incoming_state state;
+	unsigned long preserved_pages;
+	atomic_long_t restored_pages;
 	struct kho_debugfs dbg;
 	struct kho_radix_tree radix_tree;
 };
@@ -552,6 +554,7 @@ static struct page *kho_restore_page(phys_addr_t phys, bool is_folio,
 		kho_init_pages(page, nr_pages);
 
 	adjust_managed_page_count(page, nr_pages);
+	atomic_long_add(nr_pages, &kho_in.restored_pages);
 	return page;
 }
 
@@ -643,6 +646,7 @@ static int __init kho_preserved_memory_reserve(unsigned long key, void *data)
 	info.magic = KHO_PAGE_MAGIC;
 	info.order = order;
 	page->private = info.page_private;
+	kho_in.preserved_pages += 1UL << order;
 
 	return 0;
 }
@@ -978,8 +982,26 @@ static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *attr,
 }
 static struct kobj_attribute state_attr = __ATTR_RO(state);
 
+static ssize_t preserved_size_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", (u64)kho_in.preserved_pages << PAGE_SHIFT);
+}
+static struct kobj_attribute preserved_size_attr = __ATTR_RO(preserved_size);
+
+static ssize_t restored_size_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	u64 pages = atomic_long_read(&kho_in.restored_pages);
+
+	return sysfs_emit(buf, "%llu\n", pages << PAGE_SHIFT);
+}
+static struct kobj_attribute restored_size_attr = __ATTR_RO(restored_size);
+
 static struct attribute *kho_incoming_attrs[] = {
 	&state_attr.attr,
+	&preserved_size_attr.attr,
+	&restored_size_attr.attr,
 	NULL
 };
 
@@ -1785,6 +1807,7 @@ static void __init kho_mem_retrieve(void)
 	kho_in.fdt_phys = 0;
 	kho_in.radix_tree.root = NULL;
 	kho_in.state = KHO_INCOMING_FAILED;
+	kho_in.preserved_pages = 0;
 }
 
 static __init int kho_out_fdt_setup(void)
-- 
2.54.0

