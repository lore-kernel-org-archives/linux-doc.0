Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.168.213])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDD119004A;
	Sat, 23 May 2026 00:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.229.168.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779496972; cv=none; b=QPQdboyaG0Dh811djaLr7v4Wa0HEFTDpr1Rn9XPUpDDI2UOi+fAuB8eKwvprp873+6nG98o4ockD17B6TPlknDWJXhgoAIR1UByt3m/E3pvLhOgsr0v5ktHKe2VmfloetyOumameU+dhu5NxrrmN3kiR+lSaPEu1LM34BLoW3Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779496972; c=relaxed/simple;
	bh=ML2p/Ei+1Q25hfOV6GohW1OIlNKUOsjWXTvkxK+e1Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilTAY86YtlMRPtj7G4mQYvNoCzlNIipMQDu9Ji2eODyrzABIZTud4eshQFKAMHTkbZqR9RnnVRLRGyY77IRsoEUvQ6pqSdT8P4Kg3BhC2+BRil4QzW4OvmfsOZItjebjAGTGTPyO+Pop1RFPUFS0tXMyJF/tlLjaq0ovl7/J+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.229.168.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrABH+Djn9xBqIfZAAQ--.27933S2;
	Sat, 23 May 2026 08:42:15 +0800 (CST)
Received: from [192.168.43.158] (unknown [114.246.238.26])
	by gateway (Coremail) with SMTP id _____wD379bk9xBqdRFaAQ--.26340S2;
	Sat, 23 May 2026 08:42:14 +0800 (CST)
Message-ID: <b67b9d63-7cc7-460a-ada3-630c8686e1e1@hust.edu.cn>
Date: Sat, 23 May 2026 08:42:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: fix KASAN SW_TAGS mode description
To: chengyaqiang <chengyaqiang@chengyaqiang.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, chengyaqiang@tsinghua.edu.cn
References: <20260522075735.2022734-1-chengyaqiang@chengyaqiang.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260522075735.2022734-1-chengyaqiang@chengyaqiang.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrABH+Djn9xBqIfZAAQ--.27933S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar45Cw18Jr48AryxtF43Jrb_yoW8AF47pF
	y8CrWIyFn2vr15GrW8GF4DCr1UGF1fGFW5GFnxXa4Yqrs5A39Yyr1Ykr9FqF97uwn3AFWj
	yF4Skr9IvFWDA3JanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 5/22/26 3:57 PM, chengyaqiang wrote:
> From: chengyaqiang <chengyaqiang@tsinghua.edu.cn>
>
> CONFIG_KASAN_SW_TAGS enables Software Tag-Based KASAN mode, not Hardware
> Tag-Based mode. Fix the incorrect translation in the Chinese documentation.
>
> The original text incorrectly described both CONFIG_KASAN_SW_TAGS and
> CONFIG_KASAN_HW_TAGS as "基于硬件标签" (hardware tag-based).  Correct
> CONFIG_KASAN_SW_TAGS to "基于软件标签" (software tag-based).
>
> Signed-off-by: chengyaqiang <chengyaqiang@tsinghua.edu.cn>

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>


BTW, @yanteng shall we need to mention this situation in our how-to.rst 
since this is the problem of Chinese translation?

Dongliang Mu

> ---
>   Documentation/translations/zh_CN/dev-tools/kasan.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
> index fd2e3afbdfad..767b280d8af0 100644
> --- a/Documentation/translations/zh_CN/dev-tools/kasan.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
> @@ -79,7 +79,7 @@ KASAN只支持SLUB。
>   	  CONFIG_KASAN=y
>   
>   同时在 ``CONFIG_KASAN_GENERIC`` (启用通用KASAN模式)， ``CONFIG_KASAN_SW_TAGS``
> -(启用基于硬件标签的KASAN模式)，和 ``CONFIG_KASAN_HW_TAGS`` (启用基于硬件标签
> +(启用基于软件标签的KASAN模式)，和 ``CONFIG_KASAN_HW_TAGS`` (启用基于硬件标签
>   的KASAN模式)之间进行选择。
>   
>   对于软件模式，还可以在 ``CONFIG_KASAN_OUTLINE`` 和 ``CONFIG_KASAN_INLINE``

