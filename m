Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477183;
	b=zPGDyAASbSyff+aYeg1T6FjYnInY/Z78wZ1mJzxOa/fpLgjWI50qB4N2XFq2pJzw1cqP
	 +IPyw8iApi2QbR7k4umV0PVFffA4tEE5s2RjnnQlSGveqGHhYFV+4opghltN4i4ykUhPr
	 1RVjufaYkk0kEdMDCgrOqwIkJJK38e3kzlX06m1BFlHpm0bwQx+U8JKwrKB+SzG9cw+CX
	 6XVkGv9PI48T2q/2UpG84Ar9Gs/DuDN1TFKAWyV6sgix5jZdWcvyuG3DGSGYFzsec2Jyp
	 iU6O3GGrx31HCNwccWWKHsoeBkRL/CSvQxa4ZEszIvPK8YNXb+diqKZfNycm3HQoujw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7LV8lhNkJFfTRLs461bEq0N2TyeH7KvDdqPK2bQlIlc=;
	b=TNk1+Pm5hLnTAs7YP1UkQG1mNNDHALgg2q1WaUgaQPmN0wWlu92nRpNyjcx9Osw3nYJ5
	 6TyJtZWN6yrJTfFKN9bk1WKwEP6UM+fRzvgHoQoG2cqXmeAPwkpU+SQmzp53P3SgP4RKz
	 ccUbzm2NWZ2W8A0zrcKZPAocEQOM2zfUtIinub2Vz/rXKoQ6ZXEFRaOjHAPLmRWaOZwN4
	 6pk6TVb9o2249FLnbqZAbnw46qjmrtOJRjtRALJXCnDh8ZQkKvZ4xgoyfPDrvj2lZ0Za4
	 zADcq2bydNHYKqux1Umr7h5XCRHrIup1TnWF5tMIKPmV4EHAJfCg92NPmK8PopmHtxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zi2m+WiU;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A1606A683
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 23:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102A1606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zi2m+WiU
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4db3db8687fso5023616b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477182; x=1796081982; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LV8lhNkJFfTRLs461bEq0N2TyeH7KvDdqPK2bQlIlc=;
        b=Zi2m+WiUnWVmq9/CIMB2MW5hhMfT2h5+NY9zpD2pjDiAHwsvJrEJAjvqmCU4JkP2RY
         vWeQCnuD8KvDfC30Qc0dfwDltKLO7nPids69W8gcs9731+uSLPYddZ3dMGHGJCPEjPft
         dkGX7d3InGIgqmOrMb4jGgdiL9NBDv3w1tWO+q+Q+JgwTD+xtiXsCVKY2XuUw/PvCrNg
         0UJexID6yA76CkuV4GSRfRkg7i2mbImnBsFV/AMOKkciB6U0Lr6RXF949pJokHccEBsA
         OG3YqZqH2bFoztGhD7EAdEQaajqNFqjMdBAnoZpVxpE15m0tOMhLoQuQ8kYJJznI3BwY
         gYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477182; x=1796081982;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LV8lhNkJFfTRLs461bEq0N2TyeH7KvDdqPK2bQlIlc=;
        b=Upvd8EgUnovMW72wz5NtzhPosRtTVI0hbP8ABdCNW5AWfVhGhogBHAG0mw5pmXU6AM
         Xh07ftDXUqGYk+2scbvI/Hd6/edp7QrF+1gNqTHyTgmEVWsJ2GziTDndfvYEeE5SftbM
         iXgvp8BaXvZt6OCVUwcclsOC/6HvcWyDXkffCDjiC9jmrBGaoHdBiR20K/1gb6kYo2xA
         h8b7rUlF3TnLJ6GCwba9xM3kJMXOnGF85yKAOEdtBFtz3sVhN6j3/AMMe40SIEPOFV43
         t0e+VliggdoMBaK9Yob1jZFPEYELqH77SZr3JjIF9rFUUTHHwVa5pKMUmbGLFPE7RoAT
         UYng==
X-Forwarded-Encrypted: i=1; AL+hErGfFMn9ae1Jw0gCYq78UuxA1happ+FPEouZM+WDEUx4CyZLHaD9PPK9DND34xsnPe2m2XVcS+fMgtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RXuEZJVDokqoTyZfyVXCaQHnYgUjXa47rVhCmgOi7SHBIw6Vx
	Wgf7tGx/Di81eMjvRfk5V9j0VglPK+Iljp7sDE7vK8cIY/oE0L+VccBzmlEKwPM4YJ3MWJHk+WX
	Uz7+1CroXpXTsMQ==
X-Received: from jahq23-n2.prod.google.com ([2002:a05:6638:e017:20b0:620:2968:9641])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6711:b0:4c4:a240:9c3a with SMTP id 5614622812f47-57a077151demr13100240b6e.4.1795477181670;
 Mon, 23 Nov 2026 15:39:41 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:14 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-10-dmatlack@google.com>
Subject: [PATCH v5 09/18] mm/shmem_luo: Don't make early retrieve failures permanent
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

Mark failures in shmem_luo_retrieve() before it starts restoring the
folios as retryable. If no retrieve succeeds, finish() frees the
preserved state, like it does for a file that was never retrieved.

Until the folios are restored, nothing has consumed the preserved state.
Leave it for another retrieve, which may succeed, e.g. if
memfd_alloc_file() failed with -ENOMEM.

The exception is a preserved file that this kernel can't restore, e.g.
because it has seals that this kernel doesn't support. Retrying can't
help, so keep that failure permanent: every later retrieve returns the
same error.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 mm/shmem_luo.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index e747a0442295..46b33a00c2a2 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -532,6 +532,14 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 		goto free_ser;
 	}
 
+	/*
+	 * Nothing consumes the preserved state until the folios are restored
+	 * below. If the retrieve fails before that, leave the state for another
+	 * retrieve, or for finish() to free. The checks above can't succeed on
+	 * a retry, so they fail permanently.
+	 */
+	args->retryable = true;
+
 	/*
 	 * The seals are preserved. Allow sealing here so they can be added
 	 * later.
@@ -539,19 +547,22 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	file = memfd_alloc_file("", MFD_ALLOW_SEALING);
 	if (IS_ERR(file)) {
 		pr_err("failed to setup file: %pe\n", file);
-		err = PTR_ERR(file);
-		goto free_ser;
+		return PTR_ERR(file);
 	}
 
 	err = memfd_add_seals(file, ser->seals);
 	if (err) {
 		pr_err("failed to add seals: %pe\n", ERR_PTR(err));
-		goto put_file;
+		fput(file);
+		return err;
 	}
 
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
+	/* The preserved state is consumed from here on. */
+	args->retryable = false;
+
 	if (ser->nr_folios) {
 		folios_ser = kho_restore_vmalloc(&ser->folios);
 		if (!folios_ser) {
-- 
2.56.1.809.ga0b61035b5-goog

