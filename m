Received: from mail-m15591.qiye.163.com (mail-m15591.qiye.163.com [101.71.155.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769343BBF0
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 03:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763351181; cv=none; b=T7EvxeJZ7c9J2bf1DmOpB3Jjwu5P01WfzridhFh7mlgWCprtPxRl8IvfhOBEdvD4/hVt7/Wm2Cm60fonwGv400TQPddLFPd06VE+HJwiB61WArBx3USqECFQavaWmjPA4bUGk9pXYmcnQsy8tyUF3UjDQjc0ZymqSdN732tQQ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763351181; c=relaxed/simple;
	bh=/E++hkK1/LpX1zXgsj68JSaic3S4JiZaGVoVtMB+2yQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i2hmZlXa1zhO18RFfF8VxKP/98IkEcJA0FmX9Q81uxxI6Xu6yY3pH/kItWhPqJZYTO6o3KahQGKRriXuBMv20XSYvordhy8wk+RXGsCEK37BGliidCkqpgMxl3D3LnA0cewOhxAamJFUyobkror3zY/V0gcIsqFw4I0U7pJLY5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=dPdUQoeW; arc=none smtp.client-ip=101.71.155.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="dPdUQoeW"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29c9141e3;
	Mon, 17 Nov 2025 11:46:13 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v2 3/3] docs/zh_CN: Add data-integrity.rst translation
Date: Mon, 17 Nov 2025 11:46:10 +0800
Message-Id: <a30e43d25be989cad6a24dfcb847e9642b9582ef.1763350407.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1763350407.git.kezijie@leap-io-kernel.com>
References: <cover.1763350407.git.kezijie@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8feb99aa09d8kunm4b5bfed13c773d1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSklCVkJMTh0aSRpJHRlKSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=dPdUQoeWO+YpeDoaUX37EA5lzKeweuvVxK6ojv7OMOe1nNFQOFZPTyXx8Dg1xJjeSQZ1WRW58eoHnZdqWEk9FvyqoilwahXbcnMCIQzDXFc83xPPCuBObS+Y6n8C0RtAwMQVrR9jz8u1x1A6r+imOZ/kK7AgphrqLI2kLqrZfV13zb4pkBWAOdIGxr+/hBA+yN2Hkv2MUWsUsSzbFzKn6KB2pEehkV9ns1rWrF+orsAldaJE84oHPfZ0b074A+EKEGMAbBbHdAsDu8ZtTf5yqboSGpqHjdPrUSOOGDFFu95dzuTwCWAIq2fXtUwMVbc6O76/8wqEzLD1F66xc2iYoQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=SISqxuL/rpJbLC6MONY71F91OQ4J8eyaM+W5P8CRnmg=;
	h=date:mime-version:subject:message-id:from;

Translate .../block/data-integrity.rst into Chinese.
Add data-integrity into .../block/index.rst.

Update the translation through commit c6e56cf6b2e7
("block: move integrity information into queue_limits")

Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
---
 .../zh_CN/block/data-integrity.rst            | 193 ++++++++++++++++++
 .../translations/zh_CN/block/index.rst        |   2 +-
 2 files changed, 194 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/block/data-integrity.rst

diff --git a/Documentation/translations/zh_CN/block/data-integrity.rst b/Documentation/translations/zh_CN/block/data-integrity.rst
new file mode 100644
index 000000000000..0f05c7d4ce37
--- /dev/null
+++ b/Documentation/translations/zh_CN/block/data-integrity.rst
@@ -0,0 +1,193 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/block/data-integrity.rst
+
+:翻译:
+
+ 柯子杰 kezijie <kezijie@leap-io-kernel.com>
+
+:校译:
+
+
+==========
+数据完整性
+==========
+
+1. 引言
+=======
+
+现代文件系统对数据和元数据都进行了校验和保护以防止数据损坏。然而，这种损坏的
+检测是在读取时才进行，这可能发生在数据写入数月之后。到那时，应用程序尝试写入
+的原始数据很可能已经丢失。
+
+解决方案是确保磁盘实际存储的内容就是应用程序想存储的。SCSI 协议族（如 SBC
+数据完整性字段、SCC 保护提案）以及 SATA/T13（外部路径保护）最近新增的功能，
+通过在 I/O 中附加完整性元数据的方式，试图解决这一问题。完整性元数据（在
+SCSI 术语中称为保护信息）包括每个扇区的校验和，以及一个递增计数器，用于确保
+各扇区按正确顺序被写入盘。在某些保护方案中，还能保证 I/O 写入磁盘的正确位置。
+
+当前的存储控制器和设备实现了多种保护措施，例如校验和和数据清理。但这些技术通
+常只在各自的独立域内工作，或最多仅在 I/O 路径的相邻节点之间发挥作用。DIF 及
+其它数据完整性拓展有意思的点在于保护格式定义明确，I/O 路径上的每个节点都可以
+验证 I/O 的完整性，如检测到损坏可直接拒绝。这不仅可以防止数据损坏，还能够隔
+离故障点。
+
+2. 数据完整性拓展
+=================
+
+如上所述，这些协议扩展只保护控制器与存储设备之间的路径。然而，许多控制器实际
+上允许操作系统与完整性元数据(IMD)交互。我们一直与多家 FC/SAS HBA 厂商合作，
+使保护信息能够在其控制器与操作系统之间传输。
+
+SCSI 数据完整性字段通过在每个扇区后附加8字节的保护信息来实现。数据 + 完整
+性元数据存储在磁盘的520字节扇区中。数据 + IMD 在控制器与目标设备之间传输
+时是交错组合在一起的。T13 提案的方式类似。
+
+由于操作系统处理520字节（甚至 4104 字节）扇区非常不便，我们联系了多家 HBA
+厂商，并鼓励它们分离数据与完整性元数据的 scatter-gather lists。
+
+控制器在写入时会交错组合数据和完整性元数据缓冲区的数据在一起，并在读取时会拆
+分它们。这样，Linux 就能直接通过 DMA 将数据缓冲区传输到主机内存或从主机内存
+读取，而无需修改页缓存。
+
+此外，SCSI 与 SATA 规范要求的16位 CRC 校验在软件中计算代价较高。基准测试发
+现，计算此校验在高负载情形下显著影响系统性能。一些控制器允许在操作系统接口处
+使用轻量级校验。例如 Emulex 支持 TCP/IP 校验。操作系统提供的 IP 校验在写入
+时会转换为16位 CRC，读取时则相反。这允许 Linux 或应用程序以极低的开销生成
+完整性元数据（与软件 RAID5 相当）。
+
+IP 校验在检测位错误方面比 CRC 弱，但关键在于数据缓冲区与完整性元数据缓冲区
+的分离。只有这两个不同的缓冲区匹配，I/O 才能完成。
+
+数据与完整性元数据缓冲区的分离以及校验选择被称为数据完整性扩展。由于这些扩展
+超出了协议主体(T10、T13)的范围，Oracle 及其合作伙伴正尝试在存储网络行业协
+会内对其进行标准化。
+
+3. 内核变更
+===========
+
+Linux 中的数据完整性框架允许将保护信息固定到 I/O 上，并在支持该功能的控制器
+之间发送和接收。
+
+SCSI 和 SATA 中完整性扩展的优势在于，它们能够保护从应用程序到存储设备的整个
+路径。然而，这同时也是最大的劣势。这意味着保护信息必须采用磁盘可以理解的格式。
+
+通常，Linux/POSIX 应用程序并不关心所访问存储设备的具体细节。虚拟文件系统层
+和块层会让硬件扇区大小和传输协议对应用程序完全透明。
+
+然而，在准备发送到磁盘的保护信息时，就需要这种细节。因此，端到端保护方案的概
+念实际上违反了层次结构。应用程序完全不应该知道它访问的是 SCSI 还是 SATA 磁盘。
+
+Linux 中实现的数据完整性支持尝试将这些细节对应用程序隐藏。就应用程序（以及在
+某种程度上内核）而言，完整性元数据是附加在 I/O 上的不透明信息。
+
+当前实现允许块层自动为任何 I/O 生成保护信息。最终目标是将用户数据的完整性元
+数据计算移至用户空间。内核中产生的元数据和其他 I/O 仍将使用自动生成接口。
+
+一些存储设备允许为每个硬件扇区附加一个16位的标识值。这个标识空间的所有者是
+块设备的所有者，也就是在多数情况下由文件系统掌控。文件系统可以利用这额外空间
+按需为扇区附加标识。由于标识空间有限，块接口允许通过交错方式对更大的数据块标
+识。这样，8*16位的信息可以附加到典型的 4KB 文件系统块上。
+
+这也意味着诸如 fsck 和 mkfs 等应用程序需要能够从用户空间访问并操作这些标记。
+为此，正在开发一个透传接口。
+
+4. 块层实现细节
+===============
+
+4.1 Bio
+--------
+
+当启用 CONFIG_BLK_DEV_INTEGRITY 时，数据完整性补丁会在 struct bio 中添加
+一个新字段。调用 bio_integrity(bio) 会返回一个指向 struct bip 的指针，该
+结构体包含了该 bio 的完整性负载。本质上，bip 是一个精简版的 struct bio，其
+中包含一个 bio_vec，用于保存完整性元数据以及所需的维护信息（bvec 池、向量计
+数等）。
+
+内核子系统可以通过调用 bio_integrity_alloc(bio) 来为某个 bio 启用数据完整
+性保护。该函数会分配并附加一个 bip 到该 bio 上。
+
+随后使用 bio_integrity_add_page() 将包含完整性元数据的单独页面附加到该 bio。
+
+调用 bio_free() 会自动释放bip。
+
+4.2 块设备
+-----------
+
+块设备可以在 queue_limits 结构中的 integrity 子结构中设置完整性信息。
+
+对于分层块设备，需要选择一个适用于所有子设备的完整性配置文件。可以使用
+queue_limits_stack_integrity() 来协助完成该操作。目前，DM 和 MD linear、
+RAID0 和 RAID1 已受支持。而RAID4/5/6因涉及应用标签仍需额外的开发工作。
+
+5.0 块层完整性API
+==================
+
+5.1 普通文件系统
+-----------------
+
+    普通文件系统并不知道其下层块设备具备发送或接收完整性元数据的能力。
+    在执行写操作时，块层会在调用 submit_bio() 时自动生成完整性元数据。
+    在执行读操作时，I/O 完成后会触发完整性验证。
+
+    IMD 的生成与验证行为可以通过以下开关控制::
+
+      /sys/block/<bdev>/integrity/write_generate
+
+    and::
+
+      /sys/block/<bdev>/integrity/read_verify
+
+    flags.
+
+5.2 具备完整性感知的文件系统
+----------------------------
+
+    具备完整性感知能力的文件系统可以在准备 I/O 时附加完整性元数据，
+    并且如果底层块设备支持应用标签空间，也可以加以利用。
+
+
+    `bool bio_integrity_prep(bio);`
+
+      要为写操作生成完整性元数据或为读操作设置缓冲区，文件系统必须调用
+      bio_integrity_prep(bio)。
+
+      在调用此函数之前，必须先设置好 bio 的数据方向和起始扇区，并确
+      保该 bio 已经添加完所有的数据页。调用者需要自行保证，在 I/O 进行
+      期间 bio 不会被修改。如果由于某种原因准备失败，则应当以错误状态
+      完成该 bio。
+
+5.3 传递已有的完整性元数据
+--------------------------
+
+    能够自行生成完整性元数据或可以从用户空间传输完整性元数据的文件系统，
+    可以使用如下接口：
+
+
+    `struct bip * bio_integrity_alloc(bio, gfp_mask, nr_pages);`
+
+      为 bio 分配完整性负载并挂载到 bio 上。nr_pages 表示需要在
+      integrity bio_vec list 中存储多少页保护数据（类似 bio_alloc）。
+
+      完整性负载将在 bio_free() 被调用时释放。
+
+
+    `int bio_integrity_add_page(bio, page, len, offset);`
+
+      将包含完整性元数据的一页附加到已有的 bio 上。该 bio 必须已有 bip，
+      即必须先调用 bio_integrity_alloc()。对于写操作，页中的完整
+      性元数据必须采用目标设备可识别的格式，但有一个例外，当请求在 I/O 栈
+      中传递时，扇区号会被重新映射。这意味着通过此接口添加的页在 I/O 过程
+      中可能会被修改！完整性元数据中的第一个引用标签必须等于 bip->bip_sector。
+
+      只要 bip bio_vec array（nr_pages）有空间，就可以继续通过
+      bio_integrity_add_page()添加页。
+
+      当读操作完成后，附加的页将包含从存储设备接收到的完整性元数据。
+      接收方需要处理这些元数据，并在操作完成时验证数据完整性
+
+
+----------------------------------------------------------------------
+
+2007-12-24 Martin K. Petersen <martin.petersen@oracle.com>
\ No newline at end of file
diff --git a/Documentation/translations/zh_CN/block/index.rst b/Documentation/translations/zh_CN/block/index.rst
index 41fec45b5a3c..cd38cfcce47b 100644
--- a/Documentation/translations/zh_CN/block/index.rst
+++ b/Documentation/translations/zh_CN/block/index.rst
@@ -19,12 +19,12 @@ Block
    :maxdepth: 1

    blk-mq
+   data-integrity

 TODOList:
 * bfq-iosched
 * biovecs
 * cmdline-partition
-* data-integrity
 * deadline-iosched
 * inline-encryption
 * ioprio
--
2.25.1

