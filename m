Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795588049;
	b=FlVOMDHbVZv5KXYAo9GDY9+dBPMgl63uuo5PfSlyMgEhpz0XhrplaKX2INOKogrX6wjW
	 E4gMko22DfQW1X755q0APbDgaeYqSGcYUo4EnS7i1TrSnSKMVw2fqPe5XzfKarO9Gu1SO
	 8JXb+I6ZYo1HHm/KO/+7eGxisuO70+3IrqY/DipdsCj8fZCmPB6VcPvko7G9Aa6uHXOtX
	 FhP4ebe/8/9BPzjyjsJse9ZkuB1dFOyRgHmnyUxz2K0XWGOIGP/1ljT2KZzqvs9Fr5Bxc
	 lge3nMmVVUKGx/NC6MTE0xQJ83dhXQult3yY4Hezh6Wu1AhGppp3uv78Mx3osHunKVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588049;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Wq/CsLeOaCNni5DP6DJOa3Z+MAQ6SwcdPNThAhwhRHc=;
	b=CMwR7Y96XBfycLMR11LDfISWIk6PrXPby+AhFJ50s/seqzAjcSfG43ljL5qczKCfIz33
	 8Vpum/eOrprolbbqeJuW8Y5Z1jy3I/e+/qUS2B9DWVHfIrX/JlCOpbi0hB1u96vGAXHwW
	 JOwYkZwyDq5Z0EJZteOVlmP6juRhg8IuNyOdw0ppE0WGKSdxoI/hDogIgwpbc27RBtaGR
	 qNfVOel0I0Tg3C29At8feFNdjdqllh3WBDnmN9063MKSx7kKcUMh/6NOUS2kxMq2BG+To
	 WYDrdAemGnDSf1kBELYhPBR7ZNAt3V+LOgwEWJ5vf9WBJSm2lJi0zYn6X29Vqj773Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDrNdTRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89372606A699;
	Wed, 25 Nov 2026 06:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDrNdTRK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795588049;
	b=gnwLB2HTEip39pDh1BrIjR9m7VOpsBuUJIEIb9SY/D8my7E3ZADhLEJr8ON5JEJ1lm0A
	 Ee5lIQVs1MfgQTsZsue+hTffPm2XrDyyjWVpoKjrINQFVslmFZBrwuZh74hvh1oynI+e1
	 TZXkPzoLN1Yskrm/p7U7/OUTfVAzznCVttEtks6wHe7FbZaTbJoUdO3YyK7k0Jml8p6nq
	 thIKaioXLSVy1iJ49P/PunImn+5h/TwlGjcMX6yTUtiIj7Ae+8Nxk+jvc7z5nmgD8L8bj
	 txyWM4U/gJkRPyWzqnXJLp09RCMIamVNBy2vrpSdwPmcbzRX10SaebPB/tnBHJSY2Aw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795588049;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Wq/CsLeOaCNni5DP6DJOa3Z+MAQ6SwcdPNThAhwhRHc=;
	b=iN9dmAqnjFXNWsjUveQF1l0WkDUrEq3wS479P5RjJ9SZiKO1mjf3DlWBzdmJMIRVnZti
	 C2LgVNCPpEWie6IRnRDz4POjuplDZNrtJ2vHJtYfrE1bjizYO7uoVVh6PanbVOHfvo0Dd
	 ZCqsaFHxm5rVMFERJaUwcNrv9xlxvkAb+j/3hrxR/8RJ6KLqeSocjRvVUykz57nkFQF7v
	 dD45kVla7WlKZPdxfNi4eI8n5WjT86V5iJe0hFeJqWD1ZjmKbt4DnsKL8p8Oom0RfxtkH
	 tTwX9pVHG1Myi1QswDqbHTyu0T+cFQtB3oYK/enODEBIau4HIfiQ4c2aPjnIfr73IaQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9B5D1F000D2;
	Wed, 25 Nov 2026 06:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795588049;
	bh=Wq/CsLeOaCNni5DP6DJOa3Z+MAQ6SwcdPNThAhwhRHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GDrNdTRKmXOXxR6fp3Q9PBz9JCJzmo2g2XGOFpI4+FQSDh0zyCFCwD6sXNoDJhbpS
	 LdVG4YX2SMtblWHwco9ykqit9fQIKlKp18FJR2YM7OjTB8/pMp9HGUcgo4+AWRaBO+
	 aeZ3poKxsXpjN6J5LryWfXrCkf9R1xagHhAXxK+j6IZWk8tLPON/9UD/sCW+ZI/IlA
	 T+05hUtjSZyg5GLUPjyFVlrnqs+JFJpeEp2m1wm29j8yiBmeXDJb1/5I8FNMe5B47R
	 tOpFzmzXh3unTEkontv+GsLlIsR6d1jjyOjgEhreHcCTwZxj2IQPjCHZx0tjh1hnKS
	 GuwU0oimt+GZg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5951A4CD58;
	Wed, 25 Nov 2026 06:27:20 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Wed, 25 Nov 2026 14:27:15 +0800
Subject: [PATCH net-next v13 2/6] net: wwan: t9xx: Add control plane
 transaction layer framework
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-t9xx_driver_v1-v13-2-92d9be5fb51e@compal.com>
References: <20261125-t9xx_driver_v1-v13-0-92d9be5fb51e@compal.com>
In-Reply-To: <20261125-t9xx_driver_v1-v13-0-92d9be5fb51e@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Jack Wu <jackbb_wu@compal.com>, 
 Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, 
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, 
 Minano Tseng <Minano.tseng@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Robert Yu <robert_yu@compal.com>, 
 Jeff Chang <Jeff_Chang@compal.com>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795588037; l=4358;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=zSDBqT4BY6TNZmOsjeeRLHg7Yj+X8Pi/vmZtc8ZE+0E=;
 b=DcAWWsz0XFyJu6JgGBTXZFTnyI1gkyWKf3vGJJxS9+XOIB5Tt7DAO18zLrZzbIJuEz2YssdVb
 iQOj+N69tzrDFOHdbFwauqsvB29vx5ODTLa6K00FWVodZMH1hnl5yBe
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
Reply-To: jackbb_wu@compal.com
Content-Transfer-Encoding: 7bit

From: Jack Wu <jackbb_wu@compal.com>

Introduce the control plane and transaction layer framework
for the T9XX WWAN driver. This patch adds the core data
structures (mtk_ctrl_blk, mtk_ctrl_trans) and initialization
entry points that subsequent patches build upon.

The control plane block (ctrl_blk) starts out with only the
device back-pointer and an opaque pointer to the transport
context; later patches add the port layer and FSM hooks to
it. The actual DMA engine and TX/RX service
implementations are added in subsequent patches, and
mtk_ctrl_init() and mtk_ctrl_exit() get their first callers
there, in pcie/mtk_trans_ctrl.c.

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 drivers/net/wwan/t9xx/Makefile              |  1 +
 drivers/net/wwan/t9xx/mtk_ctrl_plane.c      | 45 +++++++++++++++++++++++++++++
 drivers/net/wwan/t9xx/mtk_ctrl_plane.h      | 19 ++++++++++++
 drivers/net/wwan/t9xx/mtk_dev.h             |  3 ++
 drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h | 15 ++++++++++
 5 files changed, 83 insertions(+)

diff --git a/drivers/net/wwan/t9xx/Makefile b/drivers/net/wwan/t9xx/Makefile
index 0eb5fb1be0e2..65b3c1f70c36 100644
--- a/drivers/net/wwan/t9xx/Makefile
+++ b/drivers/net/wwan/t9xx/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_MTK_T9XX) += mtk_t9xx.o
 
 mtk_t9xx-y := \
+	mtk_ctrl_plane.o \
 	pcie/mtk_pci.o
diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.c b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
new file mode 100644
index 000000000000..b755b6f03a72
--- /dev/null
+++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#include <linux/device.h>
+
+#include "mtk_ctrl_plane.h"
+
+/**
+ * mtk_ctrl_init() - Initialize the control plane block.
+ * @mdev: Pointer to the MTK modem device.
+ *
+ * Allocates and initializes the control plane block
+ * associated with @mdev.  Runs once per bind; the allocation is
+ * devres managed and is released at unbind, not by
+ * mtk_ctrl_exit().
+ *
+ * Return: 0 on success, -ENOMEM on allocation failure.
+ */
+int mtk_ctrl_init(struct mtk_md_dev *mdev)
+{
+	struct mtk_ctrl_blk *ctrl_blk;
+
+	ctrl_blk = devm_kzalloc_obj(mdev->dev, *ctrl_blk);
+	if (!ctrl_blk)
+		return -ENOMEM;
+
+	ctrl_blk->mdev = mdev;
+	mdev->ctrl_blk = ctrl_blk;
+
+	return 0;
+}
+
+/**
+ * mtk_ctrl_exit() - Clean up the control plane block.
+ * @mdev: Pointer to the MTK modem device.
+ *
+ * Clears the control plane block pointer. The allocation
+ * itself is managed by devres and freed on driver detach.
+ */
+void mtk_ctrl_exit(struct mtk_md_dev *mdev)
+{
+	mdev->ctrl_blk = NULL;
+}
diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.h b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
new file mode 100644
index 000000000000..16b60eeb0aaf
--- /dev/null
+++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#ifndef __MTK_CTRL_PLANE_H__
+#define __MTK_CTRL_PLANE_H__
+
+#include "mtk_dev.h"
+
+struct mtk_ctrl_blk {
+	struct mtk_md_dev *mdev;
+	void *ctrl_hw_priv;
+};
+
+int mtk_ctrl_init(struct mtk_md_dev *mdev);
+void mtk_ctrl_exit(struct mtk_md_dev *mdev);
+
+#endif /* __MTK_CTRL_PLANE_H__ */
diff --git a/drivers/net/wwan/t9xx/mtk_dev.h b/drivers/net/wwan/t9xx/mtk_dev.h
index d969a04d4413..fe2cd8c95719 100644
--- a/drivers/net/wwan/t9xx/mtk_dev.h
+++ b/drivers/net/wwan/t9xx/mtk_dev.h
@@ -26,11 +26,14 @@ enum mtk_dev_evt_d2h {
 	DEV_EVT_D2H_ASYNC_HS_NOTIFY_MD	= BIT(6),
 };
 
+struct mtk_ctrl_blk;
+
 /* mtk_md_dev defines the structure of MTK modem device */
 struct mtk_md_dev {
 	struct device *dev;
 	void *hw_priv;
 	u32 hw_ver;
+	struct mtk_ctrl_blk *ctrl_blk;
 };
 
 #endif /* __MTK_DEV_H__ */
diff --git a/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
new file mode 100644
index 000000000000..1827cb1d4959
--- /dev/null
+++ b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#ifndef __MTK_TRANS_CTRL_H__
+#define __MTK_TRANS_CTRL_H__
+
+#include "../mtk_dev.h"
+
+struct mtk_ctrl_trans {
+	struct mtk_md_dev *mdev;
+};
+
+#endif

-- 
2.34.1


