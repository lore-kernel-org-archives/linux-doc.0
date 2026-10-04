Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8E2471422
	for <linux-doc@vger.kernel.org>; Sun,  4 Oct 2026 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134208; cv=none; b=tfrRUxBhLVpYINs+N4dcNCTGc/AxuAYnzDuY/PbmqVI1P/SRxFzFR6bQeAvLUht7JIBjUoaDFovDYv8z6uee4DN+t6nglsRbckeNd8+ElvfSIw9ed241koCzCQMvLAhHT3ADwvnZfGbo6Pk4LtHNlfiIE9wGIQu17Cnx9vv4rcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134208; c=relaxed/simple;
	bh=bmE6DJq5mQYt8ACvF1ZIyWP9iLVRBzWtezcMwXt3IsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q8Z0xkCKiRLGbw4S7tyd8+UzjUiJfh16figPXYxwvk0PPn8Y/P0hIu8Al6za9PyoCSR7JL4LYXo3+vf1eSp8sTJyN5k76MRu7wXb0h9gtJjyqNZOqO2KU5UK37HUpTICy4hNYLMB+0EKN3JTHSg1rMXAUV9N2IBx4URC2VGlb8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=zxAXwcy0; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="zxAXwcy0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so1277775a12.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Oct 2026 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134199; x=1791738999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlaQzqtT4L/X0UVb7t9+uS9vqwfYnLXqmrlooszQDxo=;
        b=zxAXwcy08QW2QkJf7VIp31UHdQhVL68lgB0JEDGWR8QA7h8+7jE3REcLYMDKnYl6Q+
         RAutXssSpHHCf9kvoNGCMCvnGfeX4WsvnrLV/anvM1CSC5Qc9CVP+2208Also9XwOdr1
         tHFWcKmmNenZE+Owe3aFaSC6WFqdlZDRo3E5gCH3kxbsu5bEJ7qsrLCPML6IvXUvNi41
         mZMpcX595P5a2+Fg0bv6qEiNhmXK4TxfqlYdg4lI4epAgMOZ6Y80KzuNAVUFvLkrlbbz
         nIzZmJQQFaokpafRbamYcVTwNJA/CFHVjQTyl6HA9zLYAL2VVQnWXHMvlHDy0NDXDiz1
         +KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134199; x=1791738999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlaQzqtT4L/X0UVb7t9+uS9vqwfYnLXqmrlooszQDxo=;
        b=TgE6dNqPEEAb5IgJ7kQ107eRKIPrQVd6VuGa04bav85RSy9IVzF3JLxTLgEUYkHyjE
         WQ4KuxXKN6/NUX8SPG9w/9RoInioQMxsi+P2iNluFYafPzmTEkUWS9VDIWr9UbSkR/md
         bWgDqER3Mp4mUG0ftKz2GsKSuK0dLMeCi7dBK/N5oCmli3+Yy2vDUT3ofPGEPE8ZFaqX
         /+dVbEubvlCsXkObF32yoXB3UbjL8lhLlbMJhcPBXNmkm1ojemCltJNdAoDms2RCQc++
         XBfoEiMYuerEPjYPEmHDNXZbxnTh1rkkNYwKZH1c0Tu30SitA4LX6neQHOBb0qOqb82z
         bWgA==
X-Forwarded-Encrypted: i=1; AKwUvBwEc4tzl9ylmT8xsy5c8/qHliqft+uyuLo02iKPTrdSpwziUxsJa01kbCSBhuCBPFPO6frHU+1lkOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO1F1K4kR2GU26lDKe9zAVSUYHYqC7aYbXw17gUYhNyKiSDxqJ
	2283hdYCKeQiXHqTjBd5EhfLrB6kZU0/7SH/v529q/44ia8M/CUjy/wTvJpIowEUhA==
X-Gm-Gg: AYBFou3g9PqP0l+gUsN3IVaICQxR48BJm3tHM9hbLzk9yxkVeoKNrGoGen2G0pcsB0G
	eap2geerLdTBPDdlXilK5KDj0j80SWY3SZQW5Ve9Btf4YtnFxNDTdi2pveL6o9B7eXplnvoaGV3
	QslXteupOK5wV51WnfohYBJa70dYf8oTc17FX0LzjHtqMqQzqflpFMuiCmAB/Co103BJNoMZ/9N
	8y0k23oyf9U6Yt+BysXGLnv+Va1WD42dvtjEmvt4JCNq+Yq/WkN/KHp/CN1FVsKIZ7DcPvN8lNr
	oIG7E75BP8wqud7Lm0NOZhSwir71psFv9K3XDAtRFuPHO8BkfKET1q/GfFqOX4Ar+3DsgfIvBPL
	UJog4miDszDgt0kOp1B85TRrJU0IgDEqeELnL0NyC70VdQfX6VVWCAjHJHhi9XDR/5H9QJ/bIDq
	JvJmaALuh6wNtYeT9WVZCgPwnw4Y0Qb1jvxWZnTddjHSWxwfaxtGEsE04vtndt1fCeb8+mMfGtk
	wSqNiWxXG22aKrDlm4yjEDFYH03XCaCKypFhUPxWYF29tum7I2pRWoJNdCz4tVvv9fRaePIBENs
	uGf4+5EqKUeuw9FZm9wOle9pf07gnDRQFDkB9SwHoPwnIrJTWs7+t7IaHfQgB46bwlLU6RWDi/k
	9VXzdMWzVtoO+i3GGzt1928MGFA2CMsplKtALcAprFt4egwzLbAGlzW7Cts5/yxJ7vI/9YMxXdD
	p73m/I3KnghtP5SWrjm8qfjKc=
X-Received: by 2002:a05:6402:2709:b0:6af:a64f:bd44 with SMTP id 4fb4d7f45d1cf-6afada35853mr4633290a12.45.1791134198617;
        Sun, 04 Oct 2026 10:16:38 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb014784bsm2256819a12.3.2026.10.04.10.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:37 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v3 0/3] netfilter: flowtable: carry a priority into the offload
Date: Sun,  4 Oct 2026 19:16:33 +0200
Message-ID: <20261004171636.3545085-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Packets forwarded by the flowtable skip the ruleset, so a priority set
with "meta priority set" before "flow add" is lost after the first
packets. Patch 2 stores skb->priority in the flow, applies it in the
software fast path and passes it to drivers as FLOW_ACTION_PRIORITY.
Patch 1 makes mlx5 ignore that action on flowtable flows, so flows it
offloads today stay offloaded. Patch 3 adds a selftest.

v2 review asked whether this should be a flowtable attribute instead.
A per-flow priority covers both one class per flowtable and a class
chosen per connection, with existing syntax:

  meta priority set 1:3 flow add @ft
  udp dport 5060 meta priority set 1:3 flow add @ft

An attribute needs one flowtable per class. nft rejects a device in
two flowtables of the same table with -EEXIST, so it also needs one
table per class. Pablo, is the per-flow approach fine with you?

mlx5 maintainers: patch 1 is needed before patch 2 and is meant to go
through nf-next; an Acked-by would allow that.

The selftest passes with the series, and its priority checks fail with
only patch 3 applied (QEMU, three runs). The mlx5, airoha and mtk
changes are compile-tested only; Lorenzo, a Tested-by on airoha would
be welcome. struct flow_offload grows by 8 bytes.

Changes in v3:
- new patch 1 for mlx5
- airoha uses the priority for its QoS queue (Lorenzo Bianconi)
- describe the tc flower effect and the TOS-derived priority
- rebased onto nf-next

v2: https://lore.kernel.org/netfilter-devel/20260902155136.4963-1-julius@bairaktaris.de/
v1: https://lore.kernel.org/netfilter-devel/20260901092632.369248-1-julius@bairaktaris.de/

Julius Bairaktaris (3):
  net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
  netfilter: flowtable: carry a priority into the offload
  selftests: netfilter: nft_flowtable.sh: check the priority a flow
    carries

 Documentation/networking/nf_flowtable.rst     |   4 +-
 drivers/net/ethernet/airoha/airoha_ppe.c      |   3 +
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |   1 +
 .../net/ethernet/mellanox/mlx5/core/Makefile  |   2 +-
 .../mellanox/mlx5/core/en/tc/act/act.c        |   1 +
 .../mellanox/mlx5/core/en/tc/act/act.h        |   1 +
 .../mellanox/mlx5/core/en/tc/act/prio.c       |  22 ++++
 include/net/netfilter/nf_flow_table.h         |   1 +
 net/netfilter/nf_flow_table_ip.c              |   6 +
 net/netfilter/nf_flow_table_offload.c         |  11 ++
 net/netfilter/nft_flow_offload.c              |   2 +
 .../selftests/net/netfilter/nft_flowtable.sh  | 110 ++++++++++++++++++
 12 files changed, 162 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c


base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
-- 
2.53.0

