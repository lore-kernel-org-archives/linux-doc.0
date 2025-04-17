Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2322522CBE2
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 23:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931760; cv=none; b=eySPmt74/GRgml4CmKTclUKvolTBM9NpcEhBXsHCPS5kBh7UO+Uni50Xt9d+4JYcKyZJG3lc9E6PuA7pqkWULh0mXRZUouSgmlKEdD3Yp/OUYDfbTDbHNYWJQNaME1FG1jzYFSvRJXPs6st5R+YNvo3cbCDoJ3UirvbO6GNBR3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931760; c=relaxed/simple;
	bh=7byv+zUvG9fGnf8k0FbZ1yDFOO2dvgSnWo6VU6i7tDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R7n1d9mIs9INUFLOdYj2xl5lI0mC38HzL8PQ18lfS3njCXt8mP2iQ7hD5IRAflZh5FIug6YR5WKoHbdaC/tIq8B8WK9GU4PssNMwfkyazG1zlyvRy0+PVT3PsH97AG6DBlGeUuZe95/A0ENCfkmywqXeDO7u1tj3Q+DFtPbcSDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XPFOrQx3; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XPFOrQx3"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736d64c5e16so1130277b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 16:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744931756; x=1745536556; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwpjUEwFopJ2W78Zyje6DYSCKHgKSTGRi+BWAuCAZr0=;
        b=XPFOrQx3qNqaeTHpx3Zcz2+44f185AvmzH4uuYI6+tGiPZXo5xof5bCMZTUBssiPoO
         Ga8rdlkHcQuksXlajm4j09Vqn1eqsHgB92s+bFYNGaiJwvGhFl+ESTn7GMPWzVbj0ALD
         HcZUAmffn7TWfeRiLym7H5xCtFIcgPTWT0ytzanyeDoKeXqPOxQJpf3ZO1U2ZrcZKS2U
         GfmevWtfEwd+5FU/c1MVdPP3esCxMXbFkoDE1hs8/RzAA867Pwg+0/E+7VOyxN8BUPYt
         M/yydAsRGmGeX2ResIScE+zpdPr8kX+59sa/Cr3R4xN39VBYWZjrZ7eSpfzDOoFMirFI
         AjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931756; x=1745536556;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwpjUEwFopJ2W78Zyje6DYSCKHgKSTGRi+BWAuCAZr0=;
        b=DdQPg5YzvL14NEXZCyFAFx45UEAzwwMoHiWI/PnGKIaXtNeOuZ9/oFlQS7Yhz0cyqY
         zaK3ZDFwmMGd2B7aKiBTHJMEJmDu+YVeK0SVgHmPKf/yWbyHFPjehBSONOdBWhT3LqLo
         713jt8d/sVcBjdM+YEczo4zFNjBcr/ooJBldh5+N4ZpHuRI9KLF769OXCQ1tXWR+c2tz
         SdN/RLwGv2mY2HW7DR3U3OaNS9nzZuaBGKwrs0gO2KNnIrV4Ky+ki3TmHWso/LjFL7KT
         pXsrmdSLO6bb03b/AEhdIHJXhGf4pnBcqMPH+bWLCorA/rY/h0Nycq1HkHgwNybYmDJa
         WZEA==
X-Forwarded-Encrypted: i=1; AJvYcCXgkRnT98P8IZjX5tffIxQC9fGyDgqGRnFrexN9ocb2+ecGqfz9KSuUPqX2te+MKra9xh46rM2Ww74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBCxlsvxY2vFD7NPpW2u+hVPHpXZa5SyCYx06DR1STkxxsROX
	+j7MgI+E6P5JOFWJvUWzQGuOqDv/wGtFILp0v7lrw/7lvgmIqUU4nTcCIwvWUuVY8VPqEHaOeJn
	Q6r5zkHClGZc2LAk0M9AqbA==
X-Google-Smtp-Source: AGHT+IGbSpY41Gk0f2k8ImJTriyRDV0N0Eh39CVKrX5c+HnI/dX7PHa30LJHBo7qvoYPBvraFQs3AOfv4WzHMRa9Ag==
X-Received: from pfbgj7.prod.google.com ([2002:a05:6a00:8407:b0:739:56be:f58c])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9186:b0:1ee:e20f:f14e with SMTP id adf61e73a8af0-203cbd48a0cmr1121301637.38.1744931756428;
 Thu, 17 Apr 2025 16:15:56 -0700 (PDT)
Date: Thu, 17 Apr 2025 23:15:39 +0000
In-Reply-To: <20250417231540.2780723-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250417231540.2780723-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417231540.2780723-9-almasrymina@google.com>
Subject: [PATCH net-next v9 8/9] net: check for driver support in netmem TX
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

We should not enable netmem TX for drivers that don't declare support.

Check for driver netmem TX support during devmem TX binding and fail if
the driver does not have the functionality.

Check for driver support in validate_xmit_skb as well.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>

---

v8:
- Rebase on latest net-next and resolve conflict.
- Remove likely (Paolo)

v5: https://lore.kernel.org/netdev/20250227041209.2031104-8-almasrymina@google.com/
- Check that the dmabuf mappings belongs to the specific device the TX
  is being sent from (Jakub)

v4:
- New patch

---
 net/core/dev.c         | 34 ++++++++++++++++++++++++++++++++--
 net/core/devmem.h      |  6 ++++++
 net/core/netdev-genl.c |  7 +++++++
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index d1a8cad0c99c..66f0c122de80 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3896,12 +3896,42 @@ int skb_csum_hwoffload_help(struct sk_buff *skb,
 }
 EXPORT_SYMBOL(skb_csum_hwoffload_help);
 
+static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
+						    struct net_device *dev)
+{
+	struct skb_shared_info *shinfo;
+	struct net_iov *niov;
+
+	if (likely(skb_frags_readable(skb)))
+		goto out;
+
+	if (!dev->netmem_tx)
+		goto out_free;
+
+	shinfo = skb_shinfo(skb);
+
+	if (shinfo->nr_frags > 0) {
+		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
+		if (net_is_devmem_iov(niov) &&
+		    net_devmem_iov_binding(niov)->dev != dev)
+			goto out_free;
+	}
+
+out:
+	return skb;
+
+out_free:
+	kfree_skb(skb);
+	return NULL;
+}
+
 static struct sk_buff *validate_xmit_skb(struct sk_buff *skb, struct net_device *dev, bool *again)
 {
 	netdev_features_t features;
 
-	if (!skb_frags_readable(skb))
-		goto out_kfree_skb;
+	skb = validate_xmit_unreadable_skb(skb, dev);
+	if (unlikely(!skb))
+		goto out_null;
 
 	features = netif_skb_features(skb);
 	skb = validate_xmit_vlan(skb, features);
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 67168aae5e5b..919e6ed28fdc 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -229,6 +229,12 @@ net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding, size_t addr,
 {
 	return NULL;
 }
+
+static inline struct net_devmem_dmabuf_binding *
+net_devmem_iov_binding(const struct net_iov *niov)
+{
+	return NULL;
+}
 #endif
 
 #endif /* _NET_DEVMEM_H */
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 5f44f7a3cbdb..b221fbbc5eca 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -974,6 +974,13 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_unlock_sock;
 	}
 
+	if (!netdev->netmem_tx) {
+		err = -EOPNOTSUPP;
+		NL_SET_ERR_MSG(info->extack,
+			       "Driver does not support netmem TX");
+		goto err_unlock_netdev;
+	}
+
 	binding = net_devmem_bind_dmabuf(netdev, DMA_TO_DEVICE, dmabuf_fd,
 					 info->extack);
 	if (IS_ERR(binding)) {
-- 
2.49.0.805.g082f7c87e0-goog

