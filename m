Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356663;
	b=OqAL6IIePzunQUujoRPzNFop5fi/ZkWAPL9/l6U+xGQvwIsJiGE8l1I2LoqgwFiCQgWq
	 HyQ9q+556Q4sWUgLMRRgYDH7D3We/Ki91W8A+f8fa0bDvqoZdADaKFN58u8DHXTPfflvN
	 YrHEm5Sc32DF4DD/IPfknOfvfp1MGmRTMnPZmTwJVNZU9QHxGZnnDoJLXsijg/KOLLpom
	 A92f7a9STOlonE5ny3VizncbTckRMkQpiOVRQqJ1NHIQtL8w3RV0W7C/1QWwftjUjX0sy
	 g3eflVZiA/Z+gvnNTETx0It+/R96skYXw410f6GK15EO0vR59KBLnebGavjMKPAXnZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/dKUASXcgtiRNT2+c3YhFYhMVcr51Eig0y+PlMV5erc=;
	b=D2HC2TKBtuVa+UmzFxoloj3Z7Ssi3awHloEJttVmnHOVs9dSXE74qUko5walRAc/vr/M
	 4B3kGi2DEozQ3tFaiecFZP3YCuLWbTj7ZJOPilEOOQJeX6p869bebGzbR4kZwJwORaArL
	 PGBtbmKtGNv29YLmIwpRFHDrJwxavl9JF0/IjqQqANFMN0F/nX6Q2/fWsgaOrguR3LYIY
	 ji+ufLr0KmSTo0FUzeFTMbm1EFUwg0Dc/0Mh3U6S/CTfjeyJLI+xZD3i9MOKbgRqqJvLH
	 ch9aKrRKr4Nod6V4ZybSYh7EECvWkuCtC/Dho5yXVQDuXILTiSI/FToe6Ke6zaItN1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mgz5uvXG;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB9360A6F4C
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB9360A6F4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mgz5uvXG
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ea2c058e67so2989051b6e.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356662; x=1794961462; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dKUASXcgtiRNT2+c3YhFYhMVcr51Eig0y+PlMV5erc=;
        b=Mgz5uvXGHXzdmRFvtrlSP8cZGYYk4RADmtLa7RviJu9RDFcqlasnxsdoLTMRvh96Yx
         5svtE8O6YsJiYv9D9MslbV+7P1D8bW6/JAnXYFtbb3YGLCetos49RtBiopo0CYjdI2FK
         iRo4hrlxt/qmp7occAiyZ49rjEhADbHIdaxXRqBjSIQKJM4QcO75QTxvLhXuc/havEqW
         Xtj2G5yMx6SuTkYAypn5vQxpmDmcrUazMVoWJZtWsC3QvY1msSQ+LvtefGerVfLYHs2F
         DHQDrSpa8Sl3NuvrMDXtrc2xVCrhccwLKTw/d5duwAD1SxWe24HaOqU+JJBVFjHT37pt
         HRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356662; x=1794961462;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dKUASXcgtiRNT2+c3YhFYhMVcr51Eig0y+PlMV5erc=;
        b=e9QiOQAFCJdaeLeNTMflNovqpIN+wWRsLr1v3WCuLY5ZFAsXVNR1nOHEZdj6+Mw75D
         1tbVGUfre5XZlWBz3SfGTcoyIUGIRk6NkmAZwtV0cwwtWxOw67u8iK36hTZhcdiVCZlw
         OZW3Gn5THhD7gOF4F+rDsRnioLuLfZh9vDKwT4wlGVrpnNfOE4lMOLkjirI4PjH7kTCi
         36MNEf8ba60EbezDsOmntAHebchr6qsC+tQAzqxGL4X7qQLc2/SmfzltD1PpHoBM9x8t
         2qM+pAWzKHA5/phMITpgBF65lbB0hocITfB36m8BiP00CHG+8h7uzZHKfo9kgaas2tYA
         lZDw==
X-Forwarded-Encrypted: i=1; AL+hErESGH9PnU2Po7ZqA8/dAKRUrJTstRq7F9nturE3d925E2EaEXOnAgaWYNrqyTcdI0SkP418Tlwo4xc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k7DGGZyzFAFvCaoouxkr10j0rYFE1wuWaU+G0slVyrPWd0tCz
	fxprxpU3NBTQc5jucLv7YO1fB0xmvOMtlAZaLv0e6G5Z0PmixWXL8U3Wzv4FToqEvcA+Fn+b9N+
	ENR2R3wzH+Zqh+Q==
X-Received: from iocou21-n2.prod.google.com ([2002:a05:6602:c315:20b0:9c7:6af8:db91])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1246:b0:53b:f634:83b2 with SMTP id 5614622812f47-56b903e2f53mr602569b6e.0.1794356661391;
 Tue, 10 Nov 2026 16:24:21 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:49 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-12-dmatlack@google.com>
Subject: [PATCH v4 11/19] mm/shmem_luo: Require permission to preserve a file
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Require the file to be opened for reading and the caller to have
permission to write to it in order to preserve it. Also let the owner
preserve a file that is immutable or on a read-only superblock, and
reject append-only files.

While a file is preserved, its size is frozen for all of its users:
truncating it, fallocate() and writes past its end fail with -EPERM.
Today any process with an fd for a memfd can do that, even one that was
only given a read-only fd. Requiring write permission limits this to
callers that could truncate the file themselves. A file descriptor
opened for writing isn't required, since that would rule out preserving
a running binary, which can't be opened for writing. Only the permission
of the inode is checked, so the mount doesn't need to be writable
either. The size of an immutable file or of a file on a read-only
superblock can't change anyway, so its owner may also preserve it.
Append-only files are rejected, since their writers can only append to
them, and freezing the size would stop all writes.

The retrieved file can be read, so also require the file to be opened
for reading. Otherwise a caller with a write-only fd could preserve the
file to read its contents.

Document the frozen size and the permission requirements.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/shmem_luo.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index dc6ede528822..bdf90aac5820 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -27,6 +27,15 @@
  * the file are preserved. All others are reset to default. The preserved
  * properties are described below.
  *
+ * Preserving a file requires it to be opened for reading and the caller to have
+ * permission to write to it, but it doesn't need to be opened for writing. The
+ * owner of a file that is immutable or on a read-only superblock may also
+ * preserve it. Append-only files can't be preserved.
+ *
+ * While a file is preserved, its size can't change and no holes can be punched
+ * into it: Truncating the file, ``fallocate()`` and writes past the end of the
+ * file fail with ``-EPERM``. This applies to all users of the file.
+ *
  * .. note::
  *    The LUO API is not stabilized yet, so the preserved properties of a memfd
  *    are also not stable and are subject to backwards incompatible changes.
@@ -255,6 +264,30 @@ static void shmem_luo_unpreserve_folios(struct kho_vmalloc *kho_vmalloc,
 	vfree(folios_ser);
 }
 
+/*
+ * Preserving a file freezes its size for all of its users, and the retrieved
+ * file can be read. So require a file opened for reading, and permission to
+ * write to the file or ownership of a file whose size can't change anyway.
+ * Reject append-only files, since freezing their size would stop all writes.
+ */
+static int shmem_luo_may_preserve(struct file *file)
+{
+	const struct mnt_idmap *idmap = file_mnt_idmap(file);
+	struct inode *inode = file_inode(file);
+
+	if (!(file->f_mode & FMODE_READ))
+		return -EBADF;
+
+	if (IS_APPEND(inode))
+		return -EPERM;
+
+	if ((sb_rdonly(inode->i_sb) || IS_IMMUTABLE(inode)) &&
+	    inode_owner_or_capable(idmap, inode))
+		return 0;
+
+	return inode_permission(idmap, inode, MAY_WRITE);
+}
+
 static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 {
 	struct inode *inode = file_inode(args->file);
@@ -264,6 +297,11 @@ static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 	int err = 0, seals;
 
 	inode_lock(inode);
+
+	err = shmem_luo_may_preserve(args->file);
+	if (err)
+		goto err_unlock_inode;
+
 	shmem_freeze(inode, true);
 
 	/* Allocate the main serialization structure in preserved memory */
@@ -317,6 +355,7 @@ static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 	kho_unpreserve_free(ser);
 err_unlock:
 	shmem_freeze(inode, false);
+err_unlock_inode:
 	inode_unlock(inode);
 	return err;
 }
-- 
2.56.0.542.g3ef89b7020-goog

