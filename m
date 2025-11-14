Received: from mail-m1973172.qiye.163.com (mail-m1973172.qiye.163.com [220.197.31.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96101275AFB
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105852; cv=none; b=r9LbIaW6G/OlDRWnswVpa7wUjLqheuaMyU27QmX3fMpQkoicsMWrgRyyjR/m8AuAhDyP8h+qh3hNRaI2SWI7Zgvpn837io7yV/sHR8AyO7dn6Ml2UoVVCE/AO5XjXaE++7TqLlRxzziRbS8PYuE7SeuTpPSi+FEhr1M/UeJ4LA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105852; c=relaxed/simple;
	bh=+KrHWro8WCyzkALz4CBNHSmXNrLe37takWKf4dKZ734=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PR7vkoA17WY625Jk6ChL44bYx2Tt5nLyg04ObV5ymFTqHQd7syuoocJL19NbrGedIc4PYfw9iNxZLn+GJljEHHt1l01Au27D36dfB+8gSKK/xvwkTZlLVTyQO6ae1c/48DNksUbod/d23WfyVrlyXMEYbYEscZD3dk5TtvWqvDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=KcPZV+T9; arc=none smtp.client-ip=220.197.31.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="KcPZV+T9"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2994ff839;
	Fri, 14 Nov 2025 15:37:24 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH 2/3] docs/zh_CN: Add blk-mq.rst translation
Date: Fri, 14 Nov 2025 15:37:20 +0800
Message-Id: <f90d639dcb2a8064c6a5e85614c4da263b9942dc.1763105050.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1763105050.git.kezijie@leap-io-kernel.com>
References: <cover.1763105050.git.kezijie@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a814c2e6009d8kunme5a62dc31846441
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTE4eVhodTB1ITE0aGEhOGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=KcPZV+T9Y1tqEWF/LBfBnC7jTUZXYvMTpnOEg7xPuj9SgJ+sneCFwMHnP4+dpwDMoMy//SYqsEOGX8iImy/0km+qWMmP858c84biHi2opskE0IOr7Vn15/XHpEr6lnDnCE0/W3r9+y2XSShMNHc1LT4Uv9PWon+zNhXnJV0X/7W0NmylNVP8VT8bzpn6dFACXSeKh5Nydh0NKdEr6eOi3hTb9rZiRBMOIiv2TxWYne6jXNLUQ6fAN1C3Y8zRt/8hlV4CAbACU910Ve025vuUkmnoLz09lW/1ZhahfPaRkvdqPFjhldoqMpU7WQmy9LD8n2o3Q5UIiH0lvBa6uCmofw==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=4qBUBkeQlE3pOfusO+pd4uKuYL0/9QpwhDbhXR4D2y0=;
	h=date:mime-version:subject:message-id:from;

Translate .../block/blk-mq.rst into Chinese.
Add blk-mq into .../block/index.rst.

Update the translation through commit 41bd33df4e18
("docs: block: blk-mq.rst: correct places -> place")

Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
---
 .../translations/zh_CN/block/blk-mq.rst       | 128 ++++++++++++++++++
 .../translations/zh_CN/block/index.rst        |   3 +-
 2 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/block/blk-mq.rst

diff --git a/Documentation/translations/zh_CN/block/blk-mq.rst b/Documentation/translations/zh_CN/block/blk-mq.rst
new file mode 100644
index 000000000000..b6933e8e96ed
--- /dev/null
+++ b/Documentation/translations/zh_CN/block/blk-mq.rst
@@ -0,0 +1,128 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/block/blk-mq.rst
+
+:翻译:
+
+ 柯子杰 kezijie <kezijie@leap-io-kernel.com>
+
+:校译:
+
+
+
+================================================
+多队列块设备I/O排队机制 (blk-mq)
+================================================
+
+多队列块设备I/O排队机制是一组API，它使高速存储设备能够排队并同时向块设备
+提交I/O请求，从而达到极高的每秒输入/输出操作次数 (IOPS)，充分利用了现代存
+储设备提供的并行性
+
+介绍
+====
+
+背景
+----
+
+磁盘从Linux内核开发初期就已成为事实上的标准。块I/O子系统的目标是尽可能
+为此类设备提供最佳性能，因为它们在进行随机访问时代价极高，性能瓶颈主要在机械
+运动部件上，其速度远低于存储栈中其他任何层。其中一个软件优化例子是根据硬盘磁
+头当前的位置重新排序读/写请求。
+
+然而，随着固态硬盘和非易失性存储的发展，它们没有机械部件，也不存在随机访问代
+码，并能够进行高速并行访问，存储栈的瓶颈从存储设备转移到了操作系统。为了充分
+利用这些设备设计中的并行性，引入了多队列机制。
+
+原来的设计只有一个队列来存储块设备I/O请求，并且只使用一个锁。由于缓存中的
+脏数据和多处理器共享单锁的瓶颈，这种设计在SMP系统中扩展性不佳。当不同进程
+（或同一进程在不同CPU上）同时执行块设备I/O时，该单队列模型还会出现严重
+的拥塞问题。为了解决这些问题，blk-mq API引入了多个队列，每个队列在本地CPU
+上拥有独立的入口点，从而消除了对全局锁的需求。关于其具体工作机制的更深入说明，
+请参见下一节（ `工作原理`_ ）。
+
+工作原理
+--------
+
+当用户空间执行对块设备的I/O（例如读写文件）时，blk-mq便会介入：它将存储和
+管理发送到块设备的I/O请求，充当用户空间（文件系统，如果存在的话）与块设备驱
+动之间的中间层。
+
+blk-mq由两组队列组成：软件暂存队列和硬件派发队列。当请求到达块层时，它会尝
+试最短路径：直接发送到硬件队列。然而，有两种情况下可能不会这样做：如果该层有
+IO调度器或者是希望合并请求。在这两种情况下，请求将被发送到软件队列。
+
+随后，在软件队列中的请求被处理后，请求会被放置到硬件队列。硬件队列是第二阶段
+的队列，硬件可以直接访问并处理这些请求。然而，如果硬件没有足够的资源来接受更
+多请求，blk-mq会将请求放置在临时队列中，待硬件资源充足时再发送。
+
+软件暂存队列
+~~~~~~~~~~~~
+
+在这些请求未直接发送到驱动时，块设备I/O子系统会将请求添加到软件暂存队列中
+（由struct blk_mq_ctx表示）。一个请求可能包含一个或多个BIO。它们通过struct bio
+数据结构到达块层。块层随后会基于这些BIO构建新的结构体struct request，用于
+与设备驱动通信。每个队列都有自己的锁，队列数量由每个CPU和每个node为基础
+来决定。
+
+暂存队列可用于合并相邻扇区的请求。例如，对扇区3-6、6-7、7-9的请求可以合并
+为对扇区3-9的一个请求。即便SSD或NVM的随机访问和顺序访问响应时间相同，
+合并顺序访问的请求仍可减少单独请求的数量。这种合并请求的技术称为plugging。
+
+此外，I/O调度器还可以对请求进行重新排序以确保系统资源的公平性（例如防止某
+个应用出现“饥饿”现象）或是提高I/O性能。
+
+I/O调度器
+^^^^^^^^^
+
+块层实现了多种调度器，每种调度器都遵循一定启发式规则以提高I/O性能。它们是
+“可插拔”的（plug and play），可在运行时通过sysfs选择。你可以在这里阅读更
+多关于Linux IO调度器知识 `here
+<https://www.kernel.org/doc/html/latest/block/index.html>`_。调度只发
+生在同一队列内的请求之间，因此无法合并不同队列的请求，否则会造成缓存冲突并需
+要为每个队列加锁。调度后，请求即可发送到硬件。可能选择的调度器之一是NONE调
+度器，这是最直接的调度器：它只将请求放到进程所在的软件队列，不进行重新排序。
+当设备开始处理硬件队列中的请求时（运行硬件队列），映射到该硬件队列的软件队列
+会按映射顺序依次清空。
+
+硬件派发队列
+~~~~~~~~~~~~~
+
+硬件队列（由struct blk_mq_hw_ctx表示）是设备驱动用来映射设备提交队列
+（或设备DMA环缓存）的结构体，它是块层提交路径在底层设备驱动接管请求之前的
+最后一个阶段。运行此队列时，块层会从相关软件队列中取出请求，并尝试派发到硬件。
+
+如果请求无法直接发送到硬件，它们会被加入到请求的链表(``hctx->dispatch``) 中。
+随后，当块层下次运行该队列时，会优先发送位于 ``dispatch`` 链表中的请求，
+以确保那些最早准备好发送的请求能够得到公平调度。硬件队列的数量取决于硬件及
+其设备驱动所支持的硬件上下文数，但不会超过系统的CPU核心数。在这个阶段不
+会发生重新排序，每个软件队列都有一组硬件队列来用于提交请求。
+
+.. note::
+
+        块层和设备协议都不保证请求完成顺序。此问题需由更高层处理，例如文件系统。
+
+基于标识的完成机制
+~~~~~~~~~~~~~~~~~~~
+
+为了指示哪一个请求已经完成，每个请求都会被分配一个整数标识，该标识的取值范围
+是从0到分发队列的大小。这个标识由块层生成，并在之后由设备驱动使用，从而避
+免了为每个请求再单独创建冗余的标识符。当请求在驱动中完成时，驱动会将该标识返
+回给块层，以通知该请求已完成。这样，块层就无需再进行线性搜索来确定是哪一个
+I/O请求完成了。
+
+更多阅读
+--------
+
+- `Linux Block IO: Introducing Multi-queue SSD Access on Multi-core Systems <http://kernel.dk/blk-mq.pdf>`_
+
+- `NOOP scheduler <https://en.wikipedia.org/wiki/Noop_scheduler>`_
+
+- `Null block device driver <https://www.kernel.org/doc/html/latest/block/null_blk.html>`_
+
+源代码
+======
+
+.. kernel-doc:: include/linux/blk-mq.h
+
+.. kernel-doc:: block/blk-mq.c
\ No newline at end of file
diff --git a/Documentation/translations/zh_CN/block/index.rst b/Documentation/translations/zh_CN/block/index.rst
index 45172f6d2659..41fec45b5a3c 100644
--- a/Documentation/translations/zh_CN/block/index.rst
+++ b/Documentation/translations/zh_CN/block/index.rst
@@ -18,10 +18,11 @@ Block
 .. toctree::
    :maxdepth: 1
 
+   blk-mq
+
 TODOList:
 * bfq-iosched
 * biovecs
-* blk-mq
 * cmdline-partition
 * data-integrity
 * deadline-iosched
-- 
2.25.1

