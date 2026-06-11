Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DB0347FEE
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166429; cv=none; b=sVJoMtHhXyEj56tqtkzBuOB5M28Kx68M3yI94K83ocC8gPuZFqgBu5i2ZKTHrZ3BVD+c2vjFS+QrcANlznE9FqCu8TcRspePlvIAglbfaWnMdFkI3IppiaPMAVx6VjszdXu0JL4l0W9HLIroEp7cxp5LLOZuJG+gcl89fU99AVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166429; c=relaxed/simple;
	bh=6csxml0vDZfUJp/eLnBdqsfGZE+idJUQ517bVscKWyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qI2wlA3QE1FKzRz3sOnfAbiOy15HSGDpWX+ZOBFtaPKDtgbNAK5pVS8d7UUj7qo4PnLdJ5lvwmM398IBpxMSHFLmNKHwU8dnF2cUnU9DGgmGQmctKpFRGwq+7eEhdk0rWoAxV4jMYgC5d83SyMidfJuqkZjmJ+O9m1jfXExf+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAA3DqMxcSpqhH2EAA--.64846S2;
	Thu, 11 Jun 2026 16:26:25 +0800 (CST)
Received: from [192.168.1.27] (unknown [58.19.0.202])
	by gateway (Coremail) with SMTP id _____wBnbwstcSpqwwpCAA--.6687S2;
	Thu, 11 Jun 2026 16:26:24 +0800 (CST)
Message-ID: <e121f878-1c77-4c55-91bd-fbde5a29c0ce@hust.edu.cn>
Date: Thu, 11 Jun 2026 16:26:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/{it_it,sp_SP,zh_CN,zh_TW}: update references to
 removed CONFIG_DEBUG_SLAB
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Avadhut Naik <avadhut.naik@amd.com>,
 linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>, Jonathan Corbet
 <corbet@lwn.net>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>
References: <20260611010014.412841-1-enelsonmoore@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260611010014.412841-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAA3DqMxcSpqhH2EAA--.64846S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGFW8XF4xWw4UAFWUAFW8Zwb_yoWrKryrpF
	10g3WfX3Wktw15GrW2krWkGF95tFy7GFsrZr1xXw1rXrWkJayFkFWqkrZ8CFZ8XryrAay8
	XFZagr1fuF12ywUanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU3YFADUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 6/11/26 9:00 AM, Ethan Nelson-Moore wrote:
> CONFIG_DEBUG_SLAB was removed in commit 2a19be61a651 ("mm/slab: remove
> CONFIG_SLAB from all Kconfig and Makefile"), but references to it
> remained in documentation. The English documentation was updated to
> refer to CONFIG_SLUB_DEBUG in commit 5969fbf30274 ("docs:
> submit-checklist: structure by category"), but these translations were
> never similarly updated. Update them.
>
> Discovered while searching for CONFIG_* symbols referenced in the
> kernel but not defined in any Kconfig file.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>   Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
>   Documentation/translations/sp_SP/process/submit-checklist.rst | 2 +-
>   Documentation/translations/zh_CN/process/submit-checklist.rst | 2 +-
>   Documentation/translations/zh_TW/process/submit-checklist.rst | 2 +-

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

>   4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/translations/it_IT/process/submit-checklist.rst b/Documentation/translations/it_IT/process/submit-checklist.rst
> index 5bf1b4adebc1..c58d773fd297 100644
> --- a/Documentation/translations/it_IT/process/submit-checklist.rst
> +++ b/Documentation/translations/it_IT/process/submit-checklist.rst
> @@ -122,7 +122,7 @@ Verificate il vostro codice
>   
>   1) La patch è stata verificata con le seguenti opzioni abilitate
>      contemporaneamente: ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
> -   ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
> +   ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
>      ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
>      ``CONFIG_PROVE_RCU`` e ``CONFIG_DEBUG_OBJECTS_RCU_HEAD``.
>   
> diff --git a/Documentation/translations/sp_SP/process/submit-checklist.rst b/Documentation/translations/sp_SP/process/submit-checklist.rst
> index e7107cc97001..aedf55eb3b80 100644
> --- a/Documentation/translations/sp_SP/process/submit-checklist.rst
> +++ b/Documentation/translations/sp_SP/process/submit-checklist.rst
> @@ -76,7 +76,7 @@ y en otros lugares con respecto al envío de parches del kernel de Linux.
>       cualquier problema.
>   
>   12) Ha sido probado con ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
> -    ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
> +    ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
>       ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``
>       ``CONFIG_PROVE_RCU`` y ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` todos
>       habilitados simultáneamente.
> diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
> index 0e524f1c1af5..18411b426122 100644
> --- a/Documentation/translations/zh_CN/process/submit-checklist.rst
> +++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
> @@ -65,7 +65,7 @@ Linux内核补丁提交检查单
>       :ref:`kernel-doc <kernel_doc_zh>` 并修复任何问题。
>   
>   12) 通过以下选项同时启用的测试： ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
> -    ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
> +    ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
>       ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
>       ``CONFIG_PROVE_RCU`` 和 ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` 。
>   
> diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
> index a0cb91a6945f..06aa635a659c 100644
> --- a/Documentation/translations/zh_TW/process/submit-checklist.rst
> +++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
> @@ -68,7 +68,7 @@ Linux內核補丁提交檢查單
>       :ref:`kernel-doc <kernel_doc_zh>` 並修復任何問題。
>   
>   12) 通過以下選項同時啓用的測試： ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
> -    ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
> +    ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
>       ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
>       ``CONFIG_PROVE_RCU`` 和 ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` 。
>   

