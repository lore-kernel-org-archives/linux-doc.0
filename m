Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488D732E68D;
	Sun, 16 Aug 2026 09:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786873043; cv=none; b=AOJ21x6cBiiwXyh3jlxDJi/WvF870tjJPkwyznq4VNL9hcp8wBxUPXydMYsLnEZOe1yURiSmcoPZgNniX/tUcgbAAfsOh3Bux8XPoof/G8uaxkM+vvRJdEJD6PCOuBs3+2pOlArMax3W7IXJlEWlgX+0rB/wdsh4x1gjjGQMl/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786873043; c=relaxed/simple;
	bh=ql0lOs5KkOSe2qjFchSxafQvyfy74N65EvXKmwlWuco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thWGceymvHi9O2s/3hZ9sD/GiIqmn39mZg4Ic4Tw62by+0JuOy/JesfnDL9z6GXD/K3xAI0XafZxTtAEppdrYmv8R/asqiKj/xJpDyPojxrkptllOahE8Lo4/UGvnZ5H0urFc2eyrDm2Ggg/4FH+NNc06FuDQXp1Kpjmtd1TNVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAAX7qKPhIFqHyZ3Aw--.10960S2;
	Sun, 16 Aug 2026 17:36:15 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wD3cc6OhIFqlBtFAQ--.16036S2;
	Sun, 16 Aug 2026 17:36:14 +0800 (CST)
Message-ID: <e98bd534-4496-433f-9847-2c5040ecd315@hust.edu.cn>
Date: Sun, 16 Aug 2026 17:36:13 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] docs/zh_CN: Add LSM/SeLinux secid Chinese
 translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260811071200.54062-1-anka@stu.cdut.edu.cn>
 <20260811071200.54062-6-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260811071200.54062-6-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAX7qKPhIFqHyZ3Aw--.10960S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF47Wr47Ar1UKrWxZr4rAFb_yoW5Jr1fpF
	n5KryfCa1xWr17t39rGr17Gw15AF4xuw45Gr1xX3ZYqr95JF4kKrnrKrWqkrWxKrWIyFWa
	vF4rKrW5WFW0k3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/11/26 3:11 PM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/secid.rst into Chinese.
Nitpick: SeLinux -> SELinux
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
> index 000000000000..c6ec07e1759c
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
> +若为出向流，标签派生自套接字（若有）；如果该流是为响应某个入站报文而生成的，
> +则标签派生自相应的入站报文（例如 TCP 复位、timewait ACK 等）。
> +在特殊情况下，也可酌情让标签派生自其他来源，如进程上下文、设备等。
> +
> +若为入向流，标签派生自报文所使用的 IPSec 安全关联（若存在）。

