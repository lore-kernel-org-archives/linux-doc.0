Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709444;
	b=Ec+CCr1P/LMiWMOi08wIy3r+qWqizZR/z/QKvSzZSjAFg5q1UpcAmM0wWnPoiYNmK+Am
	 JQ/uE4ef/tc8u0e/mMZSf2YRjNF5c34zl0IichYw+2YI5KyByANln4it2RXghTUDCDiyo
	 FTmbXvk3CJx3sveMkDLT6znuX8ePBudJOdVBY2Yg5pyzX4Kf96ulc05tf1q+pRzZQnrSH
	 7N38hCcAuy9u1eIxEYum/jQ9nZLTqBtA4ppfThd+xQWe0X5ZtPCwUesbhybSd0JgQJXxo
	 oK5JX5kWaWxyCTng7tykazRtKVZjvHzCQRRAauZ3hIHFHtgUUCKOfKeljYDCTphCjEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XQzlgw3emE84DnnF0oN4ahYTo145Q34I7Y43hlPChX4=;
	b=2RmviYMkC36RpiK3VV5ikrbZE59jN0BszP6yiGU7gW/iuwXiGYvUSwy+pc4FGvM9ayum
	 31l2EwcYnTG1b2i5v0Js+fPIer/txOHJD8JWNaS15rumE3MDwt29wT/XhHcvOzrzYvu8y
	 spsDMrna71jaH+hcNUFUgG2dQXlNEpxI2h3sTwuMTqLN3ZqnvX8vOz8bhuEcL94m/r1gD
	 qNDRojwuHFORtELwXjGVice+gOmRwRS3VYcE0bE2iI/66anKzFKbtPdV8KhDrunSpb+Lw
	 Y+8Cs2G81kOnB6kLT3ywGllNCx4LvFTiNc3FFM/XFc1gl7LtERj41maeopnydYW4axA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UoTAISlE;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7659606A31A
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 22:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7659606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UoTAISlE
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac76132001so224242a91.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709443; x=1793314243; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQzlgw3emE84DnnF0oN4ahYTo145Q34I7Y43hlPChX4=;
        b=UoTAISlE/91yBob+bwMgrlWqYNQCNr5RPpY50/0+tAhyyo3bQJqYclA4fjAygzqX/L
         bBHtrpBc/5EVuBGbYFqfqjS4m2bAFg1tefkCVk9bngP5/tncX+6Om4JtWHXo8CROXcX7
         G907zBUFyc8vJV4hV9kDzq2PPI3b9CLx9TYYsB1tfSr7LhzCdWxpzpRUQN9zJ6MueZag
         N8X1/0DBEkrGJh+meVUw3FYC9DHMnLLXvaiVtfDS6pHSFFPLnxibV6m2IZVN+sdYra/n
         EzF8ODBxxhvBQWQh58Xkay4AuciFYq8Yf0IPN1PXTu6oeJhf3px+v7SL7D8WTkCkqU5E
         3GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709443; x=1793314243;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQzlgw3emE84DnnF0oN4ahYTo145Q34I7Y43hlPChX4=;
        b=FZEf0QJQ8NG2rT0ikWOyW5fMURG+8CyHDUzkWb2iQSy9G6SQznNLUi4dM5a9Dz8O+O
         VSgPddS75AdruVj8mFwjLHxUdLVpRFSMmrl5xuz+eASaT8BbhhBGke0EnyJW0yhwL8w9
         6Ld57f9w4y9MoQQlCj5fcLrLr1eyV5KQpOYWuJkLC6G8uAy0aIHXXvz+IHaNRBMJJ9CA
         1ESEVaEoTZL9qrK7+052mxcOTowxdEpF0HDbm7lNrr0Qu3yZpnIPho79p/bCENWqhGeg
         yR9ZQXmFHhk7jsoaQUXrd9xhASasFnvZjbSidS93NjCmdi9+lvbdMt4DWKnWS8STSRmr
         vp6g==
X-Forwarded-Encrypted: i=1; AKwUvBxc4NDFrcTKL1LVOZrNl/T7h1zx8T0F9vO5yD/CFuPGLLR3hSi1u/2bBvk0r3xAgj4laBqpsv+ecag=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc5FZ81B/YjXe4mlTxt4y1nrB+3v2Hc0cCHUg+DqsNAKL0g89P
	LEHT6K0FsGqO1grCKdcYtz0f9C6KFTx2kKtnHdbxvlQTL4aVupK1TPuc6EU54zecBDJ/8fRrS91
	duPii5i1ERGUUZg==
X-Received: from pglu36.prod.google.com ([2002:a63:1424:0:b0:cd6:b233:e4aa])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2785:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3adce45d4b2mr203170a91.44.1792709443059;
 Thu, 22 Oct 2026 15:50:43 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:31 +0000
In-Reply-To: <20261022225035.377445-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022225035.377445-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022225035.377445-7-dmatlack@google.com>
Subject: [PATCH v2 06/10] mm/shmem_luo: Don't make early retrieve failures permanent
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

If shmem_luo_retrieve() fails before it starts restoring the folios,
mark the failure as retryable and return the error without freeing the
serialized state. Nothing has consumed the preserved state at that
point, so the retrieve can be tried again. If no retrieve succeeds,
finish() frees the preserved folios, like it does for a file that was
never retrieved.

This fixes leaking the preserved folios when one of these early steps
fails, e.g. because the file has seals that this kernel doesn't support.
The retrieve freed the serialized state but not the folios, and finish()
then skipped the file because its retrieve had failed.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 mm/shmem_luo.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index b8d86055912d..bcac1bbb3db3 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -390,9 +390,9 @@ static void shmem_luo_finish(struct liveupdate_file_op_args *args)
 	struct shmem_luo_ser *ser;
 
 	/*
-	 * If retrieve was successful, nothing to do. If it failed, retrieve()
-	 * already cleaned up everything it could. So nothing to do there
-	 * either. Only need to clean up when retrieve was not called.
+	 * If retrieve was successful, nothing to do. If it failed permanently,
+	 * retrieve() already cleaned up everything it could. So nothing to do
+	 * there either. Only need to clean up when the file was not retrieved.
 	 */
 	if (args->retrieve_status)
 		return;
@@ -526,11 +526,16 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	if (!ser)
 		return -EINVAL;
 
+	/*
+	 * Nothing has consumed the preserved state until the folios are
+	 * restored below, so failures before that can be retried. If no
+	 * retrieve succeeds, finish() frees the preserved state.
+	 */
+	args->retryable = true;
+
 	/* Make sure the file only has seals supported by this version. */
-	if (ser->seals & ~SHMEM_LUO_ALL_SEALS) {
-		err = -EOPNOTSUPP;
-		goto free_ser;
-	}
+	if (ser->seals & ~SHMEM_LUO_ALL_SEALS)
+		return -EOPNOTSUPP;
 
 	/*
 	 * The seals are preserved. Allow sealing here so they can be added
@@ -539,8 +544,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	file = memfd_alloc_file("", MFD_ALLOW_SEALING);
 	if (IS_ERR(file)) {
 		pr_err("failed to setup file: %pe\n", file);
-		err = PTR_ERR(file);
-		goto free_ser;
+		return PTR_ERR(file);
 	}
 
 	err = memfd_add_seals(file, ser->seals);
@@ -552,17 +556,20 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
+	/* The preserved state is consumed from here on. */
+	args->retryable = false;
+
 	if (ser->nr_folios) {
 		folios_ser = kho_restore_vmalloc(&ser->folios);
 		if (!folios_ser) {
 			err = -EINVAL;
-			goto put_file;
+			goto free_ser;
 		}
 
 		err = shmem_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
 		vfree(folios_ser);
 		if (err)
-			goto put_file;
+			goto free_ser;
 	}
 
 	args->file = file;
@@ -570,10 +577,10 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 
 	return 0;
 
-put_file:
-	fput(file);
 free_ser:
 	kho_restore_free(ser);
+put_file:
+	fput(file);
 	return err;
 }
 
-- 
2.56.0.257.gf7497c7d27-goog

