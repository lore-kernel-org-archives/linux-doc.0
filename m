Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F019B1F0E45
	for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733952041; cv=none; b=eg81E5WM1eOw/fUzDglomFrmPrKR/RbqMvQ+zBoia7Hj2x85KMnRS+8b5QYBURcn/RUU2bs3KllMn5cUfkGh8EvM5UgLm55TdoFqYrpZBDwdSnzHSmwkwwbNUMicbTA3iUSLd9J3AYdsPA0NwKM3sVuayv9khy7uxQ1CQ3VTgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733952041; c=relaxed/simple;
	bh=b90XShILltXC+LvOAJbN7AuVnXlBIVN+oi/xu7qF+1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=azddL0WiEuQdDTO9GTgGkNe7VWK7jHPZeu7HmtOG8PrBpssjHsai4A4iKASfK8qgZlksAFWU9pR22vrokWszslaiisgVTC+yc+4ilWcUoPUHm+H2R+90YFhbHxrDXVqdX986XqHQYH+iGsOB4wWfo+i1+qBzFmE4W+QZ0hR14ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s/EpJ0W2; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s/EpJ0W2"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-725e4bee2b0so5957699b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 13:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733952039; x=1734556839; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VkkaSKdaGNTNNhg4FUb498GHLs5FUYHJ5RvbafI+ZxI=;
        b=s/EpJ0W2mNFEeUnNn1xZ1TFGvqlWTt/ynOuqMsa/43tYpPRomrTsZI31x+4idNcsGJ
         p0bfQKfAU4Jks7ctcnEorFsbfjD7ENbp6GkW/tYV7qaoD/KVLgdn4BMLw7WSQC9odt9G
         rzGnsb064jnAS+0u9wflHiiulXj+KkItTUSbc2qzehLmp2SWEndYdm5XnzhgwpdyyIHL
         vQxVKtflHywz7LBt4G7BaiwtlbSP8ZVJTBVeXRdykSt1YkS3X7cdmFvRzBu2dhCR4hm5
         dVTIpL7Hx8V0qa/C77W+3YC+6iXKY90xUbkRqyXLqZnbffceXTyGZ8CC/QRonkIcZaRw
         IomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733952039; x=1734556839;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkkaSKdaGNTNNhg4FUb498GHLs5FUYHJ5RvbafI+ZxI=;
        b=uTeUCxcjgsPa+cbNtpd+rMdarAMZAufyC577312x5322PUQbXfonSoHEKzAsUdOAOJ
         ealaRLgo9+va7G0YO7bMdBLWHA6A7E62/KT2FdvRwvvn1KvwXeeNEZ2/dWRcdFgJ5DCo
         Xp3xgLqnW/acRSbsX3gCGT+kIL1ULkQ52o22lR97grWBMPqwjkXDgZcxBCVDpnDdE3mm
         3WpoAPULzq4fbDEILXIBxx2cVc2iLCodCHFpmAJc/Cg26NSyGvlh/y0JmzJm28ExD1OZ
         lT9cvHG8vLuom5Id/3OBlR8hQMZZS61UV32QQV9ehyfQp65pRev89UOoe7Ue+Gjnck01
         C/0w==
X-Forwarded-Encrypted: i=1; AJvYcCVU1AYazk3+2jWBkkNmbTO1QrWpoSAPikP7JFBZIjl+fnJS/+GzXcqTJsfl7K8c+svRfAs48KPM1O8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGCmzt80xdBL6a21tdRJQuxhcjmrlBvR3uYPQLbFr5hScr+Za
	HRjSAnoJPIIu2EqExdO+NVr91xetfOo47FhvgrRh/s19TDxHLKX606dWFTbmDxvUYDBHFi4Ne8L
	l9LlLr24aOXqQdiLA0tamPg==
X-Google-Smtp-Source: AGHT+IEWhVqk1hESVIlHN9fpnPz7ovhaAwHnlpf82RR0HAKH6Gbqs6fHleZO+74e3iAsiD+P7NcS8Md3jf3KevFa3Q==
X-Received: from pfbc2.prod.google.com ([2002:a05:6a00:ad02:b0:725:e76f:1445])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:258a:b0:1db:ec3e:c959 with SMTP id adf61e73a8af0-1e1cea99eadmr1328009637.10.1733952039349;
 Wed, 11 Dec 2024 13:20:39 -0800 (PST)
Date: Wed, 11 Dec 2024 21:20:30 +0000
In-Reply-To: <20241211212033.1684197-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211212033.1684197-1-almasrymina@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211212033.1684197-4-almasrymina@google.com>
Subject: [PATCH net-next v4 3/5] page_pool: Set `dma_sync` to false for devmem
 memory provider
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"

From: Samiullah Khawaja <skhawaja@google.com>

Move the `dma_map` and `dma_sync` checks to `page_pool_init` to make
them generic. Set dma_sync to false for devmem memory provider because
the dma_sync APIs should not be used for dma_buf backed devmem memory
provider.

Cc: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v4:
- Improve comment (Jakub)

---
 net/core/devmem.c    | 9 ++++-----
 net/core/page_pool.c | 3 +++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 11b91c12ee11..3ebdeed2bf18 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -331,11 +331,10 @@ int mp_dmabuf_devmem_init(struct page_pool *pool)
 	if (!binding)
 		return -EINVAL;
 
-	if (!pool->dma_map)
-		return -EOPNOTSUPP;
-
-	if (pool->dma_sync)
-		return -EOPNOTSUPP;
+	/* dma-buf dma addresses do not need and should not be used with
+	 * dma_sync_for_cpu/device. Force disable dma_sync.
+	 */
+	pool->dma_sync = false;
 
 	if (pool->p.order != 0)
 		return -E2BIG;
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 3c0e19e13e64..060450082342 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -287,6 +287,9 @@ static int page_pool_init(struct page_pool *pool,
 	}
 
 	if (pool->mp_priv) {
+		if (!pool->dma_map || !pool->dma_sync)
+			return -EOPNOTSUPP;
+
 		err = mp_dmabuf_devmem_init(pool);
 		if (err) {
 			pr_warn("%s() mem-provider init failed %d\n", __func__,
-- 
2.47.0.338.g60cca15819-goog

