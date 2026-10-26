Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997068;
	b=oLaEzCLTcUYUXNBZCA9r3kSxyWmy57z+auFTk6YBq9VK2myYIdiy6agLPEsOwjnLvQp9
	 8hhAiLtOetlHaT6ScnYTBVa19TnDv9LGO82VaqMJJTQhAP1oqXQJLsw/Dg9naJjrUUQLM
	 /VHYYxuDPwdKVeAf8/wiUt5pq6ZICqv0304sDqhLx5VG/XiZw/oA3lzwPdRZlkAbXU2t/
	 qQ7LSU8IHaWRzRaroovMOU4SMvTxP0Sbg8u9EOuv1hQr7jPRL9V8t0PxjTyiDRs7z3HdU
	 7txPZ8a22XSq1ALLdBL3tVCKQT2wv7MN5qy5ms7XssS4cYQdlkqV2PK/crBCAEsfa0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BYmnZ/JkQz4ToYHE9aPlkKFm4UaBUwcnJjUxXXdmRXU=;
	b=3TXd1sbGV1A9OnpBV731wefjPrWp5Le+UOjO/2uzLiEbKM2cGpbZmNdMkr6hOJNoiTw+
	 Vb51iBJ5Dkxop6x/3m5nOO6+Lg/Nqv0M9Af+7hnxDAXs6UNvoItBjnRipcUlpE0eJ5OpA
	 juepBlZUWGiYQBZdkamHQP9mckYHlWtWVi2OhbSzdIRPFmCPjX2jEPFYyFNtKpMr4KYQ+
	 Ipaum5j/R7B2cP/Teqfbt/FWN/xRwuARiEuPcTKbhUPphKtR17jE/fRaq9KfA4289OpBd
	 PlorBHu5xZWYXWpYf0B0D8NgAiYCp4mKsI0mSbJk+DNQbYVLWPiu0FPxLr4XKbXV4Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gongtao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QAZHBnPf;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FC9606A333
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 06:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FC9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gongtao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QAZHBnPf
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso2507541a91.3
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 23:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792997067; x=1793601867; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYmnZ/JkQz4ToYHE9aPlkKFm4UaBUwcnJjUxXXdmRXU=;
        b=QAZHBnPf3vssSpOkSHI66T4/etdSHZwAEjaAq0ePJHH1zqvMbtXJgujG9T+kWfgPGE
         XVAWmd/7Jzlc1b0I47O2VskPWPBKU9SmJ4pE1/uV0i7DsFPeACWkXxmyiXIf9uBmJZqu
         j78NM4YSunkr+97zNb7f4my3go8O1Uhi4JCuYjFJmwJriHPcygUeYFu0G03Uz9OYhE7U
         xaLZDwsd7CveDmIFPx4Zx6G24hSheauS5rkE81EUhg5NR76ruH9wMEkMJl5+YmfFQ4pK
         trN7JZEoYMmdfHnwIBw02hi6MAgCzJLCegqzHm6VfJ7a0jvaaqmyFM2lSD8n1a+HKGyG
         cy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997067; x=1793601867;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYmnZ/JkQz4ToYHE9aPlkKFm4UaBUwcnJjUxXXdmRXU=;
        b=EvO+oeWuY/fwsakK7ozEbRychWKA1EkEv/3qzyZIdA60OJyUpQv6zWAMYe3qLW6xYb
         0TDZOzM6PEURId97wWqRSYojesmlPdcE0NwKdg0u3Nn+byKa26sKv6fzKMdDKPsfaGOW
         gh9QQDxHbKzAq4SkCXyGPrHqpLFv+Q5W9wHmqQ9MGAZ7+lSe66iKkdPp8XlDB74xns/K
         fajDh/FMMBhHsC+WEZQ9NSQ1aoPWhMpfSZsHTlEuBWjTLouRCeDihhdtOekjTk05PJqR
         leSg563elc9Wc6xY5eWQ7FHb+l355F1d4doFNShea8hhJW9Mf8bLsVH9vwRIMutbRENI
         zMHw==
X-Forwarded-Encrypted: i=1; AKwUvBzfvwflh/Mk2+ccutHPn5g6/LzuIH4yPGANVCohfFHsksD1Xl/s/8GdaWjxyc0LhSgD2rnqBJ9EhpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuE0jTyU2v1jKJ9Z//JjECIpwl5Ebm0l0BaTkWKCrdFT1cHI/f
	igN43Gs1GxK07vMzxnea+RSA3hHSfMAqcUqlRnfak2z6xG+TwH00UNyDXwTcF+stc06vxLwaGBQ
	hpf0UumoNUg==
X-Received: from pjhr18.prod.google.com ([2002:a17:90a:5012:b0:3aa:ee30:1a77])
 (user=gongtao job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5625:b0:3ac:8af9:4a6a
 with SMTP id 98e67ed59e1d1-3adeafc4451mr4916390a91.42.1792997067306; Sun, 25
 Oct 2026 23:44:27 -0700 (PDT)
Date: Sun, 25 Oct 2026 23:44:20 -0700
In-Reply-To: <20261026064424.3003536-1-gongtao@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026064424.3003536-1-gongtao@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026064424.3003536-2-gongtao@google.com>
Subject: [RFC PATCH v3 1/5] KVM: guest_memfd: Refactor out kvm_gmem_alloc_file()
From: Tao Gong <gongtao@google.com>
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Afranji <afranji@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Sagi Shahar <sagis@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Tao Gong <gongtao@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ackerley Tng <ackerleytng@google.com>

The file represents a KVM instance's view into the underlying memory
that is managed by the guest_memfd inode. Refactoring out the file
creation enables this function to be reused when creating multiple views
into the same guest_memfd inode.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Ryan Afranji <afranji@google.com>
Signed-off-by: Ryan Afranji <afranji@google.com>
Co-developed-by: Tao Gong <gongtao@google.com>
Signed-off-by: Tao Gong <gongtao@google.com>
---
 virt/kvm/guest_memfd.c | 67 +++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 27 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 93f3d29d5751a..3ca6f64d48040 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -937,10 +937,47 @@ static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 flags)
 	return r;
 }
 
+/*
+ * Allocate a new guest_memfd file for @kvm that refers to @inode.  On success,
+ * the returned file takes over the caller's reference to @inode.
+ */
+static struct file *kvm_gmem_alloc_file(struct kvm *kvm, struct inode *inode,
+					const char *name)
+{
+	struct gmem_file *f;
+	struct file *file;
+
+	f = kzalloc_obj(*f);
+	if (!f)
+		return ERR_PTR(-ENOMEM);
+
+	/* __fput() will take care of fops_put(). */
+	if (!fops_get(&kvm_gmem_fops)) {
+		kfree(f);
+		return ERR_PTR(-ENOENT);
+	}
+
+	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
+	if (IS_ERR(file)) {
+		fops_put(&kvm_gmem_fops);
+		kfree(f);
+		return file;
+	}
+
+	file->f_flags |= O_LARGEFILE;
+	file->private_data = f;
+
+	kvm_get_kvm(kvm);
+	f->kvm = kvm;
+	xa_init(&f->bindings);
+	list_add(&f->entry, &GMEM_I(inode)->gmem_file_list);
+
+	return file;
+}
+
 static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 {
 	static const char *name = "[kvm-gmem]";
-	struct gmem_file *f;
 	struct inode *inode;
 	struct file *file;
 	int fd, err;
@@ -949,51 +986,27 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	if (fd < 0)
 		return fd;
 
-	f = kzalloc_obj(*f);
-	if (!f) {
-		err = -ENOMEM;
-		goto err_fd;
-	}
-
-	/* __fput() will take care of fops_put(). */
-	if (!fops_get(&kvm_gmem_fops)) {
-		err = -ENOENT;
-		goto err_gmem;
-	}
-
 	inode = anon_inode_make_secure_inode(kvm_gmem_mnt->mnt_sb, name, NULL);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
-		goto err_fops;
+		goto err_fd;
 	}
 
 	err = kvm_gmem_init_inode(inode, size, flags);
 	if (err)
 		goto err_inode;
 
-	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
+	file = kvm_gmem_alloc_file(kvm, inode, name);
 	if (IS_ERR(file)) {
 		err = PTR_ERR(file);
 		goto err_inode;
 	}
 
-	file->f_flags |= O_LARGEFILE;
-	file->private_data = f;
-
-	kvm_get_kvm(kvm);
-	f->kvm = kvm;
-	xa_init(&f->bindings);
-	list_add(&f->entry, &GMEM_I(inode)->gmem_file_list);
-
 	fd_install(fd, file);
 	return fd;
 
 err_inode:
 	iput(inode);
-err_fops:
-	fops_put(&kvm_gmem_fops);
-err_gmem:
-	kfree(f);
 err_fd:
 	put_unused_fd(fd);
 	return err;
-- 
2.56.0.257.gf7497c7d27-goog

