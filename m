Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C9357D17
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 02:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375880; cv=none; b=Ob+c5KI0gwsr1W8HVLmb7bUo58nWe9vEpJvytxPQW5FJ95X8/bhVzTXAQkHVKKWfJkb6aUJA1TVEnIfqG9BAjo4Veh3g+wtyVjYU+llFE3QPHN5wdkvn5rMDTirmtgMnm5UI0Bcg+SZ4KwT59GdWLUdkEL+euuWWXyBsz+L6rhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375880; c=relaxed/simple;
	bh=qu3CysSfdt8dTHOdE9z+6BpHcdsMilFAQHAcisUX9hM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9bcIB2bUio6IKRYoQnTVlP/unC5k0DqrHWc4HOm1oET7HkkQ8Qk2wRDzxwejrEmabED6VQRXg2XCTRDleJrWXl4qkyKsHRIXW1olp3JpD7cxcNjkVKkaLUPejfE7nSboeQnzDqcziYsU+sWe7pWNMuZwwralh4cCer+BP6yoIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ah/yYaSU; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ah/yYaSU"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eac3b6b2ceso172479e0c.2
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 19:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375878; x=1792980678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1qJK14zquZVZQXJj1ZTJgob9CLSSkOEckqrXS5MxL0I=;
        b=ah/yYaSUMjIsUAyA3oA+G/M32DRfFEkJhWyZj6hNE00tueETKzWnqZ5za5hitSHY6a
         RFdZyi4562wnsQ6EcdSdWvZntH9obXlkyJhSzEJl3OG7Ff5NXrCRe6FFxK2iAen93J9d
         5HYEiOFYXfLUfbJAmZvBhIxz3LpDbVBIVqm5+y7B0EwCrdJ7pO7ihp46qIMG6Ooy4BDA
         HVmxVl+a1HGYqlM89sXKsLxiyiSOYoxPmayNC9JIOy505ngJnc+2HA0Ap5tTaePI+8kG
         RnKssla1U4YEuMAtiSVQg0TR4kYmYaVs/mrKNSV3DTl1ae3E1ODVTzw1MdVyOZVjt6D9
         A+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375878; x=1792980678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1qJK14zquZVZQXJj1ZTJgob9CLSSkOEckqrXS5MxL0I=;
        b=nAiPn175Ig2y57ZoZMBKHVPKuFE1CR3Rft01cVTwVTam0qAoYqFiR5uHHbvlRz0wcT
         NiozyNYqt/8C9oW/AkgOQEdcn4NCMFokCRfq8E6VkLG9mo985TKTrQVXJ3bi67Qto+29
         3yBbuzVGJEjVqCLOfK+TAOqvwMGvCdtGo8AopJD5HkCNJrmgDeDfktWdgRF+dqrTtf3e
         3XJ5VqQnegaCTFwpKXxREYpK8adaknA+6iAGopBe5R0a42P01SMtCGRMTi8jQM5HItz/
         sc/5JvLTWiOuHs549POhBHuqkEMa8SYwaVCkBtAv9hdQB1CeJWcEDxdrCEDVbLUGDusK
         ggcw==
X-Forwarded-Encrypted: i=1; AKwUvBzWco9G4QRel5YZxShmblBTLOYKOWMUW+c2R9wJ38Y+xbASF6BS9mW/KIDNkCHOkJgbSGuKzedMQ4A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI90/AXatYzhq3Uxd88s1mQGrhvQrV2lLg+Hq9p+x5TDezPBuXh
	bkRLvDkRWxYlqvYefPBHsGMaYwwXD6b/6A8m5WzDBAgulOQknFWI5IqEaqUXrxCFSQM=
X-Gm-Gg: AYBFou1dQ4t2F2bAWpIqb3nM8CnU3PSW7oHwG5jS7VWeueq0/BLuAOgP0kvvEPtnTmx
	cjfMXRnmR8ePABXk8JtlHYKimic+TJL7+UiDByKOgUlQHK2WzvGzv/RyJL8+vy1gUgON10gRliN
	/2p7/d0eVHKp5YVwvO6yyVZG3Fr1oohVKxjBzbL/LMVRC0a7Ep2uUsf3CC+HJF22OpLw4hgkOi5
	aKwuIxyXlnI3XzB1k6zOeLcPxYwKUEWZwxasLwePJCz6WRmrYAJbesgX+AlNhLHioNE4DCEGWbb
	S23LYNv2TIWC+YXMFoQbsjNRAiE2vRLRafed1dp1h1kRAlpOo2nPly7DtRFClq54/Pqs1LAU/Wq
	E/J0BFtv7mE9jVhVxDs9VZ5Be9xlB2p8rXGLuzVVOKi/cnQjPYuq8GiYaJkM/cZZYGmPtd1MAAp
	cOZA6e5REEWpFM+mkmQ/h4TZD/i6jo0Il1T0qH/u1DPtfTzzQE3H1SNJtVjdzOQlZhm9MBPg6pM
	ko78x10rOpDlVCwaHJvuwrZ7zjdFKjveBXsPm0zt3JUlf9+U4AJT1CeXhE1lrKSfA1yQ8gQHee2
	YXxMEa0XOH+wbCqbzL3eDT9BDVupeA==
X-Received: by 2002:a05:6122:4b1a:b0:5c9:c60e:3a44 with SMTP id 71dfb90a1353d-5eaaa8b81a1mr2041402e0c.22.1792375877949;
        Sun, 18 Oct 2026 19:11:17 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:17 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v1 1/8] kho: expose physical address of outgoing FDT
Date: Sun, 18 Oct 2026 22:11:04 -0400
Message-ID: <20261019021111.990394-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019021111.990394-1-pasha.tatashin@soleen.com>
References: <20261019021111.990394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the physical address of the outgoing KHO FDT via
/sys/kernel/debug/kho/out/fdt_phys (analogous to bootmem_phys) so
that userspace tooling can locate the root KHO FDT in physical memory.

Also add kho_debugfs_cleanup() and remove the KHO debugfs directory
if kho_init() fails after initializing debugfs, ensuring fdt_phys
does not retain a dangling pointer to a freed FDT.

This is going to be used by the upcoming KHO read-only mode.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/admin-guide/mm/kho.rst        |  3 +++
 kernel/liveupdate/kexec_handover.c          | 10 ++++++----
 kernel/liveupdate/kexec_handover_debugfs.c  | 22 ++++++++++++++++++++-
 kernel/liveupdate/kexec_handover_internal.h |  7 +++++--
 4 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 902d171a780a..2ba884c620c5 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -96,6 +96,9 @@ stabilized.
     current KHO state in this file. Kexec user space tooling can use this
     as input file for the KHO payload image.
 
+``/sys/kernel/debug/kho/out/fdt_phys``
+    Physical address of the outgoing KHO FDT blob.
+
 ``/sys/kernel/debug/kho/out/bootmem_len``
     Lengths of KHO bootmem regions, which are physically contiguous
     memory regions that will always stay available for future kexec
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe3181..ce5983abf181 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1851,17 +1851,17 @@ static __init int kho_init(void)
 	if (err)
 		goto err_free_fdt;
 
-	err = kho_out_debugfs_init(&kho_out.dbg);
+	err = kho_out_debugfs_init(&kho_out.dbg, kho_out.fdt);
 	if (err)
-		goto err_free_fdt;
+		goto err_cleanup_debugfs;
 
 	err = kho_out_fdt_setup();
 	if (err)
-		goto err_free_fdt;
+		goto err_cleanup_debugfs;
 
 	err = kho_kexec_metadata_init(fdt);
 	if (err)
-		goto err_free_fdt;
+		goto err_cleanup_debugfs;
 
 	if (fdt) {
 		kho_in_debugfs_init(&kho_in.dbg, fdt);
@@ -1893,6 +1893,8 @@ static __init int kho_init(void)
 
 	return 0;
 
+err_cleanup_debugfs:
+	kho_debugfs_cleanup();
 err_free_fdt:
 	kho_unpreserve_free(kho_out.fdt);
 err_free_kho_radix_tree:
diff --git a/kernel/liveupdate/kexec_handover_debugfs.c b/kernel/liveupdate/kexec_handover_debugfs.c
index 7d74477da0b7..db3830829398 100644
--- a/kernel/liveupdate/kexec_handover_debugfs.c
+++ b/kernel/liveupdate/kexec_handover_debugfs.c
@@ -95,6 +95,15 @@ static int bootmem_len_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(bootmem_len);
 
+static int fdt_phys_show(struct seq_file *m, void *v)
+{
+	void *fdt = m->private;
+
+	seq_printf(m, "0x%llx\n", (unsigned long long)virt_to_phys(fdt));
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(fdt_phys);
+
 __init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 {
 	struct dentry *dir, *sub_fdt_dir;
@@ -172,7 +181,7 @@ __init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 	}
 }
 
-__init int kho_out_debugfs_init(struct kho_debugfs *dbg)
+__init int kho_out_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 {
 	struct dentry *dir, *f, *sub_fdt_dir;
 
@@ -196,6 +205,11 @@ __init int kho_out_debugfs_init(struct kho_debugfs *dbg)
 	if (IS_ERR(f))
 		goto err_rmdir;
 
+	f = debugfs_create_file("fdt_phys", 0400, dir, (void *)fdt,
+				&fdt_phys_fops);
+	if (IS_ERR(f))
+		goto err_rmdir;
+
 	dbg->dir = dir;
 	dbg->sub_fdt_dir = sub_fdt_dir;
 	return 0;
@@ -212,3 +226,9 @@ __init int kho_debugfs_init(void)
 		return -ENOENT;
 	return 0;
 }
+
+__init void kho_debugfs_cleanup(void)
+{
+	debugfs_remove_recursive(debugfs_root);
+	debugfs_root = NULL;
+}
diff --git a/kernel/liveupdate/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
index e9685e1ef6d7..38181076f603 100644
--- a/kernel/liveupdate/kexec_handover_internal.h
+++ b/kernel/liveupdate/kexec_handover_internal.h
@@ -24,16 +24,19 @@ extern unsigned int kho_bootmem_cnt;
 
 #ifdef CONFIG_KEXEC_HANDOVER_DEBUGFS
 int kho_debugfs_init(void);
+void kho_debugfs_cleanup(void);
 void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt);
-int kho_out_debugfs_init(struct kho_debugfs *dbg);
+int kho_out_debugfs_init(struct kho_debugfs *dbg, const void *fdt);
 int kho_debugfs_blob_add(struct kho_debugfs *dbg, const char *name,
 			 const void *blob, size_t size, bool root);
 void kho_debugfs_blob_remove(struct kho_debugfs *dbg, void *blob);
 #else
 static inline int kho_debugfs_init(void) { return 0; }
+static inline void kho_debugfs_cleanup(void) { }
 static inline void kho_in_debugfs_init(struct kho_debugfs *dbg,
 				       const void *fdt) { }
-static inline int kho_out_debugfs_init(struct kho_debugfs *dbg) { return 0; }
+static inline int kho_out_debugfs_init(struct kho_debugfs *dbg,
+				       const void *fdt) { return 0; }
 static inline int kho_debugfs_blob_add(struct kho_debugfs *dbg,
 				       const char *name, const void *blob,
 				       size_t size, bool root) { return 0; }
-- 
2.56.0.176.g3575e65682-goog

