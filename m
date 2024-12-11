Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91DE1E9B3C
	for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 21:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733952038; cv=none; b=uR4ch7viivTY8wlFdzks16HpIIBXaM7Q2B0XLWL6SxmO4Bn3SaUsQZXI2NrrEV76/0wJBvd64WXnpaM0cfVMMXQ2H/vHGuWfD3qrfb/fM5D6egOo37vnEXea8nafqoRmpqto7IqPWc3KknI+4OBEsDO0fjspzVFxUxB/ox3Qpco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733952038; c=relaxed/simple;
	bh=inYtJTadn/ilQufeg2hRjROOpb6WnuRJ/R3Eo2kT9Ak=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IAwZ9odfhGHPzN9zZ7Hx4f0V9j63pBTX4IoW06Rbaa3n1IbYVJoeIYQL1+lo7Sy3vT8itTOqve5EGwrQLloDnPnwDSR8r/DXBz4n+0ISM5vCQ7m0uRhNF2oFIvifCEC6ezh7RsynaIN/vC3ye/shlSJGVMCp8NOlTgB59OPdnI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lUavxQ9e; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lUavxQ9e"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7f3e30a441aso4713684a12.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 13:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733952036; x=1734556836; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rD4fHb5o8v+27TSL8zHXq3Z19Qh3ytPkt3LCpxEoKxE=;
        b=lUavxQ9eRMEmBsI3lEvBBfmHbFKLjv9u0oR1LJycr9qZR/4l+FLLOTEzK5nkeeDPoX
         WmuXZRRrBR84rXRgeqde4QdYXcvSLGAtKNqpBQJ7dAM/JMeaY2Cl8aRtavgFpKc84nK2
         mEeEGWCX60SkfJLqBnENNJSq1R0wnTp/QbZe3Y5o8QGrRxu8JcUE4I90lnRp6I+kLz/B
         nNfGfNYLHYuPiaZmFl/FCi/aghtfdHb/EseZT2ZZGQF4IcfVhww6/6ZqPjd7LYZJGLQ5
         YeoUHSPdLYB7gSMCBVxOa8lveYRLaHTV9hoGiGuml6XcQc0udU6g6VwYN6tJ5PtwQEOm
         1JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733952036; x=1734556836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rD4fHb5o8v+27TSL8zHXq3Z19Qh3ytPkt3LCpxEoKxE=;
        b=StW5R0ueSesrYeWtKFsjS4eUaAwaLmFsCNKFX5ytc1iYsBopZ0TQpJG+kNj8gyISs2
         edJCi5mrKpH87J/mjWt8WhtjPshRjrY/h3g56Et8SgXwGhkOLIox5XuRMvlMa4qw5/7N
         xyHI+6gPqnRuz/f1zs2ikSTQ0cbUJKib7+eLuN/jgJ0Ovu1kQEMmBTsmpwRizKKe/FQW
         tE2iNAwAHj8BgmeBve8NpBjTJAJ/BgCxX7T4lV4yvxRgYrT7muLC6jcqzOScMk2NsBtz
         DOhGVcufDo+j6lrt0l65xGlbit+ro+AOt9DeNxFbbMkkMN33eHiTtHfyVzpb0tGt/maC
         rT6A==
X-Forwarded-Encrypted: i=1; AJvYcCUvD++IXkcbtFUOVfwWjKHqXqkhMumZRr/OeU6PPX3gjdINFXG8Lh3jYCNI2uqutezQwFFZgLXbRpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ29MNM+NrrDcVzspVnFP7thbRZfaEzTS8yI2QcxKJrBnmHPcE
	aTHmpJrr8gSw0MWkscMxc1F/gH3l4H5yZAogEjjmGrCtAQ2r6qeKJPyc9y+KBlCtMP9HY3RuTyc
	0JM05lZ+erBK2MIH5waYAWQ==
X-Google-Smtp-Source: AGHT+IHYrU+SD7vPYOEQ3idsKub4yW3CEQ29DrUylYyi6L34qN5kVr/+aOtP9HfJhrQ9YokFfMxe3gTS5yVuZy+J1w==
X-Received: from pjg16.prod.google.com ([2002:a17:90b:3f50:b0:2ea:4a74:ac2])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:510c:b0:2ee:e158:125b with SMTP id 98e67ed59e1d1-2f128032774mr5992885a91.26.1733952036117;
 Wed, 11 Dec 2024 13:20:36 -0800 (PST)
Date: Wed, 11 Dec 2024 21:20:28 +0000
In-Reply-To: <20241211212033.1684197-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211212033.1684197-1-almasrymina@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211212033.1684197-2-almasrymina@google.com>
Subject: [PATCH net-next v4 1/5] net: page_pool: rename page_pool_alloc_netmem
 to *_netmems
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Stanislav Fomichev <sdf@fomichev.me>
Content-Type: text/plain; charset="UTF-8"

page_pool_alloc_netmem (without an s) was the mirror of
page_pool_alloc_pages (with an s), which was confusing.

Rename to page_pool_alloc_netmems so it's the mirror of
page_pool_alloc_pages.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/net/page_pool/types.h | 2 +-
 net/core/page_pool.c          | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 1ea16b0e9c79..bd1170e16cff 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -242,7 +242,7 @@ struct page_pool {
 };
 
 struct page *page_pool_alloc_pages(struct page_pool *pool, gfp_t gfp);
-netmem_ref page_pool_alloc_netmem(struct page_pool *pool, gfp_t gfp);
+netmem_ref page_pool_alloc_netmems(struct page_pool *pool, gfp_t gfp);
 struct page *page_pool_alloc_frag(struct page_pool *pool, unsigned int *offset,
 				  unsigned int size, gfp_t gfp);
 netmem_ref page_pool_alloc_frag_netmem(struct page_pool *pool,
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 4c85b77cfdac..3c0e19e13e64 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -574,7 +574,7 @@ static noinline netmem_ref __page_pool_alloc_pages_slow(struct page_pool *pool,
 /* For using page_pool replace: alloc_pages() API calls, but provide
  * synchronization guarantee for allocation side.
  */
-netmem_ref page_pool_alloc_netmem(struct page_pool *pool, gfp_t gfp)
+netmem_ref page_pool_alloc_netmems(struct page_pool *pool, gfp_t gfp)
 {
 	netmem_ref netmem;
 
@@ -590,11 +590,11 @@ netmem_ref page_pool_alloc_netmem(struct page_pool *pool, gfp_t gfp)
 		netmem = __page_pool_alloc_pages_slow(pool, gfp);
 	return netmem;
 }
-EXPORT_SYMBOL(page_pool_alloc_netmem);
+EXPORT_SYMBOL(page_pool_alloc_netmems);
 
 struct page *page_pool_alloc_pages(struct page_pool *pool, gfp_t gfp)
 {
-	return netmem_to_page(page_pool_alloc_netmem(pool, gfp));
+	return netmem_to_page(page_pool_alloc_netmems(pool, gfp));
 }
 EXPORT_SYMBOL(page_pool_alloc_pages);
 ALLOW_ERROR_INJECTION(page_pool_alloc_pages, NULL);
@@ -957,7 +957,7 @@ netmem_ref page_pool_alloc_frag_netmem(struct page_pool *pool,
 	}
 
 	if (!netmem) {
-		netmem = page_pool_alloc_netmem(pool, gfp);
+		netmem = page_pool_alloc_netmems(pool, gfp);
 		if (unlikely(!netmem)) {
 			pool->frag_page = 0;
 			return 0;
-- 
2.47.0.338.g60cca15819-goog

