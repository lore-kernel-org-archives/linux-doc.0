Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74F71AD3E0
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 04:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745467387; cv=none; b=TTcmfSCpZrkVVk1wxPZ29VO8hqYJV8DNfoNuB2nx4paSLQ1gTmjhnUiRu/Nmoh6W/wPuHATiJVAJR1+hC+8EEBOX3JN7K2Mcizw4y7nzVum3OzTLN0A/nCCi+VuS9RIuAXs8bXnVMJeazHrVpRm3Y8qA0KuZU/KF37HVwVp8Lmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745467387; c=relaxed/simple;
	bh=4G6PWQVuDvN75y22hCzNOaMSSVueFKJQsuXjCZZMx9k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RgLGQb5kKZCEBq2ErjHnJ52Jkajr7OLQ7KkgEIHe8ARiIbexBEwG1O3itYD+nAZjSH4wU4DdvJoRgVR0edO5j6dcqa+aJo+jvsZn3xjtyazLdfbvqdvm0wZM3Xr6cW8zJ+p7+c7jn+bUAFPyINxuHmPAqzfeLZFPAuwlIpsXER4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a5pJADMU; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a5pJADMU"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22651aca434so4664945ad.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 21:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745467385; x=1746072185; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V8selbbQToSUa/Bg+HZMawzfuX6zEarAEcQjX78fl4Q=;
        b=a5pJADMUGFeuTFDk3ssjzFL9dshF0fXby2ckg6WJw6aGJsMwiA1Tf3KW+SGE3K2QiO
         Qo8mlSy3Co5weQgLVxWHEZXbk/3uAAe0/5R/ECD5GYdXw75bOcubHIfBks8t0cLXtxMC
         o7eq9K648pDwLGwrE8BzUap+3l1EQLI/TJWsIcPBzzzNlFTOCZFoCytxrwSNhAdaXVEB
         PrHJkQ2+XPMkoGAaHVsZMcSzdrUiRosoMvP30W+TclSRqpswk7RcTKNT5+J/6bBD225G
         GlnxhzRPhRDDvTQvxzGv44tNhwLDL1WJy+iYzrRpif8IsWuVjzyenq9lfM7mZVo9/46h
         sKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745467385; x=1746072185;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8selbbQToSUa/Bg+HZMawzfuX6zEarAEcQjX78fl4Q=;
        b=br6u+YyeiMnL5UBAOJixYGBmnbEOYuyliF38/mkwm8H2h8TSak7xFW3hKp4Z9BN59A
         rT21APGyfbe60AUrOg9PZxWnopSyi3F7a6WXX+9jvPYwXm1Y4F90Qu2Z0sKq/vvxPFLX
         lJJxdwaxqxtLooHhse4Hw6klFZU1S3/eXIeldg5Hqb9gHrHY4ZtYI8qQzA1C2U2BYQo7
         onDsoDscoTxNuwhGQ+Ro59ANTIBKtzukydX5OB5Kq+yNiseLowrhQGNglvhsFzLDAKP2
         Oz5/ay3zJ8d3FcSFQpnyvwjXce8sg8P0VRAah8S6kK/EcZ6andVdNwubMdNW3xr1Tp8+
         JzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCoHvUxLEOJxYtiAcpnOxjCTxYPqdJ87bSDMT/CE394GJi9N2PUtWc/tFwcbn4UjEKx4p8bh2Mtfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCswWw99UclwGSXU1zojQZl8ZHRxsagAnh/XoNrA9TnxtDywOn
	frza9ejRFHNh2yw9h6eL2Gxz81jda2Y1VeU2i5MNiT35uLuOjr6UmLZduxUtlQHE74bsyLjIt/B
	q/9PSgMIHj4CGumyuSGrIjw==
X-Google-Smtp-Source: AGHT+IGK7UYRkqxJlzG4egQUL0etMs/8hnfBJu3kSoKaPIbND5acRDwRmuLJDjQ8rd9K1P4hPANpxbQRx4HCkhuwpw==
X-Received: from pjbqo4.prod.google.com ([2002:a17:90b:3dc4:b0:2fa:1fac:2695])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:28c:b0:21f:bd66:cafa with SMTP id d9443c01a7336-22db3c0d5f1mr15899025ad.17.1745467384900;
 Wed, 23 Apr 2025 21:03:04 -0700 (PDT)
Date: Thu, 24 Apr 2025 04:02:53 +0000
In-Reply-To: <20250424040301.2480876-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424040301.2480876-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250424040301.2480876-2-almasrymina@google.com>
Subject: [PATCH net-next v11 1/8] netmem: add niov->type attribute to
 distinguish different net_iov types
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, sdf@fomichev.me, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

Later patches in the series adds TX net_iovs where there is no pp
associated, so we can't rely on niov->pp->mp_ops to tell what is the
type of the net_iov.

Add a type enum to the net_iov which tells us the net_iov type.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v8:
- Since io_uring zcrx is now in net-next, update io_uring net_iov type
  setting and remove the NET_IOV_UNSPECIFIED type

v7:
- New patch


fix iouring

---
 include/net/netmem.h | 11 ++++++++++-
 io_uring/zcrx.c      |  1 +
 net/core/devmem.c    |  3 ++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/net/netmem.h b/include/net/netmem.h
index c61d5b21e7b42..64af9a288c80c 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -20,8 +20,17 @@ DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
  */
 #define NET_IOV 0x01UL
 
+enum net_iov_type {
+	NET_IOV_DMABUF,
+	NET_IOV_IOURING,
+
+	/* Force size to unsigned long to make the NET_IOV_ASSERTS below pass.
+	 */
+	NET_IOV_MAX = ULONG_MAX,
+};
+
 struct net_iov {
-	unsigned long __unused_padding;
+	enum net_iov_type type;
 	unsigned long pp_magic;
 	struct page_pool *pp;
 	struct net_iov_area *owner;
diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 0f46e0404c045..17a54e74ed5d5 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -247,6 +247,7 @@ static int io_zcrx_create_area(struct io_zcrx_ifq *ifq,
 		niov->owner = &area->nia;
 		area->freelist[i] = i;
 		atomic_set(&area->user_refs[i], 0);
+		niov->type = NET_IOV_IOURING;
 	}
 
 	area->free_count = nr_iovs;
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 6e27a47d04935..f5c3a7e6dbb7b 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -30,7 +30,7 @@ static const struct memory_provider_ops dmabuf_devmem_ops;
 
 bool net_is_devmem_iov(struct net_iov *niov)
 {
-	return niov->pp->mp_ops == &dmabuf_devmem_ops;
+	return niov->type == NET_IOV_DMABUF;
 }
 
 static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
@@ -266,6 +266,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
 
 		for (i = 0; i < owner->area.num_niovs; i++) {
 			niov = &owner->area.niovs[i];
+			niov->type = NET_IOV_DMABUF;
 			niov->owner = &owner->area;
 			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
 						      net_devmem_get_dma_addr(niov));
-- 
2.49.0.805.g082f7c87e0-goog

