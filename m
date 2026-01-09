Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92963033F8
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 11:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958146; cv=none; b=RhKsqVDTax5uyr/s/+hl1yQ/SNulzO2DIWN1R696aYsBwtazbhFj3Mjqgp+8+p6mnYig1SqExshLaPq3+A+ZCpGU47EMybm9a+c2AuSgNkx3NxuNxzb7cmlm3kUwriqKwN6zsRMGk1in7CzEUQIqWYa2iA6utph1W9EZMYQcWIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958146; c=relaxed/simple;
	bh=42xckaESf3j1/c9BstDJDSEUMXBt7iNWBkDF/+HLvPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xr/0+vOePKlwO2QxPDo4LG1pAgBzqMtBOO3sVkvzgZBUOpmOAenNkBEEdIJswZpFPFECUvMu+M2z7tRZTUGK2xTBf7JS57Wc/7cvUAiwwM+eK0+XD76Pv23kxAr01XU01vO1iFIZPPQ4UainCW+eeKRmfHbr44Ss8Fb4rkpTzbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ3zDuHu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ3zDuHu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so14006975e9.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 03:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767958139; x=1768562939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzXTN5GPRXX9JktaEoAXzWi3s9VynOdluwYCuvOxVM0=;
        b=jZ3zDuHuxK/Sqh+ceepekrnR1yweshgh3nHdiD/9KnWrRAWkW/XMXE9GARjOudogPX
         U4Z8cx2+IVIflPUlCwqB09iQwl09IJ+vDDp8GN25fuhrH5zNp1yRGaL1ySn1tMG4aHe1
         6/BNMOID5X043DtlHMcO/RjOYjhdIIhSV6HSoYuBQtEdc6Y5SXf/0dF1vYyVdxWCpdeX
         g4aQpT5qQxsYmSeS57iEMWLnzqdDwihPt7cWOfnGPbMt6nhV4FkbzpARDA7P65bczK+T
         6QF0va02S1sVrsfjPkr0SRmmV/2MLlmUKZlM05C744KYpXKxnfOPzNPh5uMR41n5Rp+7
         SZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958139; x=1768562939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzXTN5GPRXX9JktaEoAXzWi3s9VynOdluwYCuvOxVM0=;
        b=NbwcetDv2NszUXb0sdUnPVzaR1IR6gQguahQEF73HGHWpjxtwaDo+0JbIf5SfbXl/S
         Pe1nr/nd+knlkY8MDPisPeyq4RbduYv2Mxtso7rXrA0zmn6D5rk3J0+ed9OgooP3P9nP
         SBd99b1Bxy1XxQbcrnfVYG++PhCDjPIYJ2Ekamz8Qvv+f7muLFUZ4J2BK7eNHzthadEs
         MaFB9LmP+OzB9ChA2UeuZT0JfmZVihiNmAMbrm3MeOyqmAT1I5KWLOhzxsXY8v36L4pL
         3hp2hIYVp+p63JxP4LhH8gWXbrzrYmRUXVvFjdpIK3FdNGPlrhJTDpqSD9fA6/ZmTNNa
         be6w==
X-Forwarded-Encrypted: i=1; AJvYcCVNnj4mz6+z/ISP4mhp+9cUQFImqXkcAKgcGOZ3qE1O6QZIKYVz8yUFUi1HZlvP3jiorhy8i/0j8zU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoVLl9nF1sq0C5NNw2Dmuh4yZnmzEee0UXNQzV2izz+0aeah3S
	6yJ/9lIwg9rcFRQyR7IyYl7LDaCK5tVtdIj17qqJoj36B15goumn6Uld
X-Gm-Gg: AY/fxX6FL62FS7kMvZjA8Ftxfhhf+o6eugqMqgoVGVCFl7kgJU+EJLXRTNnRHoxYoDB
	QrMDFUV7p/MKNJmrPI7rJm4Dkr0pdSnGekm+TRjjjkv5gy0dKr66r7l96PgISmhRKbPzOeEc4eP
	cEl5RbISpRzCenVOHkdoyGRnQF2vgSA4rF+sPxPrQJJLUHA8zvr13AwJJUVxE1XYN/adpJrjB1E
	c1dZDZ+LxE/Vj/M5QCvn8k7yd4JkoqIHGFzfvWwPHE3z+gib5FAMVCrdwZ8FZMMgbmKnlLsuLC+
	gHQAHFJDKQhqPBbGLE+t7sixNYZdRNhbTVhZMigv3fYRNyrofaRi9V+miTvCXT8Wfu3UH3ImIbY
	PgFTLZunnp4WWdtwQx3sfISoAkPwIy/y745BdQ/7EPJVOaPREfLOO+T+0Ep3AUuctEMIjYlSTF3
	D6MWdhGaRrDIUwI1veeY9AwFdlQEjImJ7P+FLNvurN8s90MUuZ0PmoAiWeAJCoJapY+tTNsg==
X-Google-Smtp-Source: AGHT+IEyei4058HWVz7j1Ties6/iGQL4tmWJgfcaL9xqAMs5HpVk0uNC+wFxI/pUEYC0UA3VPD2wSA==
X-Received: by 2002:a05:600c:55c6:b0:477:75b4:d2d1 with SMTP id 5b1f17b1804b1-47d7f627ca1mr114093315e9.15.1767958139299;
        Fri, 09 Jan 2026 03:28:59 -0800 (PST)
Received: from 127.com ([2620:10d:c092:600::1:69b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636c610sm60056985e9.0.2026.01.09.03.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:28:57 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Ankit Garg <nktgrg@google.com>,
	Tim Hostetler <thostet@google.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	John Fraker <jfraker@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Joe Damato <joe@dama.to>,
	Mina Almasry <almasrymina@google.com>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	David Wei <dw@davidwei.uk>,
	Yue Haibing <yuehaibing@huawei.com>,
	Haiyue Wang <haiyuewa@163.com>,
	Jens Axboe <axboe@kernel.dk>,
	Simon Horman <horms@kernel.org>,
	Vishwanath Seshagiri <vishs@fb.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	dtatulea@nvidia.com,
	io-uring@vger.kernel.org
Subject: [PATCH net-next v8 2/9] net: reduce indent of struct netdev_queue_mgmt_ops members
Date: Fri,  9 Jan 2026 11:28:41 +0000
Message-ID: <f6e893b6b745873757331bddf25dd0a978adb5e2.1767819709.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1767819709.git.asml.silence@gmail.com>
References: <cover.1767819709.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jakub Kicinski <kuba@kernel.org>

Trivial change, reduce the indent. I think the original is copied
from real NDOs. It's unnecessarily deep, makes passing struct args
problematic.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/net/netdev_queues.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/net/netdev_queues.h b/include/net/netdev_queues.h
index cd00e0406cf4..541e7d9853b1 100644
--- a/include/net/netdev_queues.h
+++ b/include/net/netdev_queues.h
@@ -135,20 +135,20 @@ void netdev_stat_queue_sum(struct net_device *netdev,
  * be called for an interface which is open.
  */
 struct netdev_queue_mgmt_ops {
-	size_t			ndo_queue_mem_size;
-	int			(*ndo_queue_mem_alloc)(struct net_device *dev,
-						       void *per_queue_mem,
-						       int idx);
-	void			(*ndo_queue_mem_free)(struct net_device *dev,
-						      void *per_queue_mem);
-	int			(*ndo_queue_start)(struct net_device *dev,
-						   void *per_queue_mem,
-						   int idx);
-	int			(*ndo_queue_stop)(struct net_device *dev,
-						  void *per_queue_mem,
-						  int idx);
-	struct device *		(*ndo_queue_get_dma_dev)(struct net_device *dev,
-							 int idx);
+	size_t	ndo_queue_mem_size;
+	int	(*ndo_queue_mem_alloc)(struct net_device *dev,
+				       void *per_queue_mem,
+				       int idx);
+	void	(*ndo_queue_mem_free)(struct net_device *dev,
+				      void *per_queue_mem);
+	int	(*ndo_queue_start)(struct net_device *dev,
+				   void *per_queue_mem,
+				   int idx);
+	int	(*ndo_queue_stop)(struct net_device *dev,
+				  void *per_queue_mem,
+				  int idx);
+	struct device *	(*ndo_queue_get_dma_dev)(struct net_device *dev,
+						 int idx);
 };
 
 bool netif_rxq_has_unreadable_mp(struct net_device *dev, int idx);
-- 
2.52.0

