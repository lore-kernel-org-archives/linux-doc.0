Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356666;
	b=MtNVPDaOAQ3rvpPXKVsnIXlwh847ZdD7FCeXRClprHUB4BR21/MGEVhDW/CVPt6TEfKe
	 C2hfnk4aO9kEPVFbGlPcor7e7KiQ/67lnFBi8LVmm0c+R/8yiOgxYHHD4W9Un5MCztvjr
	 xuj3rXxsqJGxBJD4rycj71EDyCle+/cbO1IjA1gcTWqaHTZR0dz96wl6dXZui/1EyEm7x
	 fDVmlCTixogG1eb6rJ7HcsXhuTJ4v3H94QwWZS0NctOxkOazxIMdvLtGsXMrgkIS5//j+
	 5vY3P6xgZxzpH38dIMx2lxXiG8hReTDFPxU5Z9PYmPAkKEeUv05ZgrtUgwi19AkRJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WlJZl+UE9pf/QC95ZJSnwsGYNSdLtTHc9yxgINOhNxY=;
	b=IhCd1QV4n5D2bOuwof1VRWmjZgo/WRzpSkVtt3cl6VRVdFJv4jxhGD8foFFIqy/XEXbV
	 S3vAcO6IkJ8sdvAOm+i9bNaV2d4Cq+ATHtXu1vsZsU4w0NANpy4N4bF+FJxC9wHvrl8xs
	 8o1ZWoyAu1NJsHFm9jtxHwLybjwhxdgk4AMzeTDtK+c+1ZYLzGlPYXoJ4xQez7v+J/rGd
	 HZpOrsLIHMHwTcETbW27urOBwUkfw3opiKruVCrzOCTbxx4QjBLKIXChiJ1ME+p+fPFQD
	 B4BT1awm6bWTLviP0jm3sSTeJv+e5wrcpCrtfGxkR/nVje+4Y/o1pVpVFnteYNadVbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p85Su7jF;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EA560A6F72
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46EA560A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p85Su7jF
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-84fe2593525so3521257a34.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356664; x=1794961464; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlJZl+UE9pf/QC95ZJSnwsGYNSdLtTHc9yxgINOhNxY=;
        b=p85Su7jFZ6yoicaYSLsRSAUeStCdDIVjHpc8l0nMwF1Ga2T8cUkPWsoJhSidQozccT
         9VfXHPEtDI+1iyAC5elG5TMivCYmn/zpSdGvYvxM46wmdTvdSEUitNmah2oX4ar24CC2
         iB4Nz7mOBnt70VOO3pxN8KGmB/JxloUHuWixW0af1AFirnKsKvWJ1ggy+PzQ5ELEVLL/
         +IkuOFmzp3MdFUCpETF1CGtgebDAePa68se8EZkBlrdzbhO03pFt8nSBf+V+Cp74MgdW
         Ki9Lirbeoc/TrbLX7SPh3xr7HDi6+NUK5280gQCgIbfzppffKHToco4m1uSGZ2nqW5Me
         y7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356664; x=1794961464;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlJZl+UE9pf/QC95ZJSnwsGYNSdLtTHc9yxgINOhNxY=;
        b=a1ktGcG4VBbp6XGc72N920sK0KZi8D8xVqQlEn78YmSqmxzCVwQZA4GhGwBTh4bxUD
         65vPpVbw+KRabJE9fftMbU1f/+S+QFnS/whWVvzT4aJ5M/T8amPDFa14sLWVvLni0tCT
         sppNHax/hXJpGsbJKssXSBebutVDXH8hGg2wJi43re9DANRg1RwCfWDNzsHhfiP0GRSl
         UFG00AjucA9V8xYFkwTl9D6s8pojD+RaZiLKnXyUdnTi3IR/b08WHC7ZkmDkbZ+L/8Kh
         5aLqnzSTQQUhfyHTkT2c4QTy4Xgg+F1druHDxF8+zvbNme4uVqa6Wrk7WI8SC6HUaZPa
         SLBQ==
X-Forwarded-Encrypted: i=1; AL+hErEyqVECHBbU22rPfHBn6zZ8HIifJqomZdoZbE1fSjZB2U2R3iY1kw+1eRHAdCFEvoXCr2L+F03plTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bhn0ovVe1NOlwSgVdjzd88fZ7A/i7pD/E9bRIKjsXtG3pig4d
	qyNp07QNqBYSDgo6AH+3aTjaJ7j/wPjtWWi/lTFh6bfO/p192Qa5wun9xrogy1mtajygs7r2y66
	6fp37KYh7O0AMKw==
X-Received: from iovs14.prod.google.com ([2002:a05:6602:2bce:b0:9c7:8645:9285])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a01:b0:540:5827:6d8a with SMTP id 5614622812f47-56b98d23beemr555789b6e.66.1794356663846;
 Tue, 10 Nov 2026 16:24:23 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:51 +0000
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
Message-ID: <20261111002358.1842967-14-dmatlack@google.com>
Subject: [PATCH v4 13/19] mm/shmem_luo: Allow preserving tmpfs files
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

Allow preserving files on tmpfs mounts by dropping the link count check
from shmem_luo_can_preserve(). The check was meant to limit preservation
to memfds, which never have links. It isn't needed anymore, since tmpfs
files are now retrieved into a file on a tmpfs mount.

Userspace can keep using a linked file by its path until the Live
Update. The path of the file isn't preserved. Userspace creates the file
to retrieve it into, and can then link that file at the path it wants.

Preserving a linked file affects everyone who opens it by its path,
since its size is frozen while it is preserved. The permission check
added by "mm/shmem_luo: Require permission to preserve a file" covers
that: Callers need permission to write to the file, or must own it if
its size can't change anyway.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/shmem_luo.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index 7242664ee4ae..94d617b15489 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -757,9 +757,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 static bool shmem_luo_can_preserve(struct liveupdate_file_handler *handler,
 				   struct file *file)
 {
-	struct inode *inode = file_inode(file);
-
-	return shmem_file(file) && !inode->i_nlink;
+	return shmem_file(file);
 }
 
 static unsigned long shmem_luo_get_id(struct file *file)
-- 
2.56.0.542.g3ef89b7020-goog

