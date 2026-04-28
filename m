Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D4F3988E5
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 22:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777416140; cv=none; b=S4gevJUCvOZTCkfN7HVLU8Cqx8K41TXVEV1DeSx2B0/fRBsSVLFc2dGhALfBeQ0xhFdiWzZ/j7LuWGScNjffJ78LRwBGXks8oCGGq/9EWIA+G4rM6zk2gjH+C+1itNgcmQuPXOU9faeAtxcHEOhkRkgpIdjeSwpg2AIHX/WG6YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777416140; c=relaxed/simple;
	bh=w8Q7fwzhxuNDsmhOs8CU1x0IUrDfpFLHCoe3mI0Gkkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cc49USMYV6vuhh28EM0EzrFNmrljsYgGle2FToFlLrB48Py0f9mNJ9MoT5o5Qg2CFkzJKpObOOxTb8ejhCQxUEjOttjCik5fNONWutlRzIYtyl4uFkXEiW2eyGcmw9C5mIfeaouXaVJD6F7LJeQsdmC2LBdLE914zoMyam7RcLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbVIyxpM; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbVIyxpM"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7a469383e0bso97447877b3.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 15:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777416138; x=1778020938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yf9C9Vs78X6Tori5C+6AMAUG6Jc3jDAPqdDnnefTEsY=;
        b=ZbVIyxpMWHXCvIrzJgV9mWyOvTaIOnoNxuTsNhnHC1iCMZzlOc7dDg7p817Hl4FHQM
         xFjWwCuJg7TPW6uQrJ8S6INB3wj7NwfhuCwyuVaXu5tJ4x8Gt0iSiiepFaSOY9pqS1HJ
         clIsEXhAZa7t5C6o7WWyaMppBRkUYtE9JaSGxz67lMgvXOOpqPmzfQkKrgcEcCHqckVx
         oPwNbFsY5GAkerbDc7GwNF3cT8PbV3TC+bEFEa1Dp7y7PldcbLlAk5w0SEFTdfKCrHNP
         xwqHwR8t07skJuRzFtJrlVTeiLLGgnBsizsHNM0/d5pPhVgD8qr80f7VPRoKuhjybJ6D
         SI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777416138; x=1778020938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yf9C9Vs78X6Tori5C+6AMAUG6Jc3jDAPqdDnnefTEsY=;
        b=HUYiJHVZmwVE857K7D6iTPVHSTjUdK3dAa1//zt5FuqraXaMMSQZT+Uyul4b3qKboB
         XAHHMHkBPUCOgvxryMCPEqQNIQsdmaG3R1G/npwebEbMGQYLtKM1LIcCQ5axrA+Se4kd
         GAP7XIudU59gwwHLeKea+P/s5vozYe66YZmJIuFxQVUXCUKnaJhlFTH9pCUx4JMjzU4D
         tZOoL/mOxXUfns4QVeuQ5/73DCRC+ZBZeuiUGo6euEcparivaOXpf/rexdLzlRhRtef/
         EvwSSriePW6BLWt/il8QbV5pGj4gYmsTbFLvUkcA6QaAcYdJfWY7W+Mr0tlohtEcR5ZA
         myiA==
X-Forwarded-Encrypted: i=1; AFNElJ+ly2TFEmR1cCk0zGH3bgZPGzLYbYeANM3JcDsjyx1MDXuHB2sjebxOdUWluBc3aUTUGZN4tX+EXwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyirwf9xdBcpOWSoQ5zZ29fL6hjmv87xRzWi9XXEm7kznjz83dy
	U8AvgCwtsKM5rdErSB9tV3+XeOWcpXYxV/Qvg1IMPsB9UqospZ4rqs7x
X-Gm-Gg: AeBDiev+IYBpA64bUZZcIDUiVzVNKRHedW5/0nu3W0haPLrV7u6oVjbOyfY9KmzYMsw
	+0eSXZpPj29WNBLjwnik6VnCX2ryspD6zmcRweFgRWXh7aVtfw61d/RUs5HFCVzPPhJmTg4NNoL
	qkWCtH+seKL82iWzjh7ehdnRHklTcfgR06Apvt6V0dhMYm3gpTuz135+op1DuaeDcXFuxi2P3iI
	Mab0TuvscZWuvo3p6h2Wvdn5pzwV6MAgCgQP0LHat//mtPQaEKFnDwhM5mRfON6fRWUyZCGGKRu
	SPBwB1fMiU/CxrZB85eh+qHBkaviQtzYsOWVJKmc9ittIgG2svK9YBVh/AxPFNmpcehXCwGWtH8
	Yr3ry1k7aJkQTJTWhRvMKK3NBUSJViHNNmCPVYqpDSKSaedt5q1ExAUqweubL64ArENqsbgBGl/
	mZqbUlYOqCzuBDOcOmGJrY8uAPR7bvPYw=
X-Received: by 2002:a05:690c:6:b0:7b8:338d:7d78 with SMTP id 00721157ae682-7bcf579a631mr48995027b3.41.1777416137774;
        Tue, 28 Apr 2026 15:42:17 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd24b8a86dsm5096607b3.0.2026.04.28.15.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 15:42:17 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 28 Apr 2026 15:42:02 -0700
Subject: [PATCH net-next 05/11] eth: fbnic: convert netmem_tx from bool to
 NETMEM_TX_DMA enum
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-tcp-dm-netkit-v1-5-719280eba4d2@meta.com>
References: <20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com>
In-Reply-To: <20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Now that netmem_tx is a multi-mode enum (NETMEM_TX_NONE, NETMEM_TX_DMA,
NETMEM_TX_NO_DMA), set it to NETMEM_TX_DMA to indicate this driver
supports DMA-capable netmem TX.

No functional change.

Assisted-by: Claude Code:claude-sonnet-4-6
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_netdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
index c406a3b56b37..138e522ef9b9 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
@@ -752,7 +752,7 @@ struct net_device *fbnic_netdev_alloc(struct fbnic_dev *fbd)
 	netdev->netdev_ops = &fbnic_netdev_ops;
 	netdev->stat_ops = &fbnic_stat_ops;
 	netdev->queue_mgmt_ops = &fbnic_queue_mgmt_ops;
-	netdev->netmem_tx = true;
+	netdev->netmem_tx = NETMEM_TX_DMA;
 
 	fbnic_set_ethtool_ops(netdev);
 

-- 
2.52.0

