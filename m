Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F48B672
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 18:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362357; cv=none; b=rfukrCyzPozdrC+kRMTOT03upCS2v9rQrZxVUsAiZighbai+jqmQwNT3MYXjQkOekE471frGTWtZiB7lAkqF7/JwrkhmxrWdPrFq49BThLW9vCsLJ1oFz8ejYDLlBlN7wsAXFK3hC57NXS9rqlinknhStgIdtMroDqQ2/qgxi/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362357; c=relaxed/simple;
	bh=FUkvdWJwu6Tp6vBtppCyT+FptcFb98EzLBnclOOXgYU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=myhk2+fSWTbUcLUra1y5MRYJLb4PbUnKtXMOPqbvBjrqpuSpubUFcklcGxAl2drrUcEY0MOOus7LMmmDiUPReSj2DSeQbWmIz79od24zA5O5ORaHz5z3uc1xSa7qmd8qWN93torqi4rJKIyZXVIpVeU84us/dj8OLMoQTBdZ4zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JCE8y4BV; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JCE8y4BV"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c89956023dbso4366752a12.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 11:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783362355; x=1783967155; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7lfZp5DIykJmBXzZZseK2vblkAIMJZ1w1tIpIkuiJ5w=;
        b=JCE8y4BV5gHTr+yCIikTHfFEO3zZnDwrt0WDVuXRnh29xqhmCbbH5K+o3kvZrj6MYj
         LZBbnz1WQJUYboB9lC2QPIegUNkPITqhtWo98kH0rZHU4yiffhNySjoskRXB86/v2XAd
         ISMZk96jrjeqhC1E1L1PWUxPblFSoH52u7q1UcGd+/rEZ/DN4Zyaq+RI/qZhPlMVDYM+
         zy7hbOfhLL4l4+tqY5xg+72zB5WIahcF1H7t4muDEMoGeDXvBR+5Gt3qja2X5ItQC/aQ
         kZD1tPsSx4vhRk2t6d7scgaUAuuaomopbCUvVzxx1z5dLMe7XxeN6TFb1Oy/dSAKjLSf
         k+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362355; x=1783967155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lfZp5DIykJmBXzZZseK2vblkAIMJZ1w1tIpIkuiJ5w=;
        b=Y2dk8+/eCUC6HSEvlzzTr+PorUotDNVbuRm5vARGTCaFu77IWXmM4nTvY6FFNv//bv
         tMCqbBwHOuAIgVtOU8xytvySXjqmg3eb6tKmLc5qIPEHs/3ZGmKjlWg4G2YEBVYlSEkx
         Vg3eYt5yFuPzOrRH2vDuApqtEtst879oVc/XozpnnR1geqQzFq90OKD5niq7U4z790rB
         ecj0BtVOvbf6RwHdc0aZUVqSxeX2nXVWXLbav5e7ELIDsdMbOQiLOiQ0L7lPRrtz+LjF
         eNm0MVdFJTdo7xLEPBp7eWA4R2+iwx4iOcRAMAOxTCfCX8p2YN/u/EKSJU73ME1M22UN
         gQ+w==
X-Forwarded-Encrypted: i=1; AHgh+RqE5YEdxBeqVafap53HBK97N/JzCx6zSh8Nl++EZFh+euvD2DaHWuTNs99y7he3RLuP6xyH8EQJZjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyexAe2i9mUPvmSKftluQu43uBnpX5oGjN49KRlj9uTxmW9guus
	P3Iprgf6eOtxam6Idd8PDVEN4FOzgp+7ZoywesndaDbb19pDUSXr5bNsF7efUdmb64Y2b4xkYN5
	iwsSkaZVCz62ULmTSFTLN2sahTqP+RSOsMg==
X-Received: from dlbsw7.prod.google.com ([2002:a05:7022:3a87:b0:13a:1e7:e4fc])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:2799:20b0:3bf:49c8:f73 with SMTP id adf61e73a8af0-3c08eed6b4cmr1216687637.35.1783362355164;
 Mon, 06 Jul 2026 11:25:55 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:25:44 +0000
In-Reply-To: <cover.1783361692.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783361692.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <f9ce7c708346413113b87f1391e7a5e6b1e36db5.1783361692.git.abhishekbapat@google.com>
Subject: [PATCH v7 1/6] alloc_tag: add ioctl to /proc/allocinfo
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Suren Baghdasaryan <surenb@google.com>

Add the following ioctl commands for /proc/allocinfo file:

ALLOCINFO_IOC_CONTENT_ID - gets content identifier which can be used
to check whether the file content has changed specifically due to module
load/unload. Every time a module is loaded / unloaded, the returned
value will be different. By comparing the identifier value at the
beginning and at the end of the content retrieval operation, users can
validate retrieved information for consistency.

ALLOCINFO_IOC_GET_AT - gets the record at the specified position. This
is the position of a record in /proc/allocinfo.

ALLOCINFO_IOC_GET_NEXT - gets the record next to the last retrieved
one. If no records were previously retrieved, returns the first
record.

Note, function file and module names often have the same prefixes,
therefore when filtering for them, we compare the last 64 characters to
minimize the chances of name collisions.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
Acked-by: Hao Ge <hao.ge@linux.dev>
---
 Documentation/mm/allocation-profiling.rst     |   5 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   1 +
 include/linux/codetag.h                       |   2 +
 include/uapi/linux/alloc_tag.h                |  65 +++++
 lib/codetag.c                                 |  18 ++
 mm/alloc_tag.c                                | 238 +++++++++++++++++-
 7 files changed, 329 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/alloc_tag.h

diff --git a/Documentation/mm/allocation-profiling.rst b/Documentation/mm/allocation-profiling.rst
index 5389d241176a..c3a28467955f 100644
--- a/Documentation/mm/allocation-profiling.rst
+++ b/Documentation/mm/allocation-profiling.rst
@@ -46,6 +46,11 @@ sysctl:
 Runtime info:
   /proc/allocinfo
 
+  Profiling data can be retrieved either by reading `/proc/allocinfo` directly as
+  text or programmatically via `ioctl()` calls defined in `<uapi/linux/alloc_tag.h>`.
+  The ioctl interface supports structured binary data extraction as well as filtering
+  by module name, function, file, line number, accuracy, or allocation size limits.
+
 Example output::
 
   root@moria-kvm:~# sort -g /proc/allocinfo|tail|numfmt --to=iec
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 3f0ef1e27eb0..2fc53093752d 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -346,6 +346,8 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:luzmaximilian@gmail.com>
 0xA5  20-2F  linux/surface_aggregator/dtx.h                            Microsoft Surface DTX driver
                                                                        <mailto:luzmaximilian@gmail.com>
+0xA6  00-0F  uapi/linux/alloc_tag.h                                    Memory allocation profiling
+                                                                       <mailto:surenb@google.com>
 0xAA  00-3F  linux/uapi/linux/userfaultfd.h
 0xAB  00-1F  linux/nbd.h
 0xAC  00-1F  linux/raw.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 29c302e9c17b..200b92ec1ef6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16937,6 +16937,7 @@ S:	Maintained
 F:	Documentation/mm/allocation-profiling.rst
 F:	include/linux/alloc_tag.h
 F:	include/linux/pgalloc_tag.h
+F:	include/uapi/linux/alloc_tag.h
 F:	mm/alloc_tag.c
 
 MEMORY MANAGEMENT - BALLOON
diff --git a/include/linux/codetag.h b/include/linux/codetag.h
index ddae7484ca45..a25a085c2df1 100644
--- a/include/linux/codetag.h
+++ b/include/linux/codetag.h
@@ -77,6 +77,8 @@ struct codetag_iterator {
 void codetag_lock_module_list(struct codetag_type *cttype);
 bool codetag_trylock_module_list(struct codetag_type *cttype);
 void codetag_unlock_module_list(struct codetag_type *cttype);
+unsigned long codetag_get_content_id(struct codetag_type *cttype);
+unsigned int codetag_get_count(struct codetag_type *cttype);
 struct codetag_iterator codetag_get_ct_iter(struct codetag_type *cttype);
 struct codetag *codetag_next_ct(struct codetag_iterator *iter);
 
diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
new file mode 100644
index 000000000000..ee6a023cbaf4
--- /dev/null
+++ b/include/uapi/linux/alloc_tag.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * alloc_tag IOCTL API definition
+ *
+ * Copyright (C) 2026 Google, LLC.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _UAPI_ALLOC_TAG_H
+#define _UAPI_ALLOC_TAG_H
+
+#include <linux/types.h>
+
+/*
+ * Function, file and module names often have the same prefixes, therefore
+ * when filtering by these criteria, we compare the last 64 characters to
+ * minimize the chances of name collisions
+ */
+#define ALLOCINFO_STR_SIZE	64
+
+struct allocinfo_content_id {
+	__u64 id;
+};
+
+struct allocinfo_tag {
+	/* Longer names are trimmed */
+	char modname[ALLOCINFO_STR_SIZE];
+	char function[ALLOCINFO_STR_SIZE];
+	char filename[ALLOCINFO_STR_SIZE];
+	__u64 lineno;
+};
+
+/* The alignment ensures 32-bit compatible interfaces are not broken */
+struct allocinfo_counter {
+	__u64 bytes;
+	__u64 calls;
+	__u8 accurate;
+} __attribute__((aligned(8)));
+
+struct allocinfo_tag_data {
+	struct allocinfo_tag tag;
+	struct allocinfo_counter counter;
+};
+
+struct allocinfo_get_at {
+	__u64 pos;	/* input */
+	struct allocinfo_tag_data data;
+};
+
+#define _ALLOCINFO_IOC_CONTENT_ID	0
+#define _ALLOCINFO_IOC_GET_AT		1
+#define _ALLOCINFO_IOC_GET_NEXT		2
+
+#define ALLOCINFO_IOC_BASE		0xA6
+#define ALLOCINFO_IOC_CONTENT_ID	_IOR(ALLOCINFO_IOC_BASE, _ALLOCINFO_IOC_CONTENT_ID,	\
+					     struct allocinfo_content_id)
+#define ALLOCINFO_IOC_GET_AT		_IOWR(ALLOCINFO_IOC_BASE, _ALLOCINFO_IOC_GET_AT,	\
+					      struct allocinfo_get_at)
+#define ALLOCINFO_IOC_GET_NEXT		_IOR(ALLOCINFO_IOC_BASE, _ALLOCINFO_IOC_GET_NEXT,	\
+					     struct allocinfo_tag_data)
+
+#endif /* _UAPI_ALLOC_TAG_H */
diff --git a/lib/codetag.c b/lib/codetag.c
index 4001a7ea6675..a9cda4c962a3 100644
--- a/lib/codetag.c
+++ b/lib/codetag.c
@@ -19,6 +19,8 @@ struct codetag_type {
 	struct codetag_type_desc desc;
 	/* generates unique sequence number for module load */
 	unsigned long next_mod_seq;
+	/* bumped on every module load and unload */
+	unsigned long content_id;
 };
 
 struct codetag_range {
@@ -50,6 +52,20 @@ void codetag_unlock_module_list(struct codetag_type *cttype)
 	up_read(&cttype->mod_lock);
 }
 
+unsigned long codetag_get_content_id(struct codetag_type *cttype)
+{
+	lockdep_assert_held(&cttype->mod_lock);
+
+	return cttype->content_id;
+}
+
+unsigned int codetag_get_count(struct codetag_type *cttype)
+{
+	lockdep_assert_held(&cttype->mod_lock);
+
+	return cttype->count;
+}
+
 struct codetag_iterator codetag_get_ct_iter(struct codetag_type *cttype)
 {
 	struct codetag_iterator iter = {
@@ -204,6 +220,7 @@ static int codetag_module_init(struct codetag_type *cttype, struct module *mod)
 
 	down_write(&cttype->mod_lock);
 	cmod->mod_seq = ++cttype->next_mod_seq;
+	++cttype->content_id;
 	mod_id = idr_alloc(&cttype->mod_idr, cmod, 0, 0, GFP_KERNEL);
 	if (mod_id >= 0) {
 		if (cttype->desc.module_load) {
@@ -368,6 +385,7 @@ void codetag_unload_module(struct module *mod)
 			cttype->count -= range_size(cttype, &cmod->range);
 			idr_remove(&cttype->mod_idr, mod_id);
 			kfree(cmod);
+			++cttype->content_id;
 		}
 		up_write(&cttype->mod_lock);
 		if (found && cttype->desc.free_section_mem)
diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index d9be1cf5187d..c73195000830 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -5,6 +5,7 @@
 #include <linux/gfp.h>
 #include <linux/kallsyms.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/page_ext.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/proc_fs.h>
@@ -14,6 +15,7 @@
 #include <linux/string_choices.h>
 #include <linux/vmalloc.h>
 #include <linux/kmemleak.h>
+#include <uapi/linux/alloc_tag.h>
 
 #define ALLOCINFO_FILE_NAME		"allocinfo"
 #define MODULE_ALLOC_TAG_VMAP_SIZE	(100000UL * sizeof(struct alloc_tag))
@@ -47,6 +49,10 @@ struct allocinfo_private {
 	struct codetag_iterator iter;
 	struct codetag_iterator reported_iter;
 	bool print_header;
+	/* ioctl uses a separate iterator not to interfere with reads */
+	struct codetag_iterator ioctl_iter;
+	bool positioned; /* seq_open_private() sets to 0 */
+	struct mutex ioctl_lock;
 };
 
 static void *allocinfo_start(struct seq_file *m, loff_t *pos)
@@ -130,6 +136,235 @@ static const struct seq_operations allocinfo_seq_op = {
 	.show	= allocinfo_show,
 };
 
+/*
+ * Initializes seq_file operations and allocates private state when opening
+ * the /proc/allocinfo procfs entry.
+ */
+static int allocinfo_open(struct inode *inode, struct file *file)
+{
+	int ret;
+
+	ret = seq_open_private(file, &allocinfo_seq_op,
+			       sizeof(struct allocinfo_private));
+	if (!ret) {
+		struct seq_file *m = file->private_data;
+		struct allocinfo_private *priv = m->private;
+
+		mutex_init(&priv->ioctl_lock);
+	}
+	return ret;
+}
+
+/*
+ * Cleans up the seq_file state and frees up the private state allocated in
+ * allocinfo_open() when closing the /proc/allocinfo file descriptor.
+ */
+static int allocinfo_release(struct inode *inode, struct file *file)
+{
+	struct seq_file *m = file->private_data;
+	struct allocinfo_private *priv = m->private;
+
+	mutex_destroy(&priv->ioctl_lock);
+	return seq_release_private(inode, file);
+}
+
+/*
+ * Returns a pointer to the suffix of a string so that its length fits within
+ * ALLOCINFO_STR_SIZE, preserving the trailing characters.
+ * Function, file and module names often have the same prefixes, therefore
+ * when filtering by these criteria, we compare the last 64 characters to
+ * minimize the chances of name collisions
+ */
+static const char *allocinfo_str(const char *str)
+{
+	size_t len = strlen(str);
+
+	/* Keep an extra space for the trailing NULL. */
+	if (len >= ALLOCINFO_STR_SIZE)
+		str += (len - ALLOCINFO_STR_SIZE) + 1;
+	return str;
+}
+
+/* Copy a string and trim from the beginning if it's too long */
+static void allocinfo_copy_str(char *dest, const char *src)
+{
+	strscpy_pad(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
+}
+
+/*
+ * Populates the UAPI allocinfo_tag_data structure with active runtime
+ * profiling counters extracted from the given kernel codetag.
+ */
+static void allocinfo_to_params(struct codetag *ct,
+				struct allocinfo_tag_data *data)
+{
+	struct alloc_tag *tag = ct_to_alloc_tag(ct);
+	struct alloc_tag_counters counter = alloc_tag_read(tag);
+
+	if (ct->modname)
+		allocinfo_copy_str(data->tag.modname, ct->modname);
+	else
+		data->tag.modname[0] = '\0';
+	allocinfo_copy_str(data->tag.function, ct->function);
+	allocinfo_copy_str(data->tag.filename, ct->filename);
+	data->tag.lineno = ct->lineno;
+	data->counter.bytes = counter.bytes;
+	data->counter.calls = counter.calls;
+	data->counter.accurate = !alloc_tag_is_inaccurate(tag);
+}
+
+/*
+ * Retrieves the unique content ID representing the current allocation tag module
+ * layout, allowing userspace to detect if modules were loaded / unloaded.
+ */
+static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
+{
+	struct allocinfo_content_id params;
+
+	codetag_lock_module_list(alloc_tag_cttype);
+	params.id = codetag_get_content_id(alloc_tag_cttype);
+	codetag_unlock_module_list(alloc_tag_cttype);
+	if (copy_to_user(arg, &params, sizeof(params)))
+		return -EFAULT;
+
+	return 0;
+}
+
+/*
+ * Seeks the ioctl iterator to the specified 0-indexed tag position, reads its
+ * profiling data and returns it to userspace.
+ */
+static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
+{
+	struct allocinfo_private *priv;
+	struct codetag *ct;
+	__u64 pos;
+	struct allocinfo_get_at params = {0};
+
+	if (copy_from_user(&params, arg, sizeof(params)))
+		return -EFAULT;
+
+	priv = m->private;
+	pos = params.pos;
+
+	mutex_lock(&priv->ioctl_lock);
+	codetag_lock_module_list(alloc_tag_cttype);
+
+	if (pos >= codetag_get_count(alloc_tag_cttype)) {
+		codetag_unlock_module_list(alloc_tag_cttype);
+		mutex_unlock(&priv->ioctl_lock);
+		return -ENOENT;
+	}
+
+	/* Find the codetag */
+	priv->ioctl_iter = codetag_get_ct_iter(alloc_tag_cttype);
+	ct = codetag_next_ct(&priv->ioctl_iter);
+	while (ct && pos--)
+		ct = codetag_next_ct(&priv->ioctl_iter);
+	if (ct) {
+		allocinfo_to_params(ct, &params.data);
+		priv->positioned = true;
+	}
+
+	codetag_unlock_module_list(alloc_tag_cttype);
+	mutex_unlock(&priv->ioctl_lock);
+
+	if (!ct)
+		return -ENOENT;
+
+	if (copy_to_user(arg, &params, sizeof(params)))
+		return -EFAULT;
+
+	return 0;
+}
+
+/*
+ * Advances the ioctl iterator to the next allocation tag in the sequence and
+ * returns its profiling data to userspace.
+ */
+static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
+{
+	struct allocinfo_private *priv;
+	struct codetag *ct;
+	struct allocinfo_tag_data params;
+	int ret = 0;
+
+	memset(&params, 0, sizeof(params));
+	priv = m->private;
+
+	mutex_lock(&priv->ioctl_lock);
+	codetag_lock_module_list(alloc_tag_cttype);
+
+	if (!priv->positioned) {
+		priv->ioctl_iter = codetag_get_ct_iter(alloc_tag_cttype);
+		priv->positioned = true;
+	}
+
+	ct = codetag_next_ct(&priv->ioctl_iter);
+	if (ct)
+		allocinfo_to_params(ct, &params);
+
+	if (!ct) {
+		priv->positioned = false;
+		ret = -ENOENT;
+	}
+	codetag_unlock_module_list(alloc_tag_cttype);
+	mutex_unlock(&priv->ioctl_lock);
+
+	if (ret == 0) {
+		if (copy_to_user(arg, &params, sizeof(params)))
+			return -EFAULT;
+	}
+	return ret;
+}
+
+/*
+ * Entry point ioctl function for /proc/allocinfo routing requests to fetch the
+ * layout content ID, seek to a specific tag, or read sequential tags.
+ */
+static long allocinfo_ioctl(struct file *file, unsigned int cmd,
+			    unsigned long __arg)
+{
+	void __user *arg = (void __user *)__arg;
+	int ret;
+
+	switch (cmd) {
+	case ALLOCINFO_IOC_CONTENT_ID:
+		ret = allocinfo_ioctl_get_content_id(file->private_data, arg);
+		break;
+	case ALLOCINFO_IOC_GET_AT:
+		ret = allocinfo_ioctl_get_at(file->private_data, arg);
+		break;
+	case ALLOCINFO_IOC_GET_NEXT:
+		ret = allocinfo_ioctl_get_next(file->private_data, arg);
+		break;
+	default:
+		ret = -ENOIOCTLCMD;
+		break;
+	}
+
+	return ret;
+}
+
+#ifdef CONFIG_COMPAT
+static long allocinfo_compat_ioctl(struct file *file, unsigned int cmd,
+				   unsigned long arg)
+{
+	return allocinfo_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
+}
+#endif
+
+static const struct proc_ops allocinfo_proc_ops = {
+	.proc_open		= allocinfo_open,
+	.proc_read_iter		= seq_read_iter,
+	.proc_lseek		= seq_lseek,
+	.proc_release		= allocinfo_release,
+	.proc_ioctl		= allocinfo_ioctl,
+#ifdef CONFIG_COMPAT
+	.proc_compat_ioctl	= allocinfo_compat_ioctl,
+#endif
+};
+
 size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sleep)
 {
 	struct codetag_iterator iter;
@@ -993,8 +1228,7 @@ static int __init alloc_tag_init(void)
 		return 0;
 	}
 
-	if (!proc_create_seq_private(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_seq_op,
-				     sizeof(struct allocinfo_private), NULL)) {
+	if (!proc_create(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_proc_ops)) {
 		pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME);
 		shutdown_mem_profiling(false);
 		return -ENOMEM;
-- 
2.55.0.rc2.803.g1fd1e6609c-goog

