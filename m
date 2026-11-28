Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855724;
	b=WIMj4JvHi11Q9nNXe/QLzmEzwbeF148dy1vBSjJ10AI6bcYpefdxx3ay3O2FbCrpz0Px
	 jSM7R+VvGzrrKmloEPuam1340ZpWG2aFITery/eo+m0irSF2Et1yLhMHBin1KL48rcv1P
	 uz+uJqan4nwpqvppRFXDKdpTFgH3HiaSfIW+/D4W75MwbJtBWUB6JdbeO07Pke6vNPaYs
	 yefIsJO77XQYIDp/P1M8X0P0pZ7D4uqvRBSAPq5UKLUn5+svioXsJpxh16AOayZotNEz3
	 6gGKyvxvEnxrTvm978I2uKwgarHoQ2u13emV8AwK/7SBUrnLiz9A1teNVFl8zIXZmWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855724;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=WlsfsJzpASAFAxdaOE2YW2TnoOza7Gq1yuuwvVHXebo=;
	b=BMxxXW02ewsI5f2KiG5NO3fd+J17mk1yXDF0RyoakGeS7hoQXB8Z+c0dSNLvCa1h8mTT
	 mrmYiUUJCxcFqaeA4IOdF9/pRrvuYCP9LsmVZTzuX/IYxijmasWOkT1ah5Bsum4qxcmca
	 BoyWoldkO+yVI5QOw8llsn4YktgyIytLp7l0ZTln61fJEner+E2JeBv2SAxuhRoOQ4j4D
	 is5qFo0rEvY9K8N+QEE+Wx2CeHYxSMRfQU6Kg3t9BN38tfMmBRsWCKxdeskjftyt65MmB
	 53lb2wFEwlxuiUXGLyR/puCYewuLkF5qZyD89qtrOItZyoGPSyKKZDSvJjZ2ehQqv4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1799D606A31C;
	Sat, 28 Nov 2026 08:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1799D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMCmjhFnlQpr5xEKAA--.30758S2;
	Sat, 28 Nov 2026 16:48:39 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCHcDZklQprvGB_AA--.14773S2;
	Sat, 28 Nov 2026 16:48:37 +0800 (CST)
Message-ID: <948a8c4c-8899-4393-ab14-eb6eaebb4177@hust.edu.cn>
Date: Sat, 28 Nov 2026 16:48:35 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: Add core-api/irq managed_irq Chinese
 translation
To: Zixin Wang <w1355457260@gmail.com>, linux-doc@vger.kernel.org
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 chao.liu@processmission.com, zenghui.yu@linux.dev,
 linux-kernel@vger.kernel.org
References: <20261120160539.103773-1-w1355457260@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261120160539.103773-1-w1355457260@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMCmjhFnlQpr5xEKAA--.30758S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3WrWDGr47ZF1rCw1fJF18Xwb_yoW3AryDpF
	sakryxWF1rAr90vrs7WF18ZFyxGa93WasrG3WxJ3Z2vFyvqrW2vr4Yyry3GrWxGryFyFWD
	ZFWYqFWSyrWayFDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/21/26 12:05 AM, Zixin Wang wrote:
> Translate Documentation/core-api/irq/managed_irq.rst into Chinese
> and add it to the zh_CN irq toctree.
>
> Update the translation through commit bb6a85b4b652
> ("Documentation: Add managed interrupts")
>
> Co-developed-by: Chao Liu <chao.liu@processmission.com>
> Signed-off-by: Chao Liu <chao.liu@processmission.com>
> Signed-off-by: Zixin Wang <w1355457260@gmail.com>
> ---
> Thanks Zenghui for the review.
>
> v1 -> v2:
>    - Use a Co-developed-by/Signed-off-by pair for Chao Liu and keep the
>      author's Signed-off-by last, as suggested by Zenghui Yu.
>    - Reflow the translation to use the available width more evenly.
>
> Testing:
>    make SPHINXDIRS="translations/zh_CN" htmldocs and checkpatch.pl pass.
>
>   .../translations/zh_CN/core-api/irq/index.rst |   1 +
>   .../zh_CN/core-api/irq/managed_irq.rst        | 107 ++++++++++++++++++
>   2 files changed, 108 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/irq/index.rst b/Documentation/translations/zh_CN/core-api/irq/index.rst
> index ba6acc4..7951d69 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/index.rst
> @@ -20,3 +20,4 @@ IRQs
>      irq-affinity
>      irq-domain
>      irqflags-tracing
> +   managed_irq
> diff --git a/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst b/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
> new file mode 100644
> index 0000000..b1b7918
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
> @@ -0,0 +1,107 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/irq/managed_irq.rst
> +
> +:翻译:
> +
> + Zixin Wang <w1355457260@gmail.com>
> +
> +.. _cn_managed_irq.rst:


Nit: The English source has no corresponding label, and this label is 
not referenced. Please remove it.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Dongliang Mu


> +
> +=============================
> +亲和性托管中断（managed IRQ）
> +=============================
> +
> +IRQ core 支持按指定 CPU 亲和性管理中断。正常运行时，每个中断关联到
> +某个特定的 CPU。如果该 CPU 离线，中断会被迁移到另一个在线 CPU。
> +
> +中断向量很多时，设备可能给可用的向量空间带来压力。例如，一块带 128 个
> +I/O 队列的 NVMe 设备，在至少有 128 个 CPU 的系统中，通常每个队列请求
> +一个中断。两个这样的设备就会请求 256 个中断。在 x86 上，中断向量空间
> +出了名地少：每个 CPU 只有 256 个向量，内核还要保留其中一部分，从而进一步
> +减少可供设备中断使用的数量。实际使用中通常没有问题，因为中断分散在许多
> +CPU 上，每个 CPU 只分到少量向量。
> +
> +然而在系统挂起时，所有次级 CPU 都会离线，所有中断都被迁移到唯一保持在线
> +的那个 CPU 上。这可能会耗尽该 CPU 上可用的中断向量，从而导致挂起操作失败。
> +
> +亲和性托管（affinity-managed）中断应对了这一限制。每个中断都分配一个
> +CPU 亲和性掩码，指定该中断可以定向到的 CPU 集合。当掩码中的某个 CPU 离线
> +时，中断会移到掩码中的下一个 CPU。如果掩码中的最后一个 CPU 也离线，那么
> +该中断会被关闭。使用亲和性托管中断的驱动程序必须确保，在中断被禁用之前
> +关联的队列已处于静默（quiesced）状态，以免再产生新的中断。当亲和性掩码
> +中的某个 CPU 重新上线时，中断会被重新使能。
> +
> +实现
> +----
> +
> +设备必须提供按实例划分的中断，例如 NVMe 等存储设备的按 I/O 队列中断。
> +驱动程序使用 struct irq_affinity 按所需的亲和性设置分配中断向量。对于
> +MSI-X 设备，需要设置 PCI_IRQ_AFFINITY 标志并调用
> +pci_alloc_irq_vectors_affinity() 来完成。
> +
> +IRQ core 会根据提供的亲和性信息，尽量在整个系统上均匀分散中断。亲和性
> +掩码在这一分配阶段计算，但最终的 IRQ 分配是在调用 request_irq() 时完成的。
> +
> +隔离 CPU
> +--------
> +
> +托管中断的亲和性完全由内核处理，无法通过 /proc 接口从用户空间修改。
> +isolcpus 启动选项的 managed_irq 子参数可指定一个 CPU 掩码，托管中断会
> +尽量避开这些 CPU。这种隔离是尽力而为的：只有当自动分配的掩码中也包含
> +被避开掩码之外的在线 CPU 时才会生效。如果请求的掩码只包含隔离 CPU，
> +该设置就没有任何效果。
> +
> +被避开掩码中的 CPU 仍属于该中断的亲和性掩码。也就是说，如果所有非隔离
> +CPU 都离线、而隔离 CPU 仍在线，中断就会被分配到某个隔离 CPU 上。
> +
> +以下示例假设系统有 8 个 CPU。
> +
> +- 使用 "-device virtio-scsi-pci" 启动一个 QEMU 实例。该 MSI-X 设备会
> +  暴露 11 个中断：3 个“管理”中断和 8 个“队列”中断。驱动程序请求这 8 个
> +  队列中断，每个中断恰好亲和到一个 CPU。如果该 CPU 离线，该中断就会被
> +  关闭。
> +
> +  假设中断 48 是其中一个队列中断，那么会看到::
> +
> +    /proc/irq/48/effective_affinity_list:7
> +    /proc/irq/48/smp_affinity_list:7
> +
> +  这表明该中断只由 CPU7 服务。关闭 CPU7 并不会把中断迁移到其他 CPU::
> +
> +    /proc/irq/48/effective_affinity_list:0
> +    /proc/irq/48/smp_affinity_list:7
> +
> +  可以通过 debugfs 接口 (/sys/kernel/debug/irq/irqs/48) 验证这一点。
> +  dstate 字段会包含 IRQD_IRQ_DISABLED、IRQD_IRQ_MASKED 和
> +  IRQD_MANAGED_SHUTDOWN。
> +
> +- 使用以下参数启动 QEMU 实例：
> +  "-device virtio-scsi-pci,num_queues=2"
> +  并在内核命令行中加入：
> +  "irqaffinity=0,1 isolcpus=domain,2-7 isolcpus=managed_irq,1-3,5-7"。
> +  该 MSI-X 设备会暴露 5 个中断：3 个管理中断和 2 个队列中断。管理中断
> +  遵循 irqaffinity= 设置。队列中断分散到可用的 CPU 上::
> +
> +    /proc/irq/47/effective_affinity_list:0
> +    /proc/irq/47/smp_affinity_list:0-3
> +    /proc/irq/48/effective_affinity_list:4
> +    /proc/irq/48/smp_affinity_list:4-7
> +
> +  这两个队列中断被均匀分配。中断 48 落在 CPU4 上，因为 managed_irq
> +  掩码会尽可能避开 CPU 5-7。
> +
> +  将 managed_irq 参数换成
> +  "isolcpus=managed_irq,1-3,4-5,7" 后，结果是::
> +
> +    /proc/irq/48/effective_affinity_list:6
> +    /proc/irq/48/smp_affinity_list:4-7
> +
> +  此时中断 48 由 CPU6 服务，因为系统避开了 CPU 4、5 和 7。如果 CPU6
> +  离线，中断会迁移到某个“隔离”CPU::
> +
> +    /proc/irq/48/effective_affinity_list:7
> +    /proc/irq/48/smp_affinity_list:4-7
> +
> +  一旦其 smp_affinity 掩码中列出的所有 CPU 都离线，该中断就会被关闭。

