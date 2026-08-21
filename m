Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E141258EF3;
	Fri, 21 Aug 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317926; cv=none; b=uYqDz2BLLEHVsWJT3o+gbE/G/UYz7/OVEsQQAMqMFSA2PoyJebwyZS+C/YyUeFm3lrs0CTJDF5ogp21reBGhcUX01b9bMB++UDpNsZDBLJRaOcEQxNhOMue9RPV2rCIMgBYPR1JP/xTV6C5igfT50SiuE2uzBfrn9qZTNydeFY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317926; c=relaxed/simple;
	bh=VNG/FC6Houcxw2ahvubgYJ39Cdk5BAqr15F56hDGqec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/ynndB5hY0hcSNA3GSdsytpP0GNd+Sn1GSVVLmXP9544k0fQvG/DrDxqBhUlMEYDNTPcot3fnJZqjvOUKEg99YmNrEomciE/8IL0jqHg0B0Wo5vLjeA01kH7W+5uFvLgqhyMw9AzE2ZR2/b/wh067kplRCY4Kw5ClRplLhF9gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAAX7qJ1TohqRg6rAw--.24545S2;
	Fri, 21 Aug 2026 21:11:17 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCHZNFyTohqE_ICAA--.3509S2;
	Fri, 21 Aug 2026 21:11:16 +0800 (CST)
Message-ID: <f28dccd4-0c7f-47ac-8a5f-f532f42b7dd0@hust.edu.cn>
Date: Fri, 21 Aug 2026 21:11:14 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] docs/zh_CN: Add ipv6 Chinese translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-5-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260817021340.17318-5-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAX7qJ1TohqRg6rAw--.24545S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW8Ww45Jw1kKF13Jr4ktFb_yoW5tF4DpF
	sxKFyxJF4Iy3WUKFnrGr1UG3Z8G3WxCanrCF17Z3ZYqrs5Ja92kw12kFyq9F4ftrySyFZ5
	Zr4rArW5CrWIkaDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Ar1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RECJPDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/17/26 10:13 AM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/ipv6.rst into Chinese.
>
> Update the translation through commit 19093313cb04
> ("docs: networking: convert ipv6.txt to ReST")
>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
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
> index 000000000000..3726b6fdc460
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
> +	指定是否在加载 IPv6 模块的同时禁用其全部功能。当另一模块依赖于 IPv6
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

