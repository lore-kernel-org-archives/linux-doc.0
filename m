Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857462;
	b=5gB9aBJzXwZroQvMOEC3U1N68/wCvIzKUSX9hq4q7+xi8Abst/v8/kXe1hUoDxbJHo9V
	 ROsbyllI6+ToD6AaRbwXo4WLl6nfPk0qMpC9/9opi7Ty0u8swJKX/FSoSyP9MC9S+RmIF
	 D1B0TxRvC2FguAowAiW5I27GAcYt6Z7d5P01zFWkoc7RzfbqNEuTh3TgTpPQxVZVdmbLw
	 ZvNe4IkRkwu/8WwwigjQoWLiiGsD6LClnYRXin2TQtDI9bXtb7cAxlw/EPFPdnWWS3szi
	 kjuTxHosNjOnVbg30cPAmu/wHFFrFPGb8g2MNLrIeSK6QJpOhyacZ/78X0P1DNJJCmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wODeX8UGG2nsP7YgHIYYXfSoLShUg5hSO53xE9MKRLY=;
	b=Qb1wilREFIajvXM4DHeMTpkH0TxJgaKdc5Lh1GGYkHzs/Idp+IhvstXU9rNxnHtFOcp6
	 JvXL4vor5iAEI3u9QOp2eq1+lMxZVSeBq5ZhWDCfbXqVJsaUcRVXRYYl2DZvlY1pf18CD
	 fY4C7URS3Lue4oPEpMEbppxQqth+RetJrKAcVMeGQcoZgxdAexcSry9F2NUSe+WGhQLQp
	 +WaQU2PTDNDgKuctZSfMmZuN7ag2pT5OxCf//BG520YVYuNDNKeUdW3MQbG6sKxjpYu5n
	 HgUKNsBwYcWAraNuc1MXdwS9W+kz5/T8WbB4aKN1VObMMWPx2PDTWoGkrxUFSj/S+3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iM++7f5S;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADEF606A321
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 09:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADEF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iM++7f5S
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2ed408b0d0bso49832735ad.0
        for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 01:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795857461; x=1796462261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wODeX8UGG2nsP7YgHIYYXfSoLShUg5hSO53xE9MKRLY=;
        b=iM++7f5SckGbMp9iLAhCTg04j2G6NKokyDFpe+h61fk9dsemXjjDyvUUP0RgMSdIpn
         fDcejAyfhUkgxdvuWGqay7TRZB91GrzKbdjl6r+gshE5Rxl4DN2UDrT1oHa/LL/GUTLJ
         T5bj0fjv45I2qrRyVSVN38R8LwZzhHskcj6LNO/hamfMLLOMcgoEZOwdn67HCZGuakFf
         3ZWRUu3RngHO0nN0is3DomX0HS8UyehMTZzttdEFe5Y3cKPCrrLcwsUwFxSIM2+qrHsJ
         GFKlN2KKgq8ywbSKlcMswxMoXYqixEX6oT3eolzJMKerukcPXe5I1PrTEe3TcptagjFf
         6Nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857461; x=1796462261;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wODeX8UGG2nsP7YgHIYYXfSoLShUg5hSO53xE9MKRLY=;
        b=hlkPpPMb8+5KcLEzlEAlWVO41S5oXsoPQFr7oShlifKvyhRd0tf0aKI8kj8kZwps8V
         Zp5CdLONg/ZMtZqgVehdmvCWlw/dr8BpG7usK0xfOkDrXp2MTgxMRK86Ej6e48ck4fvS
         Rd83MNCNy04FYRHPuQdxJZlunrGK0lHDz4r7Yg+cSIcrpfV46lYHFC/dt/U4g2Nb9WDL
         JcLUzSleFWAe9EMCQ3jU6TKWC5wskwUaN3XNpGJOC1x9GI8GCLCQmd7JJ/L9O+bjIIVT
         MSEnLrX8X6UwMzVKq6ceQ6o0GTEzBoqoZh9YFUzCyJ2nxkJPLh+a+UCkHMUTlPPh9aoR
         J8RQ==
X-Gm-Message-State: APuU4Z8ozGRz5V0zPl/G/TXFzDjD1GNzO56c4ikFj0c9lCWVH2EkUeyT
	SF6j9NhjMnFJqPK6MhVOZM0/tk4Z1Wv3F8zHMql6vuGrmUdsBuKGxbZnSP5WFYh53wna6g==
X-Gm-Gg: AZFdTZcAEl2LPBT6RNtFC6E4ron3UcfQZMw9WEWTJbDfVgtnfsW0urFFh6WM9HhaWjY
	pRhNz1y9ODnn9JlVk0l98qby1NNsA+JijYzN21X3WDDUdRGCS+R/WLzCaSiNHGukI0gQZ+qce7Q
	7o8garHR8buCRx/tuOBRZUq7pKO4G9CPAARd0SqqWmXgrBjsyjK6E1Ttmogc9lOikvn8IM4Pu88
	fAnVB2fvTmGm1uJg8y5jzvxtgl1KutJd9GlDxv074VsY60ojRoaFtqQNCMPXjaw6tb+jzWSFPyz
	YLdSM/P4f7xJdhBUX/dviv72ZAbn156CdNTQ8MjaC7Br6s+vTmXQLZMrAZ4IRJwxoD7kcrp3n9+
	eMN2XJ3mZUeT2WZn4YiOCDcdSNbbEj4es1s8SbDTb51hFp/99IcaMFTg+OLBFTJto6X4wq63kbt
	rgtsAcDI+wUVvvB6YDD/utRpM3Xiu+m0jdcLZV665oC1U4BAgEqE0vVXtoCELZT0RmNvLamrzts
	cTVRqLcszWRvhzEu0h5I2785161wX8v8Uyjp6qXO0sHOZKf+nxT5DpGgagMrLPITJ3qPUknG4Gj
	hM0Fw9ylhGT7HFgcWHYkp2gTFDB4Y1LB2TZCG+IVeIBzBFI=
X-Received: by 2002:a17:902:da81:b0:2ed:cab:e973 with SMTP id d9443c01a7336-2f03f0fbd8dmr290159125ad.13.1795857461054;
        Sat, 28 Nov 2026 01:17:41 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:c549:2fb1:e189:bced])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08164dacbsm103309195ad.68.2026.11.28.01.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:17:39 -0800 (PST)
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
Subject: [PATCH v3] docs/zh_CN: Add core-api/irq managed_irq Chinese translation
Date: Sat, 28 Nov 2026 09:17:23 +0000
Message-ID: <20261128091723.983803-1-w1355457260@gmail.com>
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
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
v2 -> v3:
  - Remove the unused cn_managed_irq.rst label, as suggested by
    Dongliang Mu.
---
 .../translations/zh_CN/core-api/irq/index.rst |   1 +
 .../zh_CN/core-api/irq/managed_irq.rst        | 105 ++++++++++++++++++
 2 files changed, 106 insertions(+)
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
index 0000000..c83eae3
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
@@ -0,0 +1,105 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/irq/managed_irq.rst
+
+:翻译:
+
+ Zixin Wang <w1355457260@gmail.com>
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

