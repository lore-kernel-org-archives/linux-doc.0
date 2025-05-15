Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF925D1EB
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333413; cv=none; b=tYhasAjFAG0Jc7hLXE1wt4LIsmcj4LIl2ME63tfzJSOeo3caxkgw/zY83ajnfIk/5SyIusqdYYsKiO7jQX6i3I5nSFe2Mm2KUuMLYJx6V/23dNGFiE1i13Oh+/prmI5h/mIlDvti/TtlJk0SlqYNf2YJ7moM9+LWWl4oLcof5fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333413; c=relaxed/simple;
	bh=ShMOScZ+Sqlf+fpOMRmaC+ihKQQUAlg+2zwLS0ko2/4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBA/0dv3i+CFnNh1551k2FAN6vVd0ERJ9yYDx9elqFJYicKRSswf257V+JbOR2S74Yaw5jIIsFF3RhbXBgI1SYVag5BqTCfeEj7hIOm5CSZFtJD50NjNkkGyzjtwqUQRwuaway5IKPyuSkANeFLya+rJfi4OuCdwqfKeSSEZvLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=2tQtI3Y0; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="2tQtI3Y0"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c54a9d3fcaso129344285a.2
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333408; x=1747938208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OA6MgJ6M49mplY2qbuxPQY2uALRjdw04ISOceScmNg8=;
        b=2tQtI3Y0XAPd11xYLA4zFRndQdAiJkZjpdxj8fopK/FI5qlMZHzxw3U0U24pNUeqWG
         FA3tCukbpHzK4fnVuWzlx7mozUviitcX7TGuE9lMqulWVjlgt6EHWiaLYGcy2tRYzRdg
         uK88yjMtEnQ10vTTZbk7v+kca4Us2iUDcwPtQf1FaGFDFRLUys0YCV24Q6Pg/PFP+lFk
         rHQGYdPERAWTPiL06ZB6+QKLJ79pszMdnL2H6t9tmJkf9fTU7Tsfkf2QvaaXvyH0gZAO
         eZ4PtbmoDZ12Q3u7ILuTW/MJS62gFE9d/eWmCo6dM3w6uyMfHvYUJrwRwRV78fU9Ll47
         OF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333408; x=1747938208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OA6MgJ6M49mplY2qbuxPQY2uALRjdw04ISOceScmNg8=;
        b=PXxEYEgxuVr6wvu9ouT/uyCoPGgVbqpSgm2YQNo7Phs121Jgs96c0lP3W9wSCBM8yA
         1WgibHy0/avGniu3TKai/xf7eNJ+fBM4+C9o1uJ6FHl7Jmr5sHUOZ//oNhEngjFwueRx
         2NM0vjzwPIreuMIWIzWKBRT5qxSETjOeQECvDGx2KT+JT29gx4c6gJRQkHTgVDHowbcb
         N4occ4xwVjgnpjd587m6w+aDXwRvNtqQ3PaFrLQUUtgrK9N0mWgpU1jleG1WL2fAFpKN
         DvwrW5sPYpLt9zwL0wG1twe6WWaNdhlJ3BrtSV0Pp/ZerhIx9pqaY9tEJY4Z/MBGXeLB
         N3/g==
X-Forwarded-Encrypted: i=1; AJvYcCUiIn2zIBCCTRMVEG3kst4KWpc9nPySkLbhnTksGUXphC5hkM5rSEhYj4MTM5hpwUirPSdNXT8hdGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlSkB9VJIkV0F4A01fMyzrapSED103mT05Qt5n/2d178rUchX5
	kGROZBWIpKy0ya2tusj2HI6Cw0ypJ5PO7xfbTtq8F3cI3LRdWf03MqGdzLnD8sJ+Luk=
X-Gm-Gg: ASbGncsLZGwwHf+VwF4HIWxlemibb4/eI23noqLn7RFVFRFqbIkFr6tOnodPBYHg9ht
	5L18cZsuCBGHxAIYDhypCTfAq5SYXLZUS4dB0aiXFDsMrRV9BG9aw6Dqa47X5+dFuSZAFL3CISG
	nFUDbuSnDPG+M8B8iXTp5eSoRztabTnZZwoX2ddtDXIPTeQiSnv8no8x1HdeXi8ms8LvViMJvHw
	iClF7k1OiybBlLQ3wkIS/LVWUlrgEu67tIwv4V+7RlBD3YuGRTlr6gskU1iJjQ6IqA14QKbSZtW
	r9+LfIT7dR+rowqS7CFQy96wzB+JIm9zuTXhT1nd9TlexKfOmOPTFgC61J6EZXV7fk98eMeBkWH
	mBicLSt84MGQlhJMmPCDLL0wPbH7u45rB4t+04/fbd2eMqz3rEP3SVgY=
X-Google-Smtp-Source: AGHT+IFwPiSy57KtfJPs+U7xuV9rBNdEF5m1qAdIOcGOHbCQUN56mz0k2pGRILRAf8vp0yD020I1uw==
X-Received: by 2002:a05:620a:2847:b0:7ca:f04b:3fa2 with SMTP id af79cd13be357-7cd4679cf74mr76951285a.38.1747333407852;
        Thu, 15 May 2025 11:23:27 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:27 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de
Subject: [RFC v2 01/16] kho: make debugfs interface optional
Date: Thu, 15 May 2025 18:23:05 +0000
Message-ID: <20250515182322.117840-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, KHO is controlled via debugfs interface, but once LUO is
introduced, it can control KHO, and the debug interface becomes
optional.

Add a separate config CONFIG_KEXEC_HANDOVER_DEBUG that enables
the debugfs interface, and allows to inspect the tree.

Move all debufs related code to a new file to keep the .c files
clear of ifdefs.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 MAINTAINERS                      |   3 +-
 kernel/Kconfig.kexec             |  10 ++
 kernel/Makefile                  |   1 +
 kernel/kexec_handover.c          | 271 ++-----------------------------
 kernel/kexec_handover_debug.c    | 237 +++++++++++++++++++++++++++
 kernel/kexec_handover_internal.h |  72 ++++++++
 6 files changed, 336 insertions(+), 258 deletions(-)
 create mode 100644 kernel/kexec_handover_debug.c
 create mode 100644 kernel/kexec_handover_internal.h

diff --git a/MAINTAINERS b/MAINTAINERS
index bdea634d63a9..4fc28b6674bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13143,12 +13143,13 @@ KEXEC HANDOVER (KHO)
 M:	Alexander Graf <graf@amazon.com>
 M:	Mike Rapoport <rppt@kernel.org>
 M:	Changyuan Lyu <changyuanl@google.com>
+M:	Pasha Tatashin <pasha.tatashin@soleen.com>
 L:	kexec@lists.infradead.org
 S:	Maintained
 F:	Documentation/admin-guide/mm/kho.rst
 F:	Documentation/core-api/kho/*
 F:	include/linux/kexec_handover.h
-F:	kernel/kexec_handover.c
+F:	kernel/kexec_handover*
 
 KEYS-ENCRYPTED
 M:	Mimi Zohar <zohar@linux.ibm.com>
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 4fa212909d69..44f9ac67ecbc 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -109,6 +109,16 @@ config KEXEC_HANDOVER
 	  to keep data or state alive across the kexec. For this to work,
 	  both source and target kernels need to have this option enabled.
 
+config KEXEC_HANDOVER_DEBUG
+	bool "kexec handover debug interface"
+	depends on KEXEC_HANDOVER
+	select DEBUG_FS
+	help
+	  Allow to control kexec handover device tree via debugfs
+	  interface, i.e. finalize the state or aborting the finalization.
+	  Also, enables inspecting the KHO fdt trees with the debugfs binary
+	  blobs.
+
 config CRASH_DUMP
 	bool "kernel crash dumps"
 	default ARCH_DEFAULT_CRASH_DUMP
diff --git a/kernel/Makefile b/kernel/Makefile
index 97c09847db42..ae44877c0300 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
 obj-$(CONFIG_KEXEC_ELF) += kexec_elf.o
 obj-$(CONFIG_KEXEC_HANDOVER) += kexec_handover.o
+obj-$(CONFIG_KEXEC_HANDOVER_DEBUG) += kexec_handover_debug.o
 obj-$(CONFIG_BACKTRACE_SELF_TEST) += backtracetest.o
 obj-$(CONFIG_COMPAT) += compat.o
 obj-$(CONFIG_CGROUPS) += cgroup/
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 69b953551677..5b65970e9746 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -10,7 +10,6 @@
 
 #include <linux/cma.h>
 #include <linux/count_zeros.h>
-#include <linux/debugfs.h>
 #include <linux/kexec.h>
 #include <linux/kexec_handover.h>
 #include <linux/libfdt.h>
@@ -27,6 +26,7 @@
  */
 #include "../mm/internal.h"
 #include "kexec_internal.h"
+#include "kexec_handover_internal.h"
 
 #define KHO_FDT_COMPATIBLE "kho-v1"
 #define PROP_PRESERVED_MEMORY_MAP "preserved-memory-map"
@@ -75,22 +75,8 @@ struct kho_mem_phys {
 	struct xarray phys_bits;
 };
 
-struct kho_mem_track {
-	/* Points to kho_mem_phys, each order gets its own bitmap tree */
-	struct xarray orders;
-};
-
 struct khoser_mem_chunk;
 
-struct kho_serialization {
-	struct page *fdt;
-	struct list_head fdt_list;
-	struct dentry *sub_fdt_dir;
-	struct kho_mem_track track;
-	/* First chunk of serialized preserved memory map */
-	struct khoser_mem_chunk *preserved_mem_map;
-};
-
 static void *xa_load_or_alloc(struct xarray *xa, unsigned long index, size_t sz)
 {
 	void *elm, *res;
@@ -355,8 +341,8 @@ static void __init kho_mem_deserialize(const void *fdt)
  * area for early allocations that happen before page allocator is
  * initialized.
  */
-static struct kho_scratch *kho_scratch;
-static unsigned int kho_scratch_cnt;
+struct kho_scratch *kho_scratch;
+unsigned int kho_scratch_cnt;
 
 /*
  * The scratch areas are scaled by default as percent of memory allocated from
@@ -542,37 +528,6 @@ static void __init kho_reserve_scratch(void)
 	kho_enable = false;
 }
 
-struct fdt_debugfs {
-	struct list_head list;
-	struct debugfs_blob_wrapper wrapper;
-	struct dentry *file;
-};
-
-static int kho_debugfs_fdt_add(struct list_head *list, struct dentry *dir,
-			       const char *name, const void *fdt)
-{
-	struct fdt_debugfs *f;
-	struct dentry *file;
-
-	f = kmalloc(sizeof(*f), GFP_KERNEL);
-	if (!f)
-		return -ENOMEM;
-
-	f->wrapper.data = (void *)fdt;
-	f->wrapper.size = fdt_totalsize(fdt);
-
-	file = debugfs_create_blob(name, 0400, dir, &f->wrapper);
-	if (IS_ERR(file)) {
-		kfree(f);
-		return PTR_ERR(file);
-	}
-
-	f->file = file;
-	list_add(&f->list, list);
-
-	return 0;
-}
-
 /**
  * kho_add_subtree - record the physical address of a sub FDT in KHO root tree.
  * @ser: serialization control object passed by KHO notifiers.
@@ -584,7 +539,8 @@ static int kho_debugfs_fdt_add(struct list_head *list, struct dentry *dir,
  * by KHO for the new kernel to retrieve it after kexec.
  *
  * A debugfs blob entry is also created at
- * ``/sys/kernel/debug/kho/out/sub_fdts/@name``.
+ * ``/sys/kernel/debug/kho/out/sub_fdts/@name`` when kernel is configured with
+ * CONFIG_KEXEC_HANDOVER_DEBUG
  *
  * Return: 0 on success, error code on failure
  */
@@ -601,22 +557,11 @@ int kho_add_subtree(struct kho_serialization *ser, const char *name, void *fdt)
 	if (err)
 		return err;
 
-	return kho_debugfs_fdt_add(&ser->fdt_list, ser->sub_fdt_dir, name, fdt);
+	return kho_debugfs_fdt_add(ser, name, fdt);
 }
 EXPORT_SYMBOL_GPL(kho_add_subtree);
 
-struct kho_out {
-	struct blocking_notifier_head chain_head;
-
-	struct dentry *dir;
-
-	struct mutex lock; /* protects KHO FDT finalization */
-
-	struct kho_serialization ser;
-	bool finalized;
-};
-
-static struct kho_out kho_out = {
+struct kho_out kho_out = {
 	.chain_head = BLOCKING_NOTIFIER_INIT(kho_out.chain_head),
 	.lock = __MUTEX_INITIALIZER(kho_out.lock),
 	.ser = {
@@ -707,30 +652,7 @@ int kho_preserve_phys(phys_addr_t phys, size_t size)
 }
 EXPORT_SYMBOL_GPL(kho_preserve_phys);
 
-/* Handling for debug/kho/out */
-
-static struct dentry *debugfs_root;
-
-static int kho_out_update_debugfs_fdt(void)
-{
-	int err = 0;
-	struct fdt_debugfs *ff, *tmp;
-
-	if (kho_out.finalized) {
-		err = kho_debugfs_fdt_add(&kho_out.ser.fdt_list, kho_out.dir,
-					  "fdt", page_to_virt(kho_out.ser.fdt));
-	} else {
-		list_for_each_entry_safe(ff, tmp, &kho_out.ser.fdt_list, list) {
-			debugfs_remove(ff->file);
-			list_del(&ff->list);
-			kfree(ff);
-		}
-	}
-
-	return err;
-}
-
-static int kho_abort(void)
+int __kho_abort(void)
 {
 	int err;
 	unsigned long order;
@@ -763,7 +685,7 @@ static int kho_abort(void)
 	return err;
 }
 
-static int kho_finalize(void)
+int __kho_finalize(void)
 {
 	int err = 0;
 	u64 *preserved_mem_map;
@@ -806,117 +728,13 @@ static int kho_finalize(void)
 abort:
 	if (err) {
 		pr_err("Failed to convert KHO state tree: %d\n", err);
-		kho_abort();
+		__kho_abort();
 	}
 
 	return err;
 }
 
-static int kho_out_finalize_get(void *data, u64 *val)
-{
-	mutex_lock(&kho_out.lock);
-	*val = kho_out.finalized;
-	mutex_unlock(&kho_out.lock);
-
-	return 0;
-}
-
-static int kho_out_finalize_set(void *data, u64 _val)
-{
-	int ret = 0;
-	bool val = !!_val;
-
-	mutex_lock(&kho_out.lock);
-
-	if (val == kho_out.finalized) {
-		if (kho_out.finalized)
-			ret = -EEXIST;
-		else
-			ret = -ENOENT;
-		goto unlock;
-	}
-
-	if (val)
-		ret = kho_finalize();
-	else
-		ret = kho_abort();
-
-	if (ret)
-		goto unlock;
-
-	kho_out.finalized = val;
-	ret = kho_out_update_debugfs_fdt();
-
-unlock:
-	mutex_unlock(&kho_out.lock);
-	return ret;
-}
-
-DEFINE_DEBUGFS_ATTRIBUTE(fops_kho_out_finalize, kho_out_finalize_get,
-			 kho_out_finalize_set, "%llu\n");
-
-static int scratch_phys_show(struct seq_file *m, void *v)
-{
-	for (int i = 0; i < kho_scratch_cnt; i++)
-		seq_printf(m, "0x%llx\n", kho_scratch[i].addr);
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(scratch_phys);
-
-static int scratch_len_show(struct seq_file *m, void *v)
-{
-	for (int i = 0; i < kho_scratch_cnt; i++)
-		seq_printf(m, "0x%llx\n", kho_scratch[i].size);
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(scratch_len);
-
-static __init int kho_out_debugfs_init(void)
-{
-	struct dentry *dir, *f, *sub_fdt_dir;
-
-	dir = debugfs_create_dir("out", debugfs_root);
-	if (IS_ERR(dir))
-		return -ENOMEM;
-
-	sub_fdt_dir = debugfs_create_dir("sub_fdts", dir);
-	if (IS_ERR(sub_fdt_dir))
-		goto err_rmdir;
-
-	f = debugfs_create_file("scratch_phys", 0400, dir, NULL,
-				&scratch_phys_fops);
-	if (IS_ERR(f))
-		goto err_rmdir;
-
-	f = debugfs_create_file("scratch_len", 0400, dir, NULL,
-				&scratch_len_fops);
-	if (IS_ERR(f))
-		goto err_rmdir;
-
-	f = debugfs_create_file("finalize", 0600, dir, NULL,
-				&fops_kho_out_finalize);
-	if (IS_ERR(f))
-		goto err_rmdir;
-
-	kho_out.dir = dir;
-	kho_out.ser.sub_fdt_dir = sub_fdt_dir;
-	return 0;
-
-err_rmdir:
-	debugfs_remove_recursive(dir);
-	return -ENOENT;
-}
-
-struct kho_in {
-	struct dentry *dir;
-	phys_addr_t fdt_phys;
-	phys_addr_t scratch_phys;
-	struct list_head fdt_list;
-};
-
-static struct kho_in kho_in = {
+struct kho_in kho_in = {
 	.fdt_list = LIST_HEAD_INIT(kho_in.fdt_list),
 };
 
@@ -961,56 +779,6 @@ int kho_retrieve_subtree(const char *name, phys_addr_t *phys)
 }
 EXPORT_SYMBOL_GPL(kho_retrieve_subtree);
 
-/* Handling for debugfs/kho/in */
-
-static __init int kho_in_debugfs_init(const void *fdt)
-{
-	struct dentry *sub_fdt_dir;
-	int err, child;
-
-	kho_in.dir = debugfs_create_dir("in", debugfs_root);
-	if (IS_ERR(kho_in.dir))
-		return PTR_ERR(kho_in.dir);
-
-	sub_fdt_dir = debugfs_create_dir("sub_fdts", kho_in.dir);
-	if (IS_ERR(sub_fdt_dir)) {
-		err = PTR_ERR(sub_fdt_dir);
-		goto err_rmdir;
-	}
-
-	err = kho_debugfs_fdt_add(&kho_in.fdt_list, kho_in.dir, "fdt", fdt);
-	if (err)
-		goto err_rmdir;
-
-	fdt_for_each_subnode(child, fdt, 0) {
-		int len = 0;
-		const char *name = fdt_get_name(fdt, child, NULL);
-		const u64 *fdt_phys;
-
-		fdt_phys = fdt_getprop(fdt, child, "fdt", &len);
-		if (!fdt_phys)
-			continue;
-		if (len != sizeof(*fdt_phys)) {
-			pr_warn("node `%s`'s prop `fdt` has invalid length: %d\n",
-				name, len);
-			continue;
-		}
-		err = kho_debugfs_fdt_add(&kho_in.fdt_list, sub_fdt_dir, name,
-					  phys_to_virt(*fdt_phys));
-		if (err) {
-			pr_warn("failed to add fdt `%s` to debugfs: %d\n", name,
-				err);
-			continue;
-		}
-	}
-
-	return 0;
-
-err_rmdir:
-	debugfs_remove_recursive(kho_in.dir);
-	return err;
-}
-
 static __init int kho_init(void)
 {
 	int err = 0;
@@ -1025,27 +793,16 @@ static __init int kho_init(void)
 		goto err_free_scratch;
 	}
 
-	debugfs_root = debugfs_create_dir("kho", NULL);
-	if (IS_ERR(debugfs_root)) {
-		err = -ENOENT;
+	err = kho_debugfs_init();
+	if (err)
 		goto err_free_fdt;
-	}
 
 	err = kho_out_debugfs_init();
 	if (err)
 		goto err_free_fdt;
 
 	if (fdt) {
-		err = kho_in_debugfs_init(fdt);
-		/*
-		 * Failure to create /sys/kernel/debug/kho/in does not prevent
-		 * reviving state from KHO and setting up KHO for the next
-		 * kexec.
-		 */
-		if (err)
-			pr_err("failed exposing handover FDT in debugfs: %d\n",
-			       err);
-
+		kho_in_debugfs_init(fdt);
 		return 0;
 	}
 
diff --git a/kernel/kexec_handover_debug.c b/kernel/kexec_handover_debug.c
new file mode 100644
index 000000000000..696131a3480f
--- /dev/null
+++ b/kernel/kexec_handover_debug.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * kexec_handover.c - kexec handover metadata processing
+ * Copyright (C) 2023 Alexander Graf <graf@amazon.com>
+ * Copyright (C) 2025 Microsoft Corporation, Mike Rapoport <rppt@kernel.org>
+ * Copyright (C) 2025 Google LLC, Changyuan Lyu <changyuanl@google.com>
+ * Copyright (C) 2025 Google LLC, Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+#define pr_fmt(fmt) "KHO: " fmt
+
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/libfdt.h>
+#include <linux/mm.h>
+#include "kexec_handover_internal.h"
+
+static struct dentry *debugfs_root;
+
+struct fdt_debugfs {
+	struct list_head list;
+	struct debugfs_blob_wrapper wrapper;
+	struct dentry *file;
+};
+
+static int __kho_debugfs_fdt_add(struct list_head *list, struct dentry *dir,
+				 const char *name, const void *fdt)
+{
+	struct fdt_debugfs *f;
+	struct dentry *file;
+
+	f = kmalloc(sizeof(*f), GFP_KERNEL);
+	if (!f)
+		return -ENOMEM;
+
+	f->wrapper.data = (void *)fdt;
+	f->wrapper.size = fdt_totalsize(fdt);
+
+	file = debugfs_create_blob(name, 0400, dir, &f->wrapper);
+	if (IS_ERR(file)) {
+		kfree(f);
+		return PTR_ERR(file);
+	}
+
+	f->file = file;
+	list_add(&f->list, list);
+
+	return 0;
+}
+
+int kho_debugfs_fdt_add(struct kho_serialization *ser, const char *name,
+			const void *fdt)
+{
+	return __kho_debugfs_fdt_add(&ser->fdt_list, ser->sub_fdt_dir, name,
+				     fdt);
+}
+
+static int kho_out_update_debugfs_fdt(void)
+{
+	int err = 0;
+	struct fdt_debugfs *ff, *tmp;
+
+	if (kho_out.finalized) {
+		err = __kho_debugfs_fdt_add(&kho_out.ser.fdt_list, kho_out.dir,
+					    "fdt",
+					    page_to_virt(kho_out.ser.fdt));
+	} else {
+		list_for_each_entry_safe(ff, tmp, &kho_out.ser.fdt_list, list) {
+			debugfs_remove(ff->file);
+			list_del(&ff->list);
+			kfree(ff);
+		}
+	}
+
+	return err;
+}
+
+static int kho_out_finalize_get(void *data, u64 *val)
+{
+	mutex_lock(&kho_out.lock);
+	*val = kho_out.finalized;
+	mutex_unlock(&kho_out.lock);
+
+	return 0;
+}
+
+static int kho_out_finalize_set(void *data, u64 _val)
+{
+	int ret = 0;
+	bool val = !!_val;
+
+	mutex_lock(&kho_out.lock);
+
+	if (val == kho_out.finalized) {
+		if (kho_out.finalized)
+			ret = -EEXIST;
+		else
+			ret = -ENOENT;
+		goto unlock;
+	}
+
+	if (val)
+		ret = __kho_finalize();
+	else
+		ret = __kho_abort();
+
+	if (ret)
+		goto unlock;
+
+	kho_out.finalized = val;
+	ret = kho_out_update_debugfs_fdt();
+
+unlock:
+	mutex_unlock(&kho_out.lock);
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_kho_out_finalize, kho_out_finalize_get,
+			 kho_out_finalize_set, "%llu\n");
+
+static int scratch_phys_show(struct seq_file *m, void *v)
+{
+	for (int i = 0; i < kho_scratch_cnt; i++)
+		seq_printf(m, "0x%llx\n", kho_scratch[i].addr);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(scratch_phys);
+
+static int scratch_len_show(struct seq_file *m, void *v)
+{
+	for (int i = 0; i < kho_scratch_cnt; i++)
+		seq_printf(m, "0x%llx\n", kho_scratch[i].size);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(scratch_len);
+
+__init void kho_in_debugfs_init(const void *fdt)
+{
+	struct dentry *sub_fdt_dir;
+	int err, child;
+
+	kho_in.dir = debugfs_create_dir("in", debugfs_root);
+	if (IS_ERR(kho_in.dir)) {
+		err = PTR_ERR(kho_in.dir);
+		goto err_out;
+	}
+
+	sub_fdt_dir = debugfs_create_dir("sub_fdts", kho_in.dir);
+	if (IS_ERR(sub_fdt_dir)) {
+		err = PTR_ERR(sub_fdt_dir);
+		goto err_rmdir;
+	}
+
+	err = __kho_debugfs_fdt_add(&kho_in.fdt_list, kho_in.dir, "fdt", fdt);
+	if (err)
+		goto err_rmdir;
+
+	fdt_for_each_subnode(child, fdt, 0) {
+		int len = 0;
+		const char *name = fdt_get_name(fdt, child, NULL);
+		const u64 *fdt_phys;
+
+		fdt_phys = fdt_getprop(fdt, child, "fdt", &len);
+		if (!fdt_phys)
+			continue;
+		if (len != sizeof(*fdt_phys)) {
+			pr_warn("node `%s`'s prop `fdt` has invalid length: %d\n",
+				name, len);
+			continue;
+		}
+		err = __kho_debugfs_fdt_add(&kho_in.fdt_list, sub_fdt_dir, name,
+					    phys_to_virt(*fdt_phys));
+		if (err) {
+			pr_warn("failed to add fdt `%s` to debugfs: %d\n", name,
+				err);
+			continue;
+		}
+	}
+
+	return;
+err_rmdir:
+	debugfs_remove_recursive(kho_in.dir);
+err_out:
+	/*
+	 * Failure to create /sys/kernel/debug/kho/in does not prevent
+	 * reviving state from KHO and setting up KHO for the next
+	 * kexec.
+	 */
+	if (err)
+		pr_err("failed exposing handover FDT in debugfs: %d\n", err);
+}
+
+__init int kho_out_debugfs_init(void)
+{
+	struct dentry *dir, *f, *sub_fdt_dir;
+
+	dir = debugfs_create_dir("out", debugfs_root);
+	if (IS_ERR(dir))
+		return -ENOMEM;
+
+	sub_fdt_dir = debugfs_create_dir("sub_fdts", dir);
+	if (IS_ERR(sub_fdt_dir))
+		goto err_rmdir;
+
+	f = debugfs_create_file("scratch_phys", 0400, dir, NULL,
+				&scratch_phys_fops);
+	if (IS_ERR(f))
+		goto err_rmdir;
+
+	f = debugfs_create_file("scratch_len", 0400, dir, NULL,
+				&scratch_len_fops);
+	if (IS_ERR(f))
+		goto err_rmdir;
+
+	f = debugfs_create_file("finalize", 0600, dir, NULL,
+				&fops_kho_out_finalize);
+	if (IS_ERR(f))
+		goto err_rmdir;
+
+	kho_out.dir = dir;
+	kho_out.ser.sub_fdt_dir = sub_fdt_dir;
+	return 0;
+
+err_rmdir:
+	debugfs_remove_recursive(dir);
+	return -ENOENT;
+}
+
+__init int kho_debugfs_init(void)
+{
+	debugfs_root = debugfs_create_dir("kho", NULL);
+	if (IS_ERR(debugfs_root))
+		return -ENOENT;
+	return 0;
+}
diff --git a/kernel/kexec_handover_internal.h b/kernel/kexec_handover_internal.h
new file mode 100644
index 000000000000..65ff0f651192
--- /dev/null
+++ b/kernel/kexec_handover_internal.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_KEXEC_HANDOVER_INTERNAL_H
+#define LINUX_KEXEC_HANDOVER_INTERNAL_H
+
+#include <linux/kexec_handover.h>
+#include <linux/list.h>
+#include <linux/types.h>
+
+#ifdef CONFIG_KEXEC_HANDOVER_DEBUG
+#include <linux/debugfs.h>
+#endif
+
+struct kho_mem_track {
+	/* Points to kho_mem_phys, each order gets its own bitmap tree */
+	struct xarray orders;
+};
+
+struct kho_serialization {
+	struct page *fdt;
+	struct list_head fdt_list;
+	struct kho_mem_track track;
+	/* First chunk of serialized preserved memory map */
+	struct khoser_mem_chunk *preserved_mem_map;
+#ifdef CONFIG_KEXEC_HANDOVER_DEBUG
+	struct dentry *sub_fdt_dir;
+#endif
+};
+
+struct kho_in {
+	phys_addr_t fdt_phys;
+	phys_addr_t scratch_phys;
+	struct list_head fdt_list;
+#ifdef CONFIG_KEXEC_HANDOVER_DEBUG
+	struct dentry *dir;
+#endif
+};
+
+struct kho_out {
+	struct blocking_notifier_head chain_head;
+	struct mutex lock; /* protects KHO FDT finalization */
+	struct kho_serialization ser;
+	bool finalized;
+#ifdef CONFIG_KEXEC_HANDOVER_DEBUG
+	struct dentry *dir;
+#endif
+};
+
+extern struct kho_in kho_in;
+extern struct kho_out kho_out;
+
+extern struct kho_scratch *kho_scratch;
+extern unsigned int kho_scratch_cnt;
+
+int __kho_finalize(void);
+int __kho_abort(void);
+
+#ifdef CONFIG_KEXEC_HANDOVER_DEBUG
+int kho_debugfs_init(void);
+void kho_in_debugfs_init(const void *fdt);
+int kho_out_debugfs_init(void);
+int kho_debugfs_fdt_add(struct kho_serialization *ser, const char *name,
+			const void *fdt);
+#else
+static inline int kho_debugfs_init(void) { return 0; }
+static inline void kho_in_debugfs_init(const void *fdt) { }
+static inline int kho_out_debugfs_init(void) { return 0; }
+static inline int kho_debugfs_fdt_add(struct kho_serialization *ser,
+				      const char *name,
+				      const void *fdt) { return 0; }
+#endif /* CONFIG_KEXEC_HANDOVER_DEBUG */
+
+#endif /* LINUX_KEXEC_HANDOVER_INTERNAL_H */
-- 
2.49.0.1101.gccaa498523-goog

