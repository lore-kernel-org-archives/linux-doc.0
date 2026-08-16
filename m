Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313C434BA24;
	Sun, 16 Aug 2026 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786891824; cv=none; b=tb9oMJjNBrCaH4ZP8tI8icLBfo7OyAgQE5WzAInjZl/nvPVxVvdJBKmTmCTeZ5SgAiER6rZxxGYP0NYUp5CrgJilOO8v2iDGUMXykScC5KyxC4T0GdpK/+ko8bONebrWO1q7YUuKTEViTTZvRoginzBLyS6Ga1E/zZTI+KrWR7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786891824; c=relaxed/simple;
	bh=+5tHv+2vTK9OSPiGkQDuyA0cAryxstfAWUgMewLcAZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeQmi5fuep/J+0s+0q5NIzDwscCxy1htqQSwXe2jX917ycx5/dK/2qrORZzKdTyK3AUYri0pEDAecd/FRiIgR+mHwY1E8v1SQtMzzvLLS0CeASne0bUywpdby2/roUYgI/bcN1+S5KKoQkp15pUC7auWj8szs5pb+0G5o9ZyGgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAAnLysNzoFq7BN5Aw--.10213S2;
	Sun, 16 Aug 2026 22:49:49 +0800 (CST)
Received: from [198.18.0.1] (unknown [58.19.0.248])
	by gateway (Coremail) with SMTP id _____wAXks4IzoFql_xFAQ--.5064S2;
	Sun, 16 Aug 2026 22:49:47 +0800 (CST)
Message-ID: <4f6ab067-ed85-4dff-acd8-16c4b4b61fe8@hust.edu.cn>
Date: Sun, 16 Aug 2026 22:49:44 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] docs/zh_CN: translate process/applying-patches.rst
 into Chinese
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260815-apply-patches-v2-0-3fdd873d31cc@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260815-apply-patches-v2-0-3fdd873d31cc@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAnLysNzoFq7BN5Aw--.10213S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4ktF18ZrykuF1DWr1Utrb_yoW5ZFy8pF
	n3Kr1fGa1xAr15G34xG3yxXF1rZF1xGa9rtr1xt3sayF1YyF1Iyr98tr9F9FW7Ww1Fg3W7
	XF45KrW8WF17ZFJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jhiSdUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/15/26 1:59 PM, Weijie Yuan wrote:
> Translate Documentation/process/applying-patches.rst into Chinese.
>
> This series adds the Chinese translation to the zh_CN process
> toctree and updates existing zh_CN references to link to it.
>
> ---
> Changes in v2:
> - Merges first two patches into one.
> - Removes self-ref (.. _cn.rst) and changes ref style from 'ref' to
>    direct file name
> - Link to v1: https://patch.msgid.link/cover.1784289654.git.wy@wyuan.org

Please resolve the following warnings in the compilation:

Documentation/translations/zh_CN/admin-guide/README.rst: WARNING: 
undefined label: 'cn_applying_patches' [ref.ref] 
Documentation/translations/zh_CN/process/howto.rst:145: WARNING: 
undefined label: 'cn_applying_patches' [ref.ref]

Dongliang Mu

> ---
> Weijie Yuan (2):
>        docs/zh_CN: add process/applying-patches Chinese translation
>        docs/zh_CN: link to Chinese applying-patches translation
>
>   .../translations/zh_CN/admin-guide/README.rst      |   2 +-
>   .../zh_CN/process/applying-patches.rst             | 390 +++++++++++++++++++++
>   Documentation/translations/zh_CN/process/howto.rst |   2 +-
>   Documentation/translations/zh_CN/process/index.rst |   2 +-
>   4 files changed, 393 insertions(+), 3 deletions(-)
>
> Range-diff versus v1:
>
> 1:  d90aac81d39b ! 1:  68ed0ce67ffa docs/zh_CN: add process/applying-patches Chinese translation
>      @@ Metadata
>        ## Commit message ##
>           docs/zh_CN: add process/applying-patches Chinese translation
>       
>      -    Translate .../process/applying-patches.rst into Chinese.
>      +    Translate process/applying-patches.rst into Chinese, and update
>      +    the toctree.
>       
>           Update the translation through commit fa04150b8ef7
>           ("Documentation: describe how to apply incremental stable patches")
>      @@ Documentation/translations/zh_CN/process/applying-patches.rst (new)
>       +
>       +.. include:: ../disclaimer-zh_CN.rst
>       +
>      -+.. _cn_applying_patches:
>      -+
>      -+:Original: :ref:`Applying Patches To The Linux Kernel <applying_patches>`
>      ++:Original: Documentation/process/applying-patches.rst
>       +
>       +:翻译:
>       +
>      @@ Documentation/translations/zh_CN/process/applying-patches.rst (new)
>       +感谢 Randy Dunlap、Rolf Eike Beer、Linus Torvalds、Bodo Eggert、
>       +Johannes Stezenbach、Grant Coady、Pavel Machek，以及其他可能被我
>       +遗漏的人，感谢他们对本文档的审阅和贡献。
>      +
>      + ## Documentation/translations/zh_CN/process/index.rst ##
>      +@@ Documentation/translations/zh_CN/process/index.rst: TODOLIST:
>      +    :maxdepth: 1
>      +
>      +    magic-number
>      ++   applying-patches
>      +    volatile-considered-harmful
>      +    ../arch/riscv/patch-acceptance
>      +    ../core-api/unaligned-memory-access
>      +
>      + TODOLIST:
>      +
>      +-* applying-patches
>      + * backporting
>      + * adding-syscalls
>      + * botching-up-ioctls
> 2:  5f0e700f6a49 < -:  ------------ docs/zh_CN: add applying-patches to process index
> 3:  a3d20af74d63 = 2:  0af282ad0e01 docs/zh_CN: link to Chinese applying-patches translation
>
> ---
> base-commit: 1a0364f09c1311dad5ad1ccba7e169a412f6b547
> change-id: 20260815-apply-patches-601ad9b42f27

