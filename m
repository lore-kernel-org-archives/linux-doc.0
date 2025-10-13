Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442C030AD06
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 14:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367206; cv=none; b=Io4oqwstY/kiKkddWzXDdOqx+X3lcqzSUsm6zvtrU0ToDYzeA1oJ0U5Z6UjqCqrBrCDgVU+GxwI5uCDpMJJOhe/7mEt2dJxodj1PeUbnsdZvvhDko1kVdbCSc3x8mchdo2jiH5iYyV9kDx5OEjW5yeaQEcwEOVX9weUP5iGGR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367206; c=relaxed/simple;
	bh=7sj1EbpAJnpeoVxMcwuWL5zaTTOuVyXNUSbxilQjCno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HP8ujELh8jTAGxGpk5Kqfwj9tdU5MTNDmK3vMTevq2h0sKb2ZSOpqieSyxseqU6YqPR0fXQdKeySRcLKbpCacNoHNsuzTVuMbcv4J3jF0WcgCJS1P6ACEo4TPTGtvXNhlMlLJMl/V3ioY7XeVGCE/afR0SDIM8G5ZHV6/rJ6F+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UctH4wmB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UctH4wmB"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so2537078f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760367202; x=1760972002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqDy67Vpwu3GYg1tc86jhK5pz5tDZBEzHj59MW+Ighs=;
        b=UctH4wmBAKbnO0vP3yMu2v49mDyJRbxIaYIwLePGAWHxopZjFpXBsZIeBl+qR3GAl1
         XpmCRJRlhsfcLHZmc3k9CgUSAa9gtvnyWcGJu6jZ2ZLUWj1R/bu6plny8LaRw0X6BI7I
         BXdh0FzvmnLxzuB9BFw5QiYieUpnqK0jia1HZKqqcYRxGlBUZhqCqUBIBCiICNxJSMI7
         cLU/ixvgI53rY8lGbXKwkquaf+9ZcVLUfXjoBbz8cEPSv+PBOyQJJemBtp9HKFetixpt
         l7hC7IQFgNjXFv37bAp99VmdJtOJjh5FvHTyuZmfdlFQS5d9lAzhQNbTyQ0iEZcWplfn
         syDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367202; x=1760972002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqDy67Vpwu3GYg1tc86jhK5pz5tDZBEzHj59MW+Ighs=;
        b=uraOUaHgBQfxC4fHWrZ40maFbF0hc0zquWNlSUwCX6Bg2Chtw/cETiXmqDsKp4VeWF
         7dqsBOpC9CAxPZpVvEQdXoV6t7qPeY9CP6fMeylejgbDdfJM7FKP7uXmy99XAqzRSapf
         LnoAyRZFSwqp92RIiCFEm4q54aFkWlq++jHTb3DcKNYrd+ea9toDAvugsawQDOTRD5FF
         AolC8F7weXdeUOlU7iSfMiocFTAQbPXso6RNe5E/xWCTB3Wuughze6p8T4iDgBM7JS/U
         8Rs6688RCVL7Pq+t6MOEo4sH6yq2sf9mnqpEXNLFAG3qZM5WvXOsvkIVK8Iw+XdWH+c6
         mDvg==
X-Forwarded-Encrypted: i=1; AJvYcCVDQTzyEDS/nkGASOqS5P0q1ON9++Xp32oAtLr7CZkkF5aNsG+CiIO9I+eCegAw7lZ0MJ3nDXA+Mic=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTKE/tLNUXIhOh5KZCXeqpQXsNdfRlXxMxjk6meQDAkFBz4WZM
	+BxxJOxB3qqIHGFidO2F/ArPH9FZCVGDApxbIenQKhBjynSBHCb5DDVA
X-Gm-Gg: ASbGnctu7N6b3iCxIqBgXKao/w1TlESiaSNUyG6iHiyS4mgjA/pTBlg84q8V23nzHL+
	hJI33SNFs7pkeJrIvKIfjPHdn2cLk3EJnXq7MflS8JzlvC4YDUGUC5OQLSWShfFUVidWlr4FT0L
	TrW8+DH9n9r1eMEL/DEevB6iG/6JDdKBvGsmuEX/Pt3esY8Dc+gWVWq/rZGkeK6SkL9rM1AZFom
	zI45cuBUVd3sy9indMNXpxgVfF3BTLakc7PmSsTfmKlr1Y/SBqYAJj945yK53Av5PJqA3lHJC8M
	aMBn/+TfCudlHaxfgrZz4ZfiaLcrf316/ybACSD6vi4KQzU15QSYxLh3CAq81Y1YDHEKnIA3/SH
	+mBu73Nwrw8NkPfPrWAr8jhVY
X-Google-Smtp-Source: AGHT+IGuhS3kQZ1R1xe6ZB/ZEr0fg6Xs5SvekWOSlXtM50KBa0/ETxk5cO3wUCuWkLLaVPOmY7sV0A==
X-Received: by 2002:a5d:5d03:0:b0:3ec:e0d0:60e5 with SMTP id ffacd0b85a97d-42667177bd4mr13708475f8f.15.1760367202162;
        Mon, 13 Oct 2025 07:53:22 -0700 (PDT)
Received: from 127.com ([2620:10d:c092:600::1:eb09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0e70sm18641085f8f.40.2025.10.13.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:53:21 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	kernel-team@meta.com,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Joe Damato <joe@dama.to>,
	David Wei <dw@davidwei.uk>,
	Willem de Bruijn <willemb@google.com>,
	Mina Almasry <almasrymina@google.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH net-next v4 01/24] net: page_pool: sanitise allocation order
Date: Mon, 13 Oct 2025 15:54:03 +0100
Message-ID: <96099d1c7af73b1086ec1c7de1488b50147d07bf.1760364551.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1760364551.git.asml.silence@gmail.com>
References: <cover.1760364551.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're going to give more control over rx buffer sizes to user space, and
since we can't always rely on driver validation, let's sanitise it in
page_pool_init() as well. Note that we only need to reject over
MAX_PAGE_ORDER allocations for normal page pools, as current memory
providers don't need to use the buddy allocator and must check the order
on init.i

Suggested-by: Stanislav Fomichev <stfomichev@gmail.com>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 net/core/page_pool.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 1a5edec485f1..635c77e8050b 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -301,6 +301,9 @@ static int page_pool_init(struct page_pool *pool,
 		}
 
 		static_branch_inc(&page_pool_mem_providers);
+	} else if (pool->p.order > MAX_PAGE_ORDER) {
+		err = -EINVAL;
+		goto free_ptr_ring;
 	}
 
 	return 0;
-- 
2.49.0

