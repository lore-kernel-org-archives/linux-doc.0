Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68773348C7D
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 18:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154151; cv=none; b=g0N5CzQLFNdzI2h9VtqtOUo1GYYRZGSL91A3bgTQd6LJgUqTpyIgFwDaD3uwpCzTXATmLgdtw8xgR7yfj5hEjXm/jsn++NS8ur/jHzQ5aqgP4dESSK96/fRqTH1Pvq2s+t5S6M+L2xeNaOIRdz7esVf6cwbZqPUaYMs9uD4yFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154151; c=relaxed/simple;
	bh=eSsWjg7+Xo0AyadgQytCuqK0tjsGOi6I8g06Sl8yFn4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VArLLvlJrZ4Cmj3oM/8BbifulPxe5ucm1JHtEZIxG3pzQpVj8Kke01jfnvBw6LNGEY0EhuKIdgsEWV+314N9NusrPBPwe6JQt+jI+pRFwR+fghLXY8/VVNWgGzxtFaqgJAR5v/3Q3x8mHkxKgCqznG8NdZXwlqZ0NvsylieCMWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WNEHDTJF; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WNEHDTJF"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6960fb32b73so4305992a12.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 11:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782154146; x=1782758946; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrCK2iLTFuPkCKKXsEtILhMjhO8cYkJcRVq4TpiCh/Y=;
        b=WNEHDTJFRR+c8NsWPLxQ2QcGrI1YuQpKfqoZi8ml5Iqsn7oGqu6f6mVBgJfhuM4xtB
         OD7RATSFTmdsCde4ycwQcIU2R4LirjnkvpLSoFy9gQI9XiQ3jSvKPc1jPputg6SL4Ifv
         1c7SvNBBW/3P3XONzjwQvGiNqqt77CvnN1gsPf1rrLZqyCCUgbAVMmZg6tkz0tBHIhh1
         LfdtvjDGx5wstoNGR1XcAfFoUyR2Ena9qi6ToDYY7wDbffPKQmdLt9njkAoSqSU2p7q6
         Nfh2h6mBiYlEoKci8JGvyoY73sgyYnhuyFJ+d772lhIq1XMXEnGR+VfrjJrKnUMczi8J
         b2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154146; x=1782758946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrCK2iLTFuPkCKKXsEtILhMjhO8cYkJcRVq4TpiCh/Y=;
        b=X0hECE5aDUbhc4zr6HEiFUsPvOj6hRXFYEZasgdxrRmyvoFQlZpN7tUnlPgrI+yqOX
         pQ1Vxc4eihqrek9hzWcNjrySzgiWvuJLCW9ajmxetMZTgpYzBCoGAB01QenY6nfe3+AY
         m32Sf925Zwa4k/lPpMEjJ7ylLBXOcv0FmfjBFrW0rWgcOULlcSK7ZkfVcL9IE6+I5eos
         xsOh6b592HukeFaHAOjlwiqoPBynXH6wiWv79q4YHWxh4aRpDm/OkyL4UdffeV7sNf+x
         ZjWDrRvgilyi9PUx6NfkeJAVpkn5/CTNId5POHIXij9VVzkv3lw4bgyttck08CP1MpyR
         Nn2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ApIlVvAUDSBiNntat+AP+SzbdAy5f4a5i9rESAXEX7vbYH0YxzOHLo6AwoUFb+DB68B4gZM7RTrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDAhxJ1n9n8JLvLlpJYuXqYlBCG1JjmiuTsSnyyGJSydvcwyUY
	LLJeBo5pS5uWLoCF4XmIHFlZpViYXKi6twjSdaPuGMlzCTO79TLLyRN6xQfl32nIexvPBaWb+vi
	mS0+hN4b6ct3Ytj5pKA==
X-Received: from edsl17.prod.google.com ([2002:aa7:d951:0:b0:695:f6a4:adb4])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:35ca:b0:697:bd1d:116d with SMTP id 4fb4d7f45d1cf-697bd1d14acmr2221698a12.27.1782154145133;
 Mon, 22 Jun 2026 11:49:05 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:48:46 +0000
In-Reply-To: <20260622184851.2309827-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260622184851.2309827-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260622184851.2309827-5-tarunsahu@google.com>
Subject: [PATCH v3 4/9] kvm: guest_memfd: Move internal definitions and helper
 to new header
From: Tarun Sahu <tarunsahu@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Mike Rapoport <rppt@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To support guest_memfd memory preservation with LUO, guest_memfd luo
code needs to access guest_memfd internals and reconstruct guest_memfd
file instances from a preserved state.

Extract gmem_file, gmem_inode, and the GMEM_I() helper from guest_memfd.c
into a new internal header virt/kvm/guest_memfd.h.

Additionally, split __kvm_gmem_create() to expose a non-static
__kvm_gmem_create_file() helper. This helper returns a struct file
instead of a file descriptor, enabling file creation and initialization
without installing it into a file descriptor table.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 virt/kvm/guest_memfd.c | 68 +++++++++++++++++-------------------------
 virt/kvm/guest_memfd.h | 39 ++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 40 deletions(-)
 create mode 100644 virt/kvm/guest_memfd.h

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 8669068..fe1adc9b 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -7,38 +7,12 @@
 #include <linux/mempolicy.h>
 #include <linux/pseudo_fs.h>
 #include <linux/pagemap.h>
+#include "guest_memfd.h"
 
 #include "kvm_mm.h"
 
 static struct vfsmount *kvm_gmem_mnt;
 
-/*
- * A guest_memfd instance can be associated multiple VMs, each with its own
- * "view" of the underlying physical memory.
- *
- * The gmem's inode is effectively the raw underlying physical storage, and is
- * used to track properties of the physical memory, while each gmem file is
- * effectively a single VM's view of that storage, and is used to track assets
- * specific to its associated VM, e.g. memslots=>gmem bindings.
- */
-struct gmem_file {
-	struct kvm *kvm;
-	struct xarray bindings;
-	struct list_head entry;
-};
-
-struct gmem_inode {
-	struct shared_policy policy;
-	struct inode vfs_inode;
-	struct list_head gmem_file_list;
-
-	u64 flags;
-};
-
-static __always_inline struct gmem_inode *GMEM_I(struct inode *inode)
-{
-	return container_of(inode, struct gmem_inode, vfs_inode);
-}
 
 #define kvm_gmem_for_each_file(f, inode) \
 	list_for_each_entry(f, &GMEM_I(inode)->gmem_file_list, entry)
@@ -557,23 +531,17 @@ bool __weak kvm_arch_supports_gmem_init_shared(struct kvm *kvm)
 	return true;
 }
 
-static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
+struct file *__kvm_gmem_create_file(struct kvm *kvm, loff_t size, u64 flags)
 {
 	static const char *name = "[kvm-gmem]";
 	struct gmem_file *f;
 	struct inode *inode;
 	struct file *file;
-	int fd, err;
-
-	fd = get_unused_fd_flags(0);
-	if (fd < 0)
-		return fd;
+	int err;
 
 	f = kzalloc_obj(*f);
-	if (!f) {
-		err = -ENOMEM;
-		goto err_fd;
-	}
+	if (!f)
+		return ERR_PTR(-ENOMEM);
 
 	/* __fput() will take care of fops_put(). */
 	if (!fops_get(&kvm_gmem_fops)) {
@@ -612,8 +580,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	xa_init(&f->bindings);
 	list_add(&f->entry, &GMEM_I(inode)->gmem_file_list);
 
-	fd_install(fd, file);
-	return fd;
+	return file;
 
 err_inode:
 	iput(inode);
@@ -621,7 +588,28 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	fops_put(&kvm_gmem_fops);
 err_gmem:
 	kfree(f);
-err_fd:
+	return ERR_PTR(err);
+}
+
+static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
+{
+	struct file *file;
+	int fd, err;
+
+	fd = get_unused_fd_flags(0);
+	if (fd < 0)
+		return fd;
+
+	file = __kvm_gmem_create_file(kvm, size, flags);
+	if (IS_ERR(file)) {
+		err = PTR_ERR(file);
+		goto err_put_fd;
+	}
+
+	fd_install(fd, file);
+	return fd;
+
+err_put_fd:
 	put_unused_fd(fd);
 	return err;
 }
diff --git a/virt/kvm/guest_memfd.h b/virt/kvm/guest_memfd.h
new file mode 100644
index 0000000..c528b04
--- /dev/null
+++ b/virt/kvm/guest_memfd.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __KVM_GUEST_MEMFD_H__
+#define __KVM_GUEST_MEMFD_H__ 1
+
+#include <linux/kvm_host.h>
+#include <linux/fs.h>
+#include <linux/mempolicy.h>
+
+/*
+ * A guest_memfd instance can be associated multiple VMs, each with its own
+ * "view" of the underlying physical memory.
+ *
+ * The gmem's inode is effectively the raw underlying physical storage, and is
+ * used to track properties of the physical memory, while each gmem file is
+ * effectively a single VM's view of that storage, and is used to track assets
+ * specific to its associated VM, e.g. memslots=>gmem bindings.
+ */
+struct gmem_file {
+	struct kvm *kvm;
+	struct xarray bindings;
+	struct list_head entry;
+};
+
+struct gmem_inode {
+	struct shared_policy policy;
+	struct inode vfs_inode;
+	struct list_head gmem_file_list;
+
+	u64 flags;
+};
+
+static inline struct gmem_inode *GMEM_I(struct inode *inode)
+{
+	return container_of(inode, struct gmem_inode, vfs_inode);
+}
+
+struct file *__kvm_gmem_create_file(struct kvm *kvm, loff_t size, u64 flags);
+
+#endif /* __KVM_GUEST_MEMFD_H__ */
-- 
2.55.0.rc0.786.g65d90a0328-goog

