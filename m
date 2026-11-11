Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356662;
	b=e//HD8gX34saUl3PM74P+RglW6TLo2q2BaOGGlGUQSJ62ia7qhg+P9teSKh1RDMOdfVt
	 uW1xhAGJXxTpUCdlyOfUygV0YtvrJ5PQi2Kg3e2YziIIfI27iYOSZFlxe/JYq7qdR7ghv
	 0QAALiflxeoqEuAaubt1ZGTbpBtabRqxF4oz6+yYHZljoNAovzAhWZM5J0pywoqH8xlfX
	 mVhsxSjLZDvn6AyNadG+h27RCZVPB5b+x6SdaEs3S7J1c6e091W8PXHd3Wu2jFONutzH6
	 k/Z1K3a8S/Ormi/zH7OiYnwI7vW5n2R+WsmVP7xlyYNhor7Sn7Um9uOTSwoRVFcjd7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oDGpajhrmdSjBCrv+9z48USF9DLlcre7dauJ37omj8M=;
	b=qmfhJ4H1uw7tQ2NUdjbkK+h6zP6TpvJAZCKceVFu8C/1h5xHMNsmvF85uzoz9fTIZ9yD
	 chIiWwDUwt1U71Gi7Q4gzhmS1vrIm87gFq/lIsOPw/oaSDD7BNoJI5VUKZ3OjsacqWqzu
	 LGDM42+xcBnlJxC0OW/YEnVzuWMLYSzSAIyduAQ5Sie+xclm4Mei6F7h6auFnL0lR0WH+
	 XI2duiPylTulrTQizfxkufxC2S9xOGUWS0JwFQ7/1iz614Nm4mU0wMiWB6zSH21ndOOf0
	 XQQzLawgh4pbYxHrzKTf7AzJsUguOo/5pId9MovI1M107ihN+oWHl66qvv0EZeYKc2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktF0P4T4;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D68960A5BDC
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D68960A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktF0P4T4
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-847e2926d94so5227971a34.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356660; x=1794961460; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDGpajhrmdSjBCrv+9z48USF9DLlcre7dauJ37omj8M=;
        b=ktF0P4T4IydsOsl2xKIG1UXcZe/yOkI/JJICUYtlWGIBVwTWWO7o2nZ5KvH9j8kTYG
         GfxgLbXlsJYm+M3TNZ5Cqt3ZaV2NjCvE+mocIarmHq5R3wvo2nhGbpSJlwGp7TLZKsWt
         715AvaUxCYdXyJYti6WlxqKA/OSG5pKuEgJBSPxxivofhIHT+6VfCiUZygZBnmSrbG08
         trzQFkw7qExOlUqbIY+Oniq7qiUlzPYi+UPaNqL5Pn/3pRaQGe3xFQ5J6W8xcd7P+A82
         pOvFO8tM6AKrqQTj/ny/ItiVySKg1BC838ht51HntBFxK7leytHsWbv5KO7HHM1pBvH7
         2fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356660; x=1794961460;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDGpajhrmdSjBCrv+9z48USF9DLlcre7dauJ37omj8M=;
        b=nZVSIc7PtaYLi93PsBqWcNb0U9eCup2YJUK+vtIsz9Qb01F3gA8ZnFuBFncU2th4Xi
         CnKEG0lQacy+x4U9rcyM7YzusSQoPjYmZzMqT4uVGVq1+hfk4ffVznyzp6p9P9YDupa1
         GQsYDSp5gV/6jfiwgkxcQN0weo5CQBun4t5jnWVKdkJLoSp1uZwXMjyWCQaRCdKREIx9
         8EHUSBX3Z3Jv67hdqgR6i9lhN5TfI0SZNflK+ZsDp/7I9stizf8Z0mCeN0BcA9AClnfv
         oCq5O3oCfqmzohASy5ITnsmcliojlM+rp62c4zprwjm4kaIk8aKjPgZarszioygy6Rn0
         FtYw==
X-Forwarded-Encrypted: i=1; AL+hErEP2tz8cO923ogV7Ul2SbXBDPAEC/cSDZPWy7Xpdz+K0qNcIWewEz17rK3KVCXMZIxm772+LP6jChQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z888hQCsBrFzBzf3ZEDAcMWXSgaUpR1qJqQcF4JSRjsf2Fdos06
	iKikIzk56ISkAZ237KYtM79GzUQrb1b6/IC9hQnYWL+H2D+6yHK+hsJ+4D6Z7C4ag9ZktALlhZE
	ftFdsXqqtUevEaA==
X-Received: from iobgl21.prod.google.com ([2002:a05:6602:4f15:b0:9c7:70d7:1521])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1581:b0:4f3:e98f:fa26 with SMTP id 5614622812f47-56b98727e41mr556110b6e.58.1794356660168;
 Tue, 10 Nov 2026 16:24:20 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:48 +0000
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
Message-ID: <20261111002358.1842967-11-dmatlack@google.com>
Subject: [PATCH v4 10/19] mm/shmem_luo: Don't make early retrieve failures permanent
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
help, so keep that failure permanent, so that every later retrieve
returns the same error.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/shmem_luo.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index b48d7f460493..dc6ede528822 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -552,6 +552,14 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	if (ser->seals & ~SHMEM_LUO_ALL_SEALS)
 		return -EOPNOTSUPP;
 
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
@@ -571,6 +579,9 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
+	/* The preserved state is consumed from here on. */
+	args->retryable = false;
+
 	err = shmem_luo_restore_folios(file, ser);
 	if (err)
 		goto put_file;
-- 
2.56.0.542.g3ef89b7020-goog

