Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084409;
	b=IQ0MR9ZoyvZCclBYrlKZWyE4VYs5/Whwaqm/PnfyPpW4p34NF8X5yERJF1W7JzaVA8l8
	 AThCrvihwM/bgwe4TZlp47LBAhvmzXsIKh1cqKBtBf/J7pS56/52jrlbWSygLCsHzNMn0
	 SBsAbZ6IrkUAUT+V0Azd7+Bwpmzf2wADYzh1aFOoX1uzY6lBELU+HorMCPr3AAUDw1WwZ
	 f3efiwzJkp/hn1SUWvbB8IGzzu5zmADfxvJa0uh0ZCBYShyxixMopm2mdKt45ZHVyE4WD
	 guY5lT0iEMJu4SzNFF9J/3Vurwk3IR+1phMF8+JDsGZEvzpFNca77QeW2n472OBlbZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=v3WiIIXzgtz4RwHmHaOOCoT8D9R+CSrC6sFCDtOopzE=;
	b=2JzJJHkFPGw2QMWB9zFvQixM3+n/6G8fqwYYgXa7S7TOqiVG9qWRGjIou0asQAQ4HU8V
	 +V5+InJcBq4bo1GZtqZ2eJdPWl1EqMcOqNptQ9h+ty68AWrra0rGP7m4L/PcgekfVTZ0C
	 fdk0UqXhEIrMz2tDGo9igWmRsrPRPzQdlDZOPq+YdA5v2ku0WOO9mULYnua7azjvuSRgL
	 pUJgIc+C5QammwbBg77DQXG/k8aNhVN/gK7IgfuX41UNYCH8jY956RbjpTFEwXvB/lYi9
	 rfd3cPHUs/ozgmfaUJsGWbc5vK8mhMUS9LJvRGZSbY5Tf3JkNXL58ZiyX5QjuKQzPYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5pe+PY7;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706FD606A320
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 10:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706FD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5pe+PY7
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2efda2c6606so11067295ad.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 02:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084408; x=1795689208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3WiIIXzgtz4RwHmHaOOCoT8D9R+CSrC6sFCDtOopzE=;
        b=N5pe+PY74FIdNLcvhW+CzO6JK6hgZIDsOtsLwBc1Wksd9CTvlfONhtsn67JshphENO
         yb4rFSGbvcP1500UBW5prVlrGJIKXS932H9EYMrpi0/uyXmWGFEJ3SAx1EOUjC5+lOVg
         iIAIEaJHFxVQIbBvW16oZH4Gjlvfg5Vz+ck9LIUjsjz7M2N+Zarn0Fvv41CJa3swAZzp
         +9+RF0TPB6IAKV1UcS1ZqF1gLtaRi+6gfcxlhMQyj1CXBZv2Laa4idMYQvrJ+Wy5Ll2n
         H+qs/6hyz+lp8Q72ID6u6813ShlI+HYiADl2du69Nx2X755W1aS1Yc6hVVe1/doIOpEe
         ht5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084408; x=1795689208;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v3WiIIXzgtz4RwHmHaOOCoT8D9R+CSrC6sFCDtOopzE=;
        b=iHPFxPweTgfD+7XcvBllogc9sz8AOM/SCEomD1WqGk00dKmM0USEGQiz1GYnR2AJgH
         LEx+M61dNrnLEt5FZl+x/a6yDZA+W4kqZ7ntkVsmA2XPhpojfLxgVHQMfBZcedC1aLWk
         4OEmWUPIJPwlMzZ94Vve/Nnt0MAw+/IU7pLi/oZB6hQq/j56nXGw6/7gEQKgSOf23n8/
         dZ/Qa5qURfVZM7rDnLEGEBiH7ZVZ6QJKodzXRAQc0IcZPp+AbTcTrrgtewh1JCAAf6G/
         IRfERQ7dTNmmLNgHM4z4FsYEmxMtAQDNmQPTwhIt10eC0uXPR876dLOPiDQ1NeiqEWiE
         hQ6g==
X-Gm-Message-State: APuU4Z9ce9uVjI8l6AIbWGso/QM5+F8Rvpso7xXZX4TzE+A3YnfAJrsy
	lB1aSfclM5JFIRvfhiBXODFZs758ZBH8ZbPoEqC8gVoQIY0yq4kVWLo6QNItj+gego8tLl32
X-Gm-Gg: AZFdTZcodxzf7WPD1tg5SJsBQD54RwTgF6x1bLBc9ts5tuGRlbEly3Swg29NtVdm178
	c/XotjZiY1lITbPYFyMAo9LhCU3cbL4bnBPr5k34xIHQZQqkKzSJ9EA/7u7tluLhn/VADGKuSU2
	gKqDmv0MG3MpOroawgeRnQpJ5scfrP/gzMuxKWscXfANaIgfJhTdCMwhc0uNXkBfRqyh/320adi
	DRRUeI34NcECj0o7HgJYXOfYtHkt62N19FWLX3dmdPYjvDvRSp3fsCjsukmdm2Mfs2B6slAh3Hr
	86QY57BfeGFgXRzsH1upXt3aEh2Sr/xVUOUnVtzBqXhakONq/cNsvLRVYVraAgEkXD85RGiQzzf
	uVSSz6ZClFFDje93YSw2HxZCMZtsxa0izl5VhUi9bz5URjIVb2gBoI9YI5s7m1tXzM1HfbexYvF
	TZahQh10fHJq2ujdTLGXcwx9s7BGhcUrwCndwtRdQckatZub0PYw8j2723yN+MK7H3y1Ou4KASG
	wKhUd2uWu0YYbLl6UI2IKYTVu2l2M/VYLsM5ilW9Ly2o/i033CowfMzaKEPXx2I1cjiwPI1MYga
	x0X6dS8uehvcGLRUbFD5wLzbOTQ=
X-Received: by 2002:a17:902:c949:b0:2e9:5507:b532 with SMTP id d9443c01a7336-2eff7529710mr55603575ad.43.1795084407470;
        Thu, 19 Nov 2026 02:33:27 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:442a:a289:fb24:6d94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff627bdb7sm28592595ad.58.2026.11.19.02.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:33:26 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: linux-doc@vger.kernel.org
Cc: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>,
	Chao Liu <chao.liu@processmission.com>
Subject: [PATCH] docs/zh_CN: Add core-api/irq managed_irq Chinese translation
Date: Thu, 19 Nov 2026 18:31:38 +0800
Message-ID: <20261119103147.112197-1-w1355457260@gmail.com>
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

Signed-off-by: Zixin Wang <w1355457260@gmail.com>
Signed-off-by: Chao Liu <chao.liu@processmission.com>
---
 .../translations/zh_CN/core-api/irq/index.rst |   1 +
 .../zh_CN/core-api/irq/managed_irq.rst        | 147 ++++++++++++++++++
 2 files changed, 148 insertions(+)
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
index 0000000..366320e
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
@@ -0,0 +1,147 @@
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
+IRQ core 支持按指定 CPU 亲和性管理中断。
+正常运行时，每个中断关联到某个特定的
+CPU。如果该 CPU 离线，中断会被迁移到
+另一个在线 CPU。
+
+中断向量很多时，设备可能给可用的
+向量空间带来压力。例如，一块带
+128 个 I/O 队列的 NVMe 设备，在至少
+有 128 个 CPU 的系统中，通常每个队列
+请求一个中断。两个这样的设备就会请求
+256 个中断。在 x86 上，中断向量空间
+出了名地少：每个 CPU 只有 256 个向量，
+内核还要保留其中一部分，从而进一步
+减少可供设备中断使用的数量。实际使用
+中通常没有问题，因为中断分散在许多
+CPU 上，每个 CPU 只分到少量向量。
+
+然而在系统挂起时，所有次级 CPU 都会
+离线，所有中断都被迁移到唯一保持在线
+的那个 CPU 上。这可能会耗尽该 CPU 上
+可用的中断向量，从而导致挂起操作失败。
+
+亲和性托管（affinity-managed）中断
+应对了这一限制。每个中断都分配一个
+CPU 亲和性掩码，指定该中断可以定向到
+的 CPU 集合。当掩码中的某个 CPU 离线
+时，中断会移到掩码中的下一个 CPU。
+如果掩码中的最后一个 CPU 也离线，
+那么该中断会被关闭。使用亲和性托管
+中断的驱动程序必须确保，在中断被禁用
+之前关联的队列已处于静默（quiesced）
+状态，以免再产生新的中断。当亲和性
+掩码中的某个 CPU 重新上线时，中断会
+被重新使能。
+
+实现
+----
+
+设备必须提供按实例划分的中断，例如
+NVMe 等存储设备的按 I/O 队列中断。
+驱动程序使用 struct irq_affinity 按
+所需的亲和性设置分配中断向量。对于
+MSI-X 设备，需要设置
+PCI_IRQ_AFFINITY 标志并调用
+pci_alloc_irq_vectors_affinity() 来
+完成。
+
+IRQ core 会根据提供的亲和性信息，尽量
+在整个系统上均匀分散中断。亲和性掩码
+在这一分配阶段计算，但最终的 IRQ 分配
+是在调用 request_irq() 时完成的。
+
+隔离 CPU
+--------
+
+托管中断的亲和性完全由内核处理，无法
+通过 /proc 接口从用户空间修改。
+isolcpus 启动选项的 managed_irq 子参数
+可指定一个 CPU 掩码，托管中断会尽量
+避开这些 CPU。这种隔离是尽力而为的：
+只有当自动分配的掩码中也包含被避开掩码
+之外的在线 CPU 时才会生效。如果请求的
+掩码只包含隔离 CPU，该设置就没有任何
+效果。
+
+被避开掩码中的 CPU 仍属于该中断的
+亲和性掩码。也就是说，如果所有非隔离
+CPU 都离线、而隔离 CPU 仍在线，中断
+就会被分配到某个隔离 CPU 上。
+
+以下示例假设系统有 8 个 CPU。
+
+- 使用 "-device virtio-scsi-pci" 启动
+  一个 QEMU 实例。该 MSI-X 设备会暴露
+  11 个中断：3 个“管理”中断和 8 个
+  “队列”中断。驱动程序请求这 8 个队列
+  中断，每个中断恰好亲和到一个 CPU。
+  如果该 CPU 离线，该中断就会被关闭。
+
+  假设中断 48 是其中一个队列中断，那么
+  会看到::
+
+    /proc/irq/48/effective_affinity_list:7
+    /proc/irq/48/smp_affinity_list:7
+
+  这表明该中断只由 CPU7 服务。关闭 CPU7
+  并不会把中断迁移到其他 CPU::
+
+    /proc/irq/48/effective_affinity_list:0
+    /proc/irq/48/smp_affinity_list:7
+
+  可以通过 debugfs 接口
+  (/sys/kernel/debug/irq/irqs/48) 验证
+  这一点。dstate 字段会包含
+  IRQD_IRQ_DISABLED、IRQD_IRQ_MASKED
+  和 IRQD_MANAGED_SHUTDOWN。
+
+- 使用以下参数启动 QEMU 实例：
+  "-device virtio-scsi-pci,num_queues=2"
+  并在内核命令行中加入：
+  "irqaffinity=0,1 isolcpus=domain,2-7
+  isolcpus=managed_irq,1-3,5-7"。
+  该 MSI-X 设备会暴露 5 个中断：3 个
+  管理中断和 2 个队列中断。管理中断遵循
+  irqaffinity= 设置。队列中断分散到
+  可用的 CPU 上::
+
+    /proc/irq/47/effective_affinity_list:0
+    /proc/irq/47/smp_affinity_list:0-3
+    /proc/irq/48/effective_affinity_list:4
+    /proc/irq/48/smp_affinity_list:4-7
+
+  这两个队列中断被均匀分配。中断 48
+  落在 CPU4 上，因为 managed_irq 掩码
+  会尽可能避开 CPU 5-7。
+
+  将 managed_irq 参数换成
+  "isolcpus=managed_irq,1-3,4-5,7" 后，
+  结果是::
+
+    /proc/irq/48/effective_affinity_list:6
+    /proc/irq/48/smp_affinity_list:4-7
+
+  此时中断 48 由 CPU6 服务，因为系统
+  避开了 CPU 4、5 和 7。如果 CPU6 离线，
+  中断会迁移到某个“隔离”CPU::
+
+    /proc/irq/48/effective_affinity_list:7
+    /proc/irq/48/smp_affinity_list:4-7
+
+  一旦其 smp_affinity 掩码中列出的所有
+  CPU 都离线，该中断就会被关闭。
-- 
2.54.0

