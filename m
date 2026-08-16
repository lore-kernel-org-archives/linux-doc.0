Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556EE3D4130;
	Sun, 16 Aug 2026 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786872931; cv=none; b=NZb3LKtPjtelbL7pAy/MkOOfAFBIO4M7jH6XWvfg7cxHxfwOUPSScSQ7rGXKW0Xvm1AsfuY7fVqnjDRLK44lLTzGj5lgONMr8AyziGt4Zwb/Y37w+/hjKEEC+B8O89HpgDggFUPDhQ4se+U0vAoOiniiHwf7k0lNXv2rlptuQEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786872931; c=relaxed/simple;
	bh=pJtc9YFC4Hm6jGgXLQqYgH9DIMKyO8wHlwVq2xfiT1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsj5GOs73dvDWoDfhWzEmrdrHNyfNpx+XcsHli84QWuGO6+fTfvPCEhtE9Xp1yKKIcOCfg7Sn6LZkIgqTgkQ8IFUBlxJvViKtd6F9nbiQsTHcKIfaFCeqVrz8wERGYElLU65KP8/QcWUIg1IHymUMab8HVhwhcpV4MhhgxjE7sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrABHTioshIFqlSJ3Aw--.4469S2;
	Sun, 16 Aug 2026 17:34:36 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wB3YXcqhIFqHxpFAQ--.17407S2;
	Sun, 16 Aug 2026 17:34:36 +0800 (CST)
Message-ID: <93f44778-0caa-4cbd-9056-a9bed42ad442@hust.edu.cn>
Date: Sun, 16 Aug 2026 17:34:34 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] docs/zh_CN: Add ipv6 Chinese translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260811071200.54062-1-anka@stu.cdut.edu.cn>
 <20260811071200.54062-5-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260811071200.54062-5-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABHTioshIFqlSJ3Aw--.4469S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW8Ww4UuFWxtrW5Gr4fuFg_yoW5Kr1fpF
	sxKFyxJF4Iy3W5KFnrGr1UG3Z8J3W8Can7CF17Z3ZYqrs5Ja92kw12kFyq9F4ftrySyFZ5
	ZrWrAry5CrWIkaDanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/11/26 3:11 PM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/ipv6.rst into Chinese.
>
> Update the translation through commit 19093313cb04
> ("docs: networking: convert ipv6.txt to ReST")
>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
> ---
>   .../translations/zh_CN/networking/index.rst   |  2 +-
>   .../translations/zh_CN/networking/ipv6.rst    | 76 +++++++++++++++++++
>   2 files changed, 77 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index 4675d23a7f28..cd768d0a2837 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -22,6 +22,7 @@
>   
>      msg_zerocopy
>      driver
> +   ipv6
>      napi
>      vxlan
>      netif-msg
> @@ -89,7 +90,6 @@ Todolist:
>   *   ip_dynaddr
>   *   ipsec
>   *   ip-sysctl
> -*   ipv6
>   *   ipvlan
>   *   ipvs-sysctl
>   *   kcm
> diff --git a/Documentation/translations/zh_CN/networking/ipv6.rst b/Documentation/translations/zh_CN/networking/ipv6.rst
> new file mode 100644
> index 000000000000..3def46cb752d
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/ipv6.rst
> @@ -0,0 +1,76 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/ipv6.rst
> +
> +:翻译:
> +
> +	陈思为 Siwei Chen <businiaoanka@anka1.top>
> +
> +====
> +IPv6
> +====
> +
> +
> +ipv6 模块的选项在加载时以参数形式提供。
> +
> +模块选项可作为 insmod 或 modprobe 命令的命令行参数给出，但通常在
> +``/etc/modules.d/*.conf`` 配置文件中，或在发行版特定的配置文件中指定。
> +
> +可用的 ipv6 模块参数如下所列。若未指定某参数，则使用其默认值。
> +
> +参数如下：
> +
> +disable
> +
> +	指定是否加载 IPv6 模块，但禁用其全部功能。当另一模块依赖于 IPv6

A little change about this translation:

指定是否在加载 IPv6 模块的同时禁用其全部功能。
> +	模块已加载，但又不需要任何 IPv6 地址或操作时，可使用此选项。
> +
> +	可选值及其效果如下：
> +
> +	0
> +		启用 IPv6。
> +
> +		这是默认值。
> +
> +	1
> +		禁用 IPv6。
> +
> +		接口不会添加 IPv6 地址，也无法打开 IPv6 套接字。
> +
> +		需要重启才能启用 IPv6。
> +
> +autoconf
> +
> +	指定是否在所有接口上启用 IPv6 地址自动配置。当不希望根据路由器通告
> +	（Router Advertisement）中收到的前缀自动生成地址时，可使用此选项。
> +
> +	可选值及其效果如下：
> +
> +	0
> +		所有接口均禁用 IPv6 地址自动配置。
> +
> +		仅添加 IPv6 回环地址（::1）与链路本地地址。
> +
> +	1
> +		所有接口均启用 IPv6 地址自动配置。
> +
> +		这是默认值。
> +
> +disable_ipv6
> +
> +	指定是否在所有接口上禁用 IPv6。
> +	当不需要任何 IPv6 地址时，可使用此选项。
> +
> +	可选值及其效果如下：
> +
> +	0
> +		在所有接口上启用 IPv6。
> +
> +		这是默认值。
> +
> +	1
> +		在所有接口上禁用 IPv6。
> +
> +		接口不会添加 IPv6 地址。

