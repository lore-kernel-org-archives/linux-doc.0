Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EFF1FECBA
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 02:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781402971; cv=none; b=nUrXlx5QyJoIZQIBhGpi6wg/j+d92h+DJ4G6XJGWRpT0smXOmJqGjNMe2IGaM/7zWpYucTyX/7ZVbR/9hZE5QKEJ/nkMNp7+cnAJCwln/Zx8zcRlSVy4BtLMi9RMeqo9TEYirchTDyyWxk8uGYvQ3xeC9lHQFAL3mfu90ZVgdj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781402971; c=relaxed/simple;
	bh=bt/Yu/7GqN4fS8LkyhNPmgcLwaQZz+MqnxcdLy3Icgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uw8rg3VUTMQCTaFVkE3FIIADgM4Ym8zTYRA3AHZLgidPJWOQ5A3udHa1oKcn7j/ZLvvpv/IFXuci0txb4jaQIKobgr1PSh/hH1JREUjsHcaWoO3P/WfJEEn8w7mpj7rEYYHEOiFxtElDZKQNE+GK6vO62fGLHytOV8UM9t6GugI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrACXbTQ4DS5qP8AkAA--.60218S2;
	Sun, 14 Jun 2026 10:08:56 +0800 (CST)
Received: from [172.31.11.49] (unknown [120.236.78.138])
	by gateway (Coremail) with SMTP id _____wDn7+s1DS5qUyceAA--.32418S2;
	Sun, 14 Jun 2026 10:08:55 +0800 (CST)
Message-ID: <0e696373-b521-4b2a-b73e-3dcab08b2315@hust.edu.cn>
Date: Sun, 14 Jun 2026 10:08:53 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
 linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260613183737.11434-1-enelsonmoore@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260613183737.11434-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrACXbTQ4DS5qP8AkAA--.60218S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWUur1xAF1rZryfJr1DJrb_yoW8Gw4Dp3
	9a934Igan2y345KrykGr17Wan7Ka1xG3WrGw1jg3Wvqrn5Zr4kt3Zrtry0grZ3ZryrAFW8
	Xa12qrWayw1ayrUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Ar1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUU0eH3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 6/14/26 2:37 AM, Ethan Nelson-Moore wrote:
> The Simplified Chinese translation of security/self-protection.rst
> contains a typo CONFIG_CONPAT for CONFIG_COMPAT. Fix it.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
> Changes in v2: remove unnecessary information from commit message
>
>   Documentation/translations/zh_CN/security/self-protection.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/security/self-protection.rst b/Documentation/translations/zh_CN/security/self-protection.rst
> index 93de9cee5c1a..ad96bb4a4995 100644
> --- a/Documentation/translations/zh_CN/security/self-protection.rst
> +++ b/Documentation/translations/zh_CN/security/self-protection.rst
> @@ -97,7 +97,7 @@ ARCH_OPTIONAL_KERNEL_RWX时的默认设置。
>   --------------------
>   
>   对于64位系统，一种消除许多系统调用最简单的方法是构建时不启用
> -CONFIG_CONPAT。然而，这种情况通常不可行。
> +CONFIG_COMPAT。然而，这种情况通常不可行。
>   
>   “seccomp”系统为用户空间提供了一种可选功能，提供了一种减少可供
>   运行中进程使用内核入口点数量的方法。这限制了可以访问内核代码

