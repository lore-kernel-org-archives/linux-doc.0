Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8121B277CA5;
	Wed,  3 Dec 2025 04:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764737646; cv=none; b=VtxJ3rDocccT3P8JdM0aYS8QJDg7bfWlXrTaMBzf6l0nhfptUND+zChIv6HOCfqXehWif9jvnS6eVjMiAiHO7vGpp5iK4Z746tt9DqNaD9EUBpTEeFvERvAb4XHcoRaVQUj8xsfJEYMhsysa2ejHd88VAgM/NfcMV0u+bhef4go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764737646; c=relaxed/simple;
	bh=PpHY91uC6qS2wzc2kIKvhJjsJ0LcH5h48gz1zsAHYro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTNBuQuCcnxc8W9NDCVoZLGOGm5w0GOlGB99oYBIK/pDNyPGpeH+ytfPIBJeIm7XTWjdyPRgbXFN9p0/XNuF1YrT8iP9ZZXa2VwmuWFmrCIXLJFGTmFvv3M6XxUJA90WrF8nW13g06e7TJ2wr8KoX3VOcOHLgKN+yvMX1fTxop0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8Cx779Owi9pIZcqAA--.23887S3;
	Wed, 03 Dec 2025 12:53:34 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJDx6sBNwi9p7NpEAQ--.30497S4;
	Wed, 03 Dec 2025 12:53:33 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	peterz@infradead.org,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	maobibo@loongson.cn,
	siyanteng@cqsoftware.com.cn,
	gaosong@loongson.cn,
	yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v7 4/5] irqchip/loongarch-avec.c:return IRQ_SET_MASK_OK_DONE when keep affinity
Date: Wed,  3 Dec 2025 12:53:30 +0800
Message-ID: <20251203045331.33035-3-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20251203045331.33035-1-zhangtianyang@loongson.cn>
References: <20251203045331.33035-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDx6sBNwi9p7NpEAQ--.30497S4
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4UCF4rKF4fAryfuryrXwc_yoW8CF4rpF
	WUCa4qyr4ktFyUWF4DWa18ZFy5Cr95W3y7K3WfC343ZrZ8G3yqgr1Yy34F9FyrCws5C3W2
	qrsFqrW5ua45AagCm3ZEXasCq-sJn29KB7ZKAUJUUUj5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUmYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_GFv_Wryle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y40E4IxF1VCIxcxG6Fyj6r4UJwCY1x0262kKe7AKxVW8ZVWrXwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUPXo2UUUUU

When it is detected in avecintc_set_affinity that the current affinity
remains valid, the return value is modified to IRQ_SET_MASK_OK_DONE.

After the introduction of redirect-domain, for each interrupt source,
avecintc-domain only provides the CPU/interrupt vector, while redirect-domain
provides other operations to synchronize interrupt affinity information
among multiple cores. The original intention is to notify the cascaded
redirect_set_affinity that multi-core synchronization is not required.

However, this introduces some compatibility issues, such as the new return
value causing msi_domain_set_affinity to no longer perform irq_chip_write_msi_msg.
  1) When redirect exist in the system, the msi msg_address and msg_data no
longer changes after the allocation phase, so it does not actually require updating
the MSI message info.
  2) When only avecintc exists in the system, the irq_domain_activate_irq
interface will be responsible for the initial configuration of the MSI message,
which is unconditional. After that, if unnecessary, no modification to the MSI
message is alse correctly.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/irq-loongarch-avec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 514ad8dedc46..ac8c423e411e 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -99,7 +99,7 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
 			return -EBUSY;
 
 		if (cpu_online(adata->cpu) && cpumask_test_cpu(adata->cpu, dest))
-			return 0;
+			return IRQ_SET_MASK_OK_DONE;
 
 		cpumask_and(&intersect_mask, dest, cpu_online_mask);
 
-- 
2.41.0

