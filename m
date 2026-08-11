Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D770E2F616A;
	Tue, 11 Aug 2026 04:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421381; cv=none; b=VfMU0ceI8twOiI1ovBRPWh/GtPklC+/iIO8MkYygoQz3O4hR37wLgO1N8L79Aw4XKriKfvdKyHJpANh+MtjFlA55JAbQzRF8pBQDfK4Ol/c2RKMe6P2FvuKAv25GRSBnZwPadxW1FTIFUGevV8I8MOdb4cQDGuD3+/tsBCkh24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421381; c=relaxed/simple;
	bh=Q5XVaZSkqfmjFAVnWl4fG2ixczECIvapq358RUeTxRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fV6evhqVmcRx0dzVxwEmZMq31LzwW/oDi9gCDzTcVLT04SraLe2YUspsEAvzN0UsUgFPbcUHetS6oj5p8as/9ZoyrrboQzr7f110LOPP2yC3C8encVmpTaITx6FJL7h/jYiz7pbFAgZAB0A/WM0CTZXAhJA+lnuISkLZ2vmI/zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrACXn7NZoHpqw3ymAA--.26398S2;
	Tue, 11 Aug 2026 12:08:57 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCHUlZXoHpqzxQ7AA--.50602S2;
	Tue, 11 Aug 2026 12:08:56 +0800 (CST)
Message-ID: <e1eb07d6-9da6-4936-aaac-e12889886e90@hust.edu.cn>
Date: Tue, 11 Aug 2026 12:08:55 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] docs/zh_CN: Add LSM/SeLinux secid Chinese
 translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260727073538.56951-1-anka@stu.cdut.edu.cn>
 <20260727073538.56951-6-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260727073538.56951-6-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrACXn7NZoHpqw3ymAA--.26398S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxZw17uF4UZr1kArW7GF4xCrg_yoW5Wr47pF
	1DKrWfAF4fWr1xt39xGr17Gw15JF4xua15Gr17X3ZYqr95JanYkrnrKryDKrWxKrW8AFWa
	qa1rKrW5WF40k3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQjb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Cr
	1j6rxdMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20x
	vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07U9VyxUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/27/26 3:35 PM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/secid.rst into Chinese.
>
> Update the translation through commit de1fd4a7b0f2
> ("docs: networking: convert secid.txt to ReST")
>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
> ---
>   .../translations/zh_CN/networking/index.rst   |  2 +-
>   .../translations/zh_CN/networking/secid.rst   | 24 +++++++++++++++++++
>   2 files changed, 25 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index cd768d0a2837..bf22d22b64db 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -24,6 +24,7 @@
>      driver
>      ipv6
>      napi
> +   secid
>      vxlan
>      netif-msg
>      xfrm_proc
> @@ -126,7 +127,6 @@ Todolist:
>   *   representors
>   *   rxrpc
>   *   sctp
> -*   secid
>   *   seg6-sysctl
>   *   smc-sysctl
>   *   statistics
> diff --git a/Documentation/translations/zh_CN/networking/secid.rst b/Documentation/translations/zh_CN/networking/secid.rst
> new file mode 100644
> index 000000000000..0168feddcc3d
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/secid.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/secid.rst
> +
> +:翻译:
> +
> +	陈思为 Siwei Chen <businiaoanka@anka1.top>
> +
> +=================
> +LSM/SELinux secid
> +=================
> +
> +flowi 结构体：
> +
> +flow 结构体中的 secid 成员在 LSM（如 SELinux）中用于表示该流的标签。
> +该流的标签目前用于选择相匹配的带标签 xfrm。
> +
> +若为出向流，标签派生自套接字（若有），或派生自本流作为响应而生成的入站报文
> +（如 TCP 复位、timewait ACK 等）。在特殊情况下，也可酌情让标签派生自其他
> +来源，如进程上下文、设备等。

If this is an outbound flow, the label is derived from the socket, if any, or
the incoming packet this flow is being generated as a response to (e.g. tcp
resets, timewait ack, etc.).

Suggested translation:

若为出向流，标签派生自套接字（若有）；如果该流是为响应某个入站报文而生成的，则标签派生自相应的入站报文（例如 
TCP 复位、

timewait ACK 等）。

Dongliang Mu

> +
> +若为入向流，标签派生自报文所使用的 IPSec 安全关联（若存在）。

