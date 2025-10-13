Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AE030B501
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367208; cv=none; b=aY4muICFfwPTEIF+BW9WtNHS7me1i3Mn7QflvMJNUEtNAJURAwtYPUCBGJ3teMGKntB+qnStKcPjHVYNHnOyszGZznggvXhxgaUg5E4+bnsRaeN33AWVg+4qD9CEInwtrUYzPboeD4asiKc//NjUQXLt/4BF/borvy2wqjk2lbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367208; c=relaxed/simple;
	bh=w+9GYnLfpJPuENZN1hq4bylmO2y99fnzpTWEsZZvlXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZx1zjiUpHg5nsCNJNv+ukA24I4A0OXvUC54Vkg2DycyHPNvWaTyYAXjFzC0qb1rtEA6US4KGmHBvx0oxyt25lOvMhonHDOspsj/ZpUaZOJ4qkf3N14bVkVCIL5Tzq133SPhH/JrpJocLlCjhaPkuLZt9FHP0GkBIJPylHLIwFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/KBSFmk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/KBSFmk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so3633914f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760367204; x=1760972004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Intn0C5yI8uAf2z3e0yNoFGVnV8Ruh2Zw9BITbwKtgg=;
        b=I/KBSFmkr823VYLJ9wwtqrnu7+aTcICtjpZOfR/GQ5E1yCUygyix9jp0J76TMiY+C5
         yZd+9yDEdAH3g2i48cCgrqHH07RL2OdfWlSTn1ph8SQc6pOXb0XlHAaPIl/iuSFzDkFI
         cP1sJvjmu7Lx/8FAkkh4d4aQtIJck7g1rH7T6IAQxb7/fw+t/UgWDLULE8p80tOzf/QL
         nqZgWYDkJSrFZS4Q08d96Br4TJmIg3xi6HeuazjSD5K7g/NYlK626UE1X8NyF326HTyb
         qTSolPWPXrGexUR0pupc0I9yObjTg5bpRzqQ1/3YV9P7pAMQvu7uDAEdBSm6VALAyfZS
         crkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367204; x=1760972004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Intn0C5yI8uAf2z3e0yNoFGVnV8Ruh2Zw9BITbwKtgg=;
        b=tx8jekd8okH6SNVdf3to7GTIxQrptf3tmXv7jC/1mnSyNH0E6FoxIV2H+UByDRnst1
         XWp1kAbvdOx/7k35mLkRe99fiLo2jbtkFOwXvTjbPpwJJH5x4rhpe4KV86NXy9uHOb7s
         zv+/B5zgzfMNNo2BJNBIkzO59S5W0EQa9VSvaI8pKmskrIi6mi/peMJBibDC64oSJ3zo
         St3yjkHiwAmRcXyswwo3IcghsyIueyy2L/u7L3STYcdlgia0CfImNO2XrQfnCQDqz70Z
         4Mpk1LKoG0t7l3XBFPzxcFoT2yZ2j4T8Wi5lDKto7kR27RPebS2cKB/EjcpcD9gTfUkH
         jGXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb2fuWq/gMjiUBtxuZqdekBGODXDhkk1O7lIqq23d/0xBxdSiHazMF+CF/CmR+F+4qc1+B2Xxe6co=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJXv7C9IR+u4Muup6ww1GycCG9MmMzNKbO6Fu5rX4VRB5raYNS
	CCNcTb+zV4ih/JmVtYB0wKBrtvBnbJwO3yMSXDkiGuycZwQb7GqmRHJU
X-Gm-Gg: ASbGnctqLanOsRZRN8aCmbmSl/Ek6t5OkyWUupU9Ns6QW3ImKSpzGubX4Lo6ODgITTD
	989dnagtfELpAOsBjIhuHS4a0K5UGSj4pTiKxpW1wt54eLNpfdC2yANHMZmo2ejjYQwGg+4i6Bn
	t/tS7bB9rleLMMkYeZYdo3kZFH1sQJO0951aQC5vGLdGAxzIi5CGQnEC+2hbm3EDbao7XXiSP3Z
	p7i2k2l7OoyIwDTeAXgfefH9T08wU5YppZ85s84nEpP0tWPQ3Vk36jsC+8Ai0gaoUyfHf7ZgQbh
	AdUdn9/e0GBvx5O/PrXfd2oY/DCs/4yGoM4X3hee+74sJb4Uv+38dF1seip5I8eIm7TogCcb8a5
	9TH6kaakie1EDA+DVaj4CCZ21slE25U9F28l0dx7XcvvitQ==
X-Google-Smtp-Source: AGHT+IGM5o9+wFkfIja0oLP61fEHz91/0NGcuhmPQVULbrd0ZLVSDTzb9zJ9+EqpQiODyKQcWi27WA==
X-Received: by 2002:a05:6000:1863:b0:3f6:9c5a:e1ff with SMTP id ffacd0b85a97d-4266e7dfda8mr14321226f8f.39.1760367204244;
        Mon, 13 Oct 2025 07:53:24 -0700 (PDT)
Received: from 127.com ([2620:10d:c092:600::1:eb09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0e70sm18641085f8f.40.2025.10.13.07.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:53:23 -0700 (PDT)
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
Subject: [PATCH net-next v4 02/24] docs: ethtool: document that rx_buf_len must control payload lengths
Date: Mon, 13 Oct 2025 15:54:04 +0100
Message-ID: <e685eeccc2a46d8ebfde77209e505a77d14f7e8a.1760364551.git.asml.silence@gmail.com>
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

From: Jakub Kicinski <kuba@kernel.org>

Document the semantics of the rx_buf_len ethtool ring param.
Clarify its meaning in case of HDS, where driver may have
two separate buffer pools.

The various zero-copy TCP Rx schemes suffer from memory management
overhead. Specifically applications aren't too impressed with the
number of 4kB buffers they have to juggle. Zero-copy TCP makes most
sense with larger memory transfers so using 16kB or 32kB buffers
(with the help of HW-GRO) feels more natural.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 Documentation/networking/ethtool-netlink.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index b270886c5f5d..392a359a9cab 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -966,7 +966,6 @@ Kernel checks that requested ring sizes do not exceed limits reported by
 driver. Driver may impose additional constraints and may not support all
 attributes.
 
-
 ``ETHTOOL_A_RINGS_CQE_SIZE`` specifies the completion queue event size.
 Completion queue events (CQE) are the events posted by NIC to indicate the
 completion status of a packet when the packet is sent (like send success or
@@ -980,6 +979,11 @@ completion queue size can be adjusted in the driver if CQE size is modified.
 header / data split feature. If a received packet size is larger than this
 threshold value, header and data will be split.
 
+``ETHTOOL_A_RINGS_RX_BUF_LEN`` controls the size of the buffers driver
+uses to receive packets. If the device uses different buffer pools for
+headers and payload (due to HDS, HW-GRO etc.) this setting must
+control the size of the payload buffers.
+
 CHANNELS_GET
 ============
 
-- 
2.49.0

