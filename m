Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190754;
	b=Wfc9o5WWTkwL+VDIPL+vIm7krJwvh/+7q3BDq76h5cBW7pyF5HejOgJg1ZxgYKmQugys
	 mBxurx5SIFuk6yb30DrvdAq+f9fUxfPZUqHkSP1UsO31hotHhWlghnVvbmGYyvPqa4U8v
	 y7+qh0hWTRbGOFE82QbrJEzEhatemk60a90uit2EtlsI+kAIOuBb3hJ1HUifgEysWZE42
	 j9n6L9IQgMCBhhNC0LgJoIWW2qI/qxQZSjlZwQ6JlMiluSy1tKyfy0jP7xv1pT4tnblfQ
	 N66nuMQXl1e+l/1zucZtPLy3Sp2gM89XEnD3L5hb3gFsFnjrcZu9r/aNy5uGB87kL6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=meKJe7lCyNFEN93JPQ7h8ShHF7ParLcS2UQWTfa4VEo=;
	b=b+B0mgzhhM9Ck2Ae1qIVzbtkno2ibEr7ifOGLilhDI1dJqTyWFKg0ftlxn0fG4ruRlnz
	 tBS++xUO83RAVtiTw8kjiL7psYNHioOa4rtFDDMQpSITX3AQEge960aOpYOyIww47Kccq
	 yGXCSQQdM3psXlGhxwBwqisR4cZ0pX02u+DBr1AuTDmvtQqWYGCUhP+Z0sPsugF8eoxTr
	 gch2O4S+STAa/AEHJVYEOnQrHH9+F6X87kV0cVVntjSkz/9gG692egVWaEk4lVqQPXs6E
	 q3yAD2w/dYLSUTcDfpFiFfmV//y3Kjxvk47mXEuk3HVFcEzj+gqVA2G4KI7uTr8nD1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=duDAI5+l;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513F6606A325
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 16:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 513F6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=duDAI5+l
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso295054a91.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190754; x=1795795554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meKJe7lCyNFEN93JPQ7h8ShHF7ParLcS2UQWTfa4VEo=;
        b=duDAI5+lHr0kESpc32TTBAtUcQkoAp1Ii2Xb/p78BllX+AJzi1EGSsfFPwuI07MGLP
         Og6aOHUMWkaDdBwneGOrDExZcDM4W0rGDo17gvEwqAfZnaVbnn5tgq8KrluNH1SDYmni
         yoLXjJ/AO0rJOYDAzbw0FxJvTGqraqTNDyZOlRKxa2DDcUdCvYeDjKZBLAqAeJl044c5
         T2+LXMeeDRI36KFaSWP8VL9jJmbJPAGp6RNb3+6LIAeI+pGFD0Gh2Xh38rnS4ALCWORX
         6f783s8QOeXe913iJdqkCxyAQxPmXHibuijHnZE3qtYPfRYm/CBCxSU7bUbE3voLcL9/
         Qr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190754; x=1795795554;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=meKJe7lCyNFEN93JPQ7h8ShHF7ParLcS2UQWTfa4VEo=;
        b=tvSM2htt1xhbS28eCyxHM+XWVZdbJTstmltmoEThlQuU/KAcozLBcoDYvtJDyOPuz+
         J7d+kUe2Q2rSaZsXumTlAanh70gGTX983HUQ+gNUAe2nFn8tTgHQE5vA1xfiJQurKiNh
         CsmkM5XgDfV77dNrkQaRaCvjoe+PoLz0BWIDI1XaVmNm6wYY+ArT/cobwDW93T/mjy1d
         fDQFvKGJMnwNzTrQjzfXXtDO92b+hJgJkdNqdxtYT2i8JPnKpz20YKcrAtPZR/M3+c3t
         XufBUSOzTu/rwDFrNfdgr7+YewN+ezLcfpKKIUpB1IT+C1kowTUzUSkf2MXY255YRLVd
         uRYg==
X-Gm-Message-State: APuU4Z+JSz+DFswS1VB2fNgQPeGHsJTBqU49fajwNjny/ccUz6ZXqvek
	icoAOrsRT1wmOuaBGNaJ1xRseDnXjH6yR456Phf5UovzHR2C5Ig7p8knC8ATgF63hDg0iA==
X-Gm-Gg: AZFdTZdSKQanIZMY5plhV72Yzk4k1UeNIPMPuBcVihiNxfPS103sCTqEA6JjtQ6LlIG
	GAP7ZJfcqglJZvXEAHCMUKtqgHfmfIIw+UQaCcmJY7sDspsUVe+cOGtP3332DQuyoWn2hXFZlJR
	zkW2X5+oh9A/B303GT77hJ36Xs3O55iikXo1J0IdNMjkrmgE7c1ti+xKHlkYEfZwu/1WHHcNldS
	RXxrwqhw7sAwh4TW1IgIzDRmeEkDUIY+AbOwTKPzcgC3+ncxcLJPCiStfn7x3JvxikFS4zHBX9E
	bSR8gEqnkxzS+5NIocTmwh+euyn3Yo2/3SayA2jOPQDT3IwAt8Ffyg3I+6BH/6hH1fxP5yeUtw+
	AXZcWVM0yQu+YgI1mD3PIZ3C1c/2QBt7jjNal5PLL0ga9mfznbbMJpm2zo3ETNIsUSyjrrt/MYK
	VLiZBwcIkZ53EafUVzeZLy/Q0qW+CldVLoC7Jddvey5/MND14MbC+xnUXWk3YN4vGoZCyfvFN9y
	paqVBuke8VyBgN4DQKdSgNNW2NkbcDi3UZVwOyZmQWGDl+d9lABOCYsltYCcM2RgYEcArG9QOXh
	tGiHcRuqWGcnu99ioj24AQ==
X-Received: by 2002:a17:90b:3f0e:b0:3b3:fc1f:a5c1 with SMTP id 98e67ed59e1d1-3b41c8fed40mr3199427a91.28.1795190753411;
        Fri, 20 Nov 2026 08:05:53 -0800 (PST)
Received: from nixos ([218.72.8.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm4891544a91.17.2026.11.20.08.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:05:52 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: linux-doc@vger.kernel.org
Cc: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	chao.liu@processmission.com,
	zenghui.yu@linux.dev,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH v2] docs/zh_CN: Add core-api/irq managed_irq Chinese translation
Date: Sat, 21 Nov 2026 00:05:36 +0800
Message-ID: <20261120160539.103773-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/core-api/irq/managed_irq.rst into Chinese
and add it to the zh_CN irq toctree.

Update the translation through commit bb6a85b4b652
("Documentation: Add managed interrupts")

Co-developed-by: Chao Liu <chao.liu@processmission.com>
Signed-off-by: Chao Liu <chao.liu@processmission.com>
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
Thanks Zenghui for the review.

v1 -> v2:
  - Use a Co-developed-by/Signed-off-by pair for Chao Liu and keep the
    author's Signed-off-by last, as suggested by Zenghui Yu.
  - Reflow the translation to use the available width more evenly.

Testing:
  make SPHINXDIRS="translations/zh_CN" htmldocs and checkpatch.pl pass.

 .../translations/zh_CN/core-api/irq/index.rst |   1 +
 .../zh_CN/core-api/irq/managed_irq.rst        | 107 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/managed_irq.rst

diff --git a/Documentation/translations/zh_CN/core-api/irq/index.rst b/Documentation/translations/zh_CN/core-api/irq/index.rst
index ba6acc4..7951d69 100644
--- a/Documentation/translations/zh_CN/core-api/irq/index.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/index.rst
@@ -20,3 +20,4 @@ IRQs
    irq-affinity
    irq-domain
    irqflags-tracing
+   managed_irq
diff --git a/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst b/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
new file mode 100644
index 0000000..b1b7918
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
@@ -0,0 +1,107 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/irq/managed_irq.rst
+
+:翻译:
+
+ Zixin Wang <w1355457260@gmail.com>
+
+.. _cn_managed_irq.rst:
+
+=============================
+亲和性托管中断（managed IRQ）
+=============================
+
+IRQ core 支持按指定 CPU 亲和性管理中断。正常运行时，每个中断关联到
+某个特定的 CPU。如果该 CPU 离线，中断会被迁移到另一个在线 CPU。
+
+中断向量很多时，设备可能给可用的向量空间带来压力。例如，一块带 128 个
+I/O 队列的 NVMe 设备，在至少有 128 个 CPU 的系统中，通常每个队列请求
+一个中断。两个这样的设备就会请求 256 个中断。在 x86 上，中断向量空间
+出了名地少：每个 CPU 只有 256 个向量，内核还要保留其中一部分，从而进一步
+减少可供设备中断使用的数量。实际使用中通常没有问题，因为中断分散在许多
+CPU 上，每个 CPU 只分到少量向量。
+
+然而在系统挂起时，所有次级 CPU 都会离线，所有中断都被迁移到唯一保持在线
+的那个 CPU 上。这可能会耗尽该 CPU 上可用的中断向量，从而导致挂起操作失败。
+
+亲和性托管（affinity-managed）中断应对了这一限制。每个中断都分配一个
+CPU 亲和性掩码，指定该中断可以定向到的 CPU 集合。当掩码中的某个 CPU 离线
+时，中断会移到掩码中的下一个 CPU。如果掩码中的最后一个 CPU 也离线，那么
+该中断会被关闭。使用亲和性托管中断的驱动程序必须确保，在中断被禁用之前
+关联的队列已处于静默（quiesced）状态，以免再产生新的中断。当亲和性掩码
+中的某个 CPU 重新上线时，中断会被重新使能。
+
+实现
+----
+
+设备必须提供按实例划分的中断，例如 NVMe 等存储设备的按 I/O 队列中断。
+驱动程序使用 struct irq_affinity 按所需的亲和性设置分配中断向量。对于
+MSI-X 设备，需要设置 PCI_IRQ_AFFINITY 标志并调用
+pci_alloc_irq_vectors_affinity() 来完成。
+
+IRQ core 会根据提供的亲和性信息，尽量在整个系统上均匀分散中断。亲和性
+掩码在这一分配阶段计算，但最终的 IRQ 分配是在调用 request_irq() 时完成的。
+
+隔离 CPU
+--------
+
+托管中断的亲和性完全由内核处理，无法通过 /proc 接口从用户空间修改。
+isolcpus 启动选项的 managed_irq 子参数可指定一个 CPU 掩码，托管中断会
+尽量避开这些 CPU。这种隔离是尽力而为的：只有当自动分配的掩码中也包含
+被避开掩码之外的在线 CPU 时才会生效。如果请求的掩码只包含隔离 CPU，
+该设置就没有任何效果。
+
+被避开掩码中的 CPU 仍属于该中断的亲和性掩码。也就是说，如果所有非隔离
+CPU 都离线、而隔离 CPU 仍在线，中断就会被分配到某个隔离 CPU 上。
+
+以下示例假设系统有 8 个 CPU。
+
+- 使用 "-device virtio-scsi-pci" 启动一个 QEMU 实例。该 MSI-X 设备会
+  暴露 11 个中断：3 个“管理”中断和 8 个“队列”中断。驱动程序请求这 8 个
+  队列中断，每个中断恰好亲和到一个 CPU。如果该 CPU 离线，该中断就会被
+  关闭。
+
+  假设中断 48 是其中一个队列中断，那么会看到::
+
+    /proc/irq/48/effective_affinity_list:7
+    /proc/irq/48/smp_affinity_list:7
+
+  这表明该中断只由 CPU7 服务。关闭 CPU7 并不会把中断迁移到其他 CPU::
+
+    /proc/irq/48/effective_affinity_list:0
+    /proc/irq/48/smp_affinity_list:7
+
+  可以通过 debugfs 接口 (/sys/kernel/debug/irq/irqs/48) 验证这一点。
+  dstate 字段会包含 IRQD_IRQ_DISABLED、IRQD_IRQ_MASKED 和
+  IRQD_MANAGED_SHUTDOWN。
+
+- 使用以下参数启动 QEMU 实例：
+  "-device virtio-scsi-pci,num_queues=2"
+  并在内核命令行中加入：
+  "irqaffinity=0,1 isolcpus=domain,2-7 isolcpus=managed_irq,1-3,5-7"。
+  该 MSI-X 设备会暴露 5 个中断：3 个管理中断和 2 个队列中断。管理中断
+  遵循 irqaffinity= 设置。队列中断分散到可用的 CPU 上::
+
+    /proc/irq/47/effective_affinity_list:0
+    /proc/irq/47/smp_affinity_list:0-3
+    /proc/irq/48/effective_affinity_list:4
+    /proc/irq/48/smp_affinity_list:4-7
+
+  这两个队列中断被均匀分配。中断 48 落在 CPU4 上，因为 managed_irq
+  掩码会尽可能避开 CPU 5-7。
+
+  将 managed_irq 参数换成
+  "isolcpus=managed_irq,1-3,4-5,7" 后，结果是::
+
+    /proc/irq/48/effective_affinity_list:6
+    /proc/irq/48/smp_affinity_list:4-7
+
+  此时中断 48 由 CPU6 服务，因为系统避开了 CPU 4、5 和 7。如果 CPU6
+  离线，中断会迁移到某个“隔离”CPU::
+
+    /proc/irq/48/effective_affinity_list:7
+    /proc/irq/48/smp_affinity_list:4-7
+
+  一旦其 smp_affinity 掩码中列出的所有 CPU 都离线，该中断就会被关闭。
-- 
2.54.0

