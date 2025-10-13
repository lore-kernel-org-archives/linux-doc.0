Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14FC312835
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367236; cv=none; b=K1V0Z/2St+RzfIbIBOh4e1Tk/L/sfZDhLrqOgUtf1FZ9nv8T3V8wUXbwh9NdSCCidyyqhxRbLfBObSVHeYKtmUBXWSAy45J1w1nVxTG2gSR1by5nrCQeASpCt4KQXqwpMSpJl2oVpaFG5ZNfG1bh+DQOZmQCJXR6dlNjvEZeozM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367236; c=relaxed/simple;
	bh=5njEvVGvRvg5n+or8A0T0TeMIvuwdSGOGUYTMwZoZrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6MXeUh0N8HJCYlQK2Ba3v0OLdTkwxTzhVulRVmZ6LWQ1tHE1njlek7UjXPjDZNUUym/Z+oi8ci0BD59T/gA1UoUFkl+ObP51RUVH9OshYy4hnSpcLU8Rl6H8VmnNEEa8hI0IEamsKF1eAlSNM85shByMsPmN+SCoodxztwX+JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYZdR/1B; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYZdR/1B"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e6674caa5so22199825e9.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760367232; x=1760972032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mx3rKwv8UpZmKoPpNp8c4OWFyXZ2MQ9zKc0xRf7JTbY=;
        b=bYZdR/1B6EnR21UtQM02QdZ/SlZlUnJJ4HgKFePQdxI8Eh4Vz5mxonv4tvx8GlyEfe
         QNFqDE0Hof7aL+0Jg3oW3H6WPiUMPKaN8cIc8NGDQBpMgAvthmHzN1euRS2nEHuxbeFz
         ueQfYEXZB+DIC4i7aXyx3HfYzKhQAyj8QCqpqhoHSVAeEet06Gm6WL/yARIQ7D2syVcm
         eYIzEEyZrR4F76VxwW1m3QECHx4dITHvTH/Ipc4uu4tzrxtm/vbGe+Z5rwD8hpVkaSKP
         XZYn9xO45FjKRQMDpCUtRS7PZjJVtGsSXz1bVqCy/mxVcAhFrxuhShn6pd50eloLt5bv
         eM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367232; x=1760972032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mx3rKwv8UpZmKoPpNp8c4OWFyXZ2MQ9zKc0xRf7JTbY=;
        b=XQX8qiIpd+9cQVfsllCuxrlQF33Azs7S09vL3xnNxYp6tYMVOo0e/+nurPoPk+Nw6Q
         +d6LNfnv2hwHrH+8ZT5CIIdWB4vWbbKPYChzj9K18UKo56LFOmt07iJG6MJ/LYO4MDxx
         kUqTlISYHDeeyZo8d5jI0Il+e2YK6+KYuddeHV18rv4xQYNw2S00HQwSNZB0SMTwfBPl
         aEmqNgdoOkOQDA6omghH87VqCEILo1Jk7HlpvJk8VLJOpUZfjZADstGHSR/jkd/yxpyf
         aRbvk94j2l3PQqc7xQFaVxjuHXeQUvPRcowBmAkZeUZQxOsqG1ljtVo9PtGZjNqE+nWi
         1xtw==
X-Forwarded-Encrypted: i=1; AJvYcCWQv7DSktWVwDiTtfa5/DExa5+nCuyMuZpCjmByz8NemaBiLUDnQOx2IQTaw2ZyvFjGu0+IrjXSJDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcWHZLt7XO4W86v+0kdnr1TH5IG98YEX9+VKc2qkzYEDih8nIO
	8GvrFF+4b/E4IPKRlXRKLvZuOdZIBh/p15PKqpTNYr7vRxPnFishfFdM
X-Gm-Gg: ASbGnctysLY3O5zDIUwWvS1kQRgH3cdQWwsQLUKl2a8q0LEO3mz1l7MrTVK3H4A1gZV
	tDTxUMwzbP6aV9MXSqtM1186lQ7LiEu5kMtwTN8yBM1zfoa3mSKuG2h/Z77JWG2MclNaVXUmk62
	MzXUaLBo7SmwCeSFwdd1UQKxt7Yse/wXV1YFMYd5L7MZ+b/kGDnyZmzv6CL+tlVRuKggIaF2Od6
	ibIcsPBK2OfNw+bNgxz3lNLnUH3OYsZVgSzSbXQCKqMe9fRBbU8HqezdPQzlKh8Si7YyPxpUJSj
	d840Fsq/unmm0wShr3mOThOGR/CBYIuQOofZEvY9JPeHC8/ZSEo/GFK24+3HJPz4MV2+5h0ACpK
	S4PBz7ROL/6X8WUetdO08wWXM5uMpJjDzZiM=
X-Google-Smtp-Source: AGHT+IE3H2i/VyBQ+RSV0mjlmorIJH69FGvZYgt2TChv0GqkPZvFJ5kiUJWgTBqn/GwNWnmRiH+YrQ==
X-Received: by 2002:a05:600c:2287:b0:45d:d86b:b386 with SMTP id 5b1f17b1804b1-46fa29f13dfmr128925175e9.14.1760367231769;
        Mon, 13 Oct 2025 07:53:51 -0700 (PDT)
Received: from 127.com ([2620:10d:c092:600::1:eb09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0e70sm18641085f8f.40.2025.10.13.07.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:53:50 -0700 (PDT)
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
Subject: [PATCH net-next v4 16/24] eth: bnxt: always set the queue mgmt ops
Date: Mon, 13 Oct 2025 15:54:18 +0100
Message-ID: <a91c4a947563f305f284d54a7bb127c10016275f.1760364551.git.asml.silence@gmail.com>
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

Core provides a centralized callback for validating per-queue settings
but the callback is part of the queue management ops. Having the ops
conditionally set complicates the parts of the driver which could
otherwise lean on the core to feed it the correct settings.

Always set the queue ops, but provide no restart-related callbacks if
queue ops are not supported by the device. This should maintain current
behavior, the check in netdev_rx_queue_restart() looks both at op struct
and individual ops.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
[pavel: reflow mgmt ops assignment]
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 61e5c866d946..bd06171cc86c 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -16187,6 +16187,9 @@ static const struct netdev_queue_mgmt_ops bnxt_queue_mgmt_ops = {
 	.ndo_queue_stop		= bnxt_queue_stop,
 };
 
+static const struct netdev_queue_mgmt_ops bnxt_queue_mgmt_ops_unsupp = {
+};
+
 static void bnxt_remove_one(struct pci_dev *pdev)
 {
 	struct net_device *dev = pci_get_drvdata(pdev);
@@ -16840,6 +16843,8 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	if (BNXT_SUPPORTS_NTUPLE_VNIC(bp))
 		bp->rss_cap |= BNXT_RSS_CAP_MULTI_RSS_CTX;
+
+	dev->queue_mgmt_ops = &bnxt_queue_mgmt_ops_unsupp;
 	if (BNXT_SUPPORTS_QUEUE_API(bp))
 		dev->queue_mgmt_ops = &bnxt_queue_mgmt_ops;
 	dev->request_ops_lock = true;
-- 
2.49.0

