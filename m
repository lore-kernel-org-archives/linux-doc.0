Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C383FE35A;
	Tue, 11 Aug 2026 07:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432380; cv=none; b=uu9Xs30ZWYlePpB2t333m/Bs1MwbzKAbIWTPojTQHE7OwH1ZfybxZy1U+0yu0Ru282PJ45x4m+DtDn5yROrX046XCd7Ip9ecYzpUVWwZnkJgNE4s4lTl4s+WuFO3CGQXNzTAJ0j0CStyjVdussv1dweQafPXE6molEI26UMn6B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432380; c=relaxed/simple;
	bh=+0WN17aPVNqy2vCGAKls+iAuFzgT9aH/00wQmepVC6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UkKjA+7Vj+Cml4ylxoypKjOIqBc9/o6jj6fJ22v8at5ebiStOSLSh34C6Uh2sAxaaC4OuGsi+zcYpG7xWKTfZFr7+wtgMjrlHO52CytTbF9VY5ArOb8NhQkwmMaSOknBGOF+I1nsrgxP7NBqFYOastH2HS6W0KpCtMO25gOgRrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn; spf=none smtp.mailfrom=stu.cdut.edu.cn; dkim=fail (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b=LtXrropJ reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.cdut.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.cdut.edu.cn header.i=@stu.cdut.edu.cn header.b="LtXrropJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.cdut.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=DLjdXovSvMrotbGz3BkkBSBQynvkGhG2RK
	nOWjjL4vI=; b=LtXrropJWLIdpgCFr3WTg8Ze6g1iWyhNlrtypyOcjg5uOKQJqh
	xrQzP4AkZgk1WU/RQOIORueDw2O9sD+0UK8xNnFS5/WWes5Aor3JLGQ+nZ1pmhd+
	ijtwl0bTBdDKCcmRY2a/XqbgQ1NmR7SKf0hfMhyOTdkHVgJSt0MNMF34E=
Received: from anka-20eya00ycd (unknown [182.139.166.32])
	by hzbj-edu-front-2.icoremail.net (Coremail) with SMTP id BLQMCkBmLxdcy3pqOiwhAA--.43334S5;
	Tue, 11 Aug 2026 15:12:42 +0800 (CST)
From: Siwei Chen <anka@stu.cdut.edu.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wy@wyuan.org,
	Siwei Chen <businiaoanka@anka1.top>
Subject: [PATCH v3 3/5] docs/zh_CN: Add Softnet Driver Issues Chinese translation
Date: Tue, 11 Aug 2026 15:11:56 +0800
Message-ID: <20260811071200.54062-4-anka@stu.cdut.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811071200.54062-1-anka@stu.cdut.edu.cn>
References: <20260811071200.54062-1-anka@stu.cdut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BLQMCkBmLxdcy3pqOiwhAA--.43334S5
X-Coremail-Antispam: 1UD129KBjvJXoWxKw1xZry3Ar4DKr1xWryrCrg_yoW7Zw1kpF
	9xWryfGF4kGFy2vrZ7Gry7GryUGw4xCw47GFyxJ34Fqr1DAFWrKw13Kry8KryfGryvkFWY
	yF1IqFW8Cr10yrDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4
	AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Vu
	WPUUUUU==
X-CM-SenderInfo: ysqsjiqyqsiiiqr623vxofv3vwohv3gofq/1tbiAQUCCWp6E65qSwAAsD

From: Siwei Chen <businiaoanka@anka1.top>

Translate .../networking/driver.rst into Chinese.

Update the translation through commit 96fbe161e402
("docs: networking: add guidance on what to push via extack")

Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
---
 .../translations/zh_CN/networking/driver.rst  | 138 ++++++++++++++++++
 .../translations/zh_CN/networking/index.rst   |   2 +-
 2 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/networking/driver.rst

diff --git a/Documentation/translations/zh_CN/networking/driver.rst b/Documentation/translations/zh_CN/networking/driver.rst
new file mode 100644
index 000000000000..acb0863c6b0d
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/driver.rst
@@ -0,0 +1,138 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/networking/driver.rst
+
+:翻译:
+
+	陈思为 Siwei Chen <businiaoanka@anka1.top>
+
+================
+Softnet 驱动问题
+================
+
+探测指南
+========
+
+地址校验
+--------
+
+为设备获取的任何硬件层地址都应进行校验。例如，以太网地址应使用
+linux/etherdevice.h 中的 is_valid_ether_addr() 进行检查。
+
+关闭/停止指南
+=============
+
+静默
+----
+
+ndo_stop 例程被调用后，硬件不得再收发任何数据。所有在途报文都必须中止。
+如有必要，应轮询或等待任何复位命令完成。
+
+自动关闭
+--------
+
+若设备仍处于 UP 状态，ndo_stop 例程将由 unregister_netdevice 调用。
+
+发送路径指南
+============
+
+提前停止队列
+------------
+
+ndo_start_xmit 方法在任何正常情况下都不得返回 NETDEV_TX_BUSY。
+除非设备确实无法预先判断其发送功能何时会繁忙，否则返回该值被视为严重错误。
+
+相反，驱动必须正确地维护队列。例如，对于实现分散-聚集
+（scatter-gather）的驱动，这意味着：
+
+.. code-block:: c
+
+	static u32 drv_tx_avail(struct drv_ring *dr)
+	{
+		u32 used = READ_ONCE(dr->prod) - READ_ONCE(dr->cons);
+
+		return dr->tx_ring_size - (used & dr->tx_ring_mask);
+	}
+
+	static netdev_tx_t drv_hard_start_xmit(struct sk_buff *skb,
+					       struct net_device *dev)
+	{
+		struct drv *dp = netdev_priv(dev);
+		struct netdev_queue *txq;
+		struct drv_ring *dr;
+		int idx;
+
+		idx = skb_get_queue_mapping(skb);
+		dr = dp->tx_rings[idx];
+		txq = netdev_get_tx_queue(dev, idx);
+
+		//...
+		/* 这应当是极为罕见的竞争——记录下来。 */
+		if (drv_tx_avail(dr) <= skb_shinfo(skb)->nr_frags + 1) {
+			netif_tx_stop_queue(txq);
+			netdev_warn(dev, "Tx Ring full when queue awake!\n");
+			return NETDEV_TX_BUSY;
+		}
+
+		//... 将报文排队到网卡 ...
+
+		netdev_tx_sent_queue(txq, skb->len);
+
+		//... 使用 WRITE_ONCE() 更新 tx 生产者索引 ...
+
+		if (!netif_txq_maybe_stop(txq, drv_tx_avail(dr),
+					  MAX_SKB_FRAGS + 1, 2 * MAX_SKB_FRAGS))
+			dr->stats.stopped++;
+
+		//...
+		return NETDEV_TX_OK;
+	}
+
+然后在 TX 回收事件处理的末尾：
+
+.. code-block:: c
+
+	//... 使用 WRITE_ONCE() 更新 tx 消费者索引 ...
+
+	netif_txq_completed_wake(txq, cmpl_pkts, cmpl_bytes,
+				 drv_tx_avail(dr), 2 * MAX_SKB_FRAGS);
+
+无锁队列停止/唤醒辅助宏
+~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/net/netdev_queues.h
+   :doc: Lockless queue stopping / waking helpers.
+
+netif_txq_maybe_stop()、netif_txq_try_stop() 等标准宏已经过充分测试，
+请优先使用它们，而非本地同步方案。
+
+无独占所有权
+------------
+
+ndo_start_xmit 方法不得修改被克隆 SKB 的共享部分。
+
+及时完成
+--------
+
+请谨记：一旦 ndo_start_xmit 方法返回 NETDEV_TX_OK，
+驱动就有责任在有限的时间内释放该 SKB。
+
+例如，这意味着不允许你的 TX 缓解方案在没有新 TX 报文发送时，
+让 TX 报文永远“滞留”在 TX 环中而不被回收。
+这种错误会使等待发送缓冲区空间释放的套接字发生死锁。
+
+若 ndo_start_xmit 方法返回 NETDEV_TX_BUSY，
+则不得保留对该 SKB 的任何引用，也不得尝试释放它。
+
+错误消息报告
+============
+
+许多驱动配置接口会向驱动传递一个 Netlink 扩展 ACK（``extack``）对象
+（直接作为参数，或作为参数结构体的成员）。驱动应尽量通过 ``extack`` 对象
+报告大多数错误。表示系统或设备行为异常、处于不良状态的系统级异常，则应继续
+报告到系统日志。
+
+消息应 **要么** 通过 ``extack`` 传递， **要么** 写入系统日志。驱动不应
+试图将同一信息同时报告到两处。
diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index ae374c4cb144..4675d23a7f28 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -21,6 +21,7 @@
    :maxdepth: 1
 
    msg_zerocopy
+   driver
    napi
    vxlan
    netif-msg
@@ -76,7 +77,6 @@ Todolist:
 *   dctcp
 *   devmem
 *   dns_resolver
-*   driver
 *   eql
 *   fib_trie
 *   filter
-- 
2.53.0

