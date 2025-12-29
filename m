Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F45D19258E;
	Mon, 29 Dec 2025 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766993868; cv=none; b=U8cRC5lovp+dtxHdZ3yVbKgfsubQ5j7Dnjh/wYk9YGbgm5pM51kM5VvMnlO1V7Rgj1tGciS1N3/6ZaVxTx9YD2l6L2lP6QsXOqUyi62x+LaWUSxfm1TBHWOo0YNiZ/FszbC5axdSqJS5g9aReJGPGWotM3K3MStXZeP81uM39FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766993868; c=relaxed/simple;
	bh=jhMGQh+lyibylcZkWKbi0r6uYL7gTyQI56Sp9qNMmO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AmJLRUg6S0XQg9WyOWc1LJooZQ3Yf+s13cxM4U7WlcF6GH31Is8roPCK1IHD2zCGGP1DG9+RIWoVHtlznbQ9jUn9eQ06qIXxVGHiA5Glgp0lB8JUguKobrtAnfbyXHTg2841AX6ehBBk9YVavwtOkKVRTIw1klOV58RsHqfwHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAAn2DiJL1JpFywcAA--.52233S2;
	Mon, 29 Dec 2025 15:36:41 +0800 (CST)
Received: from [10.12.168.90] (unknown [10.12.168.90])
	by gateway (Coremail) with SMTP id _____wAHzhyIL1JpucYnAA--.15492S2;
	Mon, 29 Dec 2025 15:36:41 +0800 (CST)
Message-ID: <d6e73d89-c86e-44c9-ab40-9fc5cd31713e@hust.edu.cn>
Date: Mon, 29 Dec 2025 15:36:40 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] docs/zh_CN: Add timers directory Chinese translation
To: Xingqiu Xu <hilbertanjou83@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1766099040.git.hilbertanjou83@gmail.com>
 <e6efa01104fb4476abbee4e4b4fe4f6bb99464f7.1766099040.git.hilbertanjou83@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <e6efa01104fb4476abbee4e4b4fe4f6bb99464f7.1766099040.git.hilbertanjou83@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAn2DiJL1JpFywcAA--.52233S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxWrWfurWUtr47JrWfWr47CFg_yoW5tFWfpr
	1fGr1fKa12yryUCw17Gry2qF1rGF18JayUJr1Utwn5JF4DAFs7Jr4UtFyIgFWUJryrAa47
	XF4rKF45WryUC3DanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jfpndUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 12/19/25 7:16 AM, Xingqiu Xu wrote:
> Translate Documentation/timers/ into Chinese and update subsystem-apis.rst
> translation.
>
> Update the translation through commit 1f455f601e20
> ("timers/Documentation: Cleanup delay/sleep documentation")

Please fix the following errors and send a v2 patch.

-----------------------------------------------------------------------------------------------------------------------

$ git am 
./20251219_hilbertanjou83_docs_zh_cn_add_timers_subsystem_translation.mbx
Applying: docs/zh_CN: Add timers directory Chinese translation
.git/rebase-apply/patch:61: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: docs/zh_CN: Translate timers/timekeeping.rst
.git/rebase-apply/patch:235: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: docs/zh_CN: Translate timers/hpet.rst
.git/rebase-apply/patch:56: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: docs/zh_CN: Translate timers/hrtimers.rst
.git/rebase-apply/patch:200: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: docs/zh_CN: Translate timers/highres.rst
.git/rebase-apply/patch:283: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: docs/zh_CN: Translate timers/no_hz.rst
.git/rebase-apply/patch:367: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: docs/zh_CN: Translate timers delay_sleep_functions
.git/rebase-apply/patch:148: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

-----------------------------------------------------------------------------------------------------------------------

Seems like I am not on the receipts of cover letter. So I directly 
comment on this PATCH 1/7.

Dongliang Mu

> Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
> ---
>   .../translations/zh_CN/subsystem-apis.rst     |  5 +--
>   .../translations/zh_CN/timers/index.rst       | 33 +++++++++++++++++++
>   2 files changed, 34 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/timers/index.rst
>
> diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
> index 830217140fb6..f6445e256ee9 100644
> --- a/Documentation/translations/zh_CN/subsystem-apis.rst
> +++ b/Documentation/translations/zh_CN/subsystem-apis.rst
> @@ -29,10 +29,7 @@
>      power/index
>      scheduler/index
>      locking/index
> -
> -TODOList:
> -
> -* timers/index
> +   timers/index
>   
>   人机接口
>   --------
> diff --git a/Documentation/translations/zh_CN/timers/index.rst b/Documentation/translations/zh_CN/timers/index.rst
> new file mode 100644
> index 000000000000..55286759a04a
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/timers/index.rst
> @@ -0,0 +1,33 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/timers/index.rst
> +
> +:翻译:
> +
> +  徐兴球 Xingqiu Xu <hilbertanjou83@gmail.com>
> +
> +======
> +定时器
> +======
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +TODOList:
> +
> +* highres
> +* hpet
> +* hrtimers
> +* no_hz
> +* timekeeping
> +* delay_sleep_functions
> +
> +.. only::  subproject and html
> +
> +   索引
> +   ====
> +
> +   * :ref:`genindex`
> +

