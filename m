Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCD430CD95;
	Tue, 11 Aug 2026 04:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.187.6.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421678; cv=none; b=sALr2Du1URNOqKU4DhnaiKNiwGqHRodBBf/G11RSlQPPYveAz1KxOfBBxlb0ncPdPmKCZPfKHG5mX8poiIRa6jhFYfQDRNCZjyFJzk3MPPWKDXQt+21ujE7qmgYjRo74sRj0xt5QbVd+/mu/aKMjFtut+6xTSTpix1UKG+aWh1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421678; c=relaxed/simple;
	bh=gCXZFM38VDI+KX8fXlUKPPERe2AIJdB3mVfnlYWl1Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKa28pOX7NBuNibIOxI8oFTjcm+BdImKJEjPjbgT3e2uNmhRyawzEjR+pBoKPYCM6Aj6/n0L9LYSkLsCT9wW2GxPfJNU9ofxOCPZ+RyPBCAPyY95R5biw+Ls3wvyKRyWNC49Z+d4yAxZMqLXqeEBmR07Hes1uTYB6st71Jf2WMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.187.6.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAAn_jSdoXpq_36mAA--.17356S2;
	Tue, 11 Aug 2026 12:14:21 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDnylycoXpqURo7AA--.9522S2;
	Tue, 11 Aug 2026 12:14:20 +0800 (CST)
Message-ID: <c560c763-d522-49f6-b325-96270aa18bc2@hust.edu.cn>
Date: Tue, 11 Aug 2026 12:14:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] docs/zh_CN: Add ipv6 Chinese translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260727073538.56951-1-anka@stu.cdut.edu.cn>
 <20260727073538.56951-5-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260727073538.56951-5-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAn_jSdoXpq_36mAA--.17356S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW8Ww4UuFWxtrW5Wr47twb_yoW5tFW5pF
	sxKFyxJF42y3WUK3ZrGr1UG3Z8K3W8CanrCFy7Z3ZYqrs5Ja92kw12kFyq9F4ftrySyFZ5
	ZrWrAry5CrWIkaDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/27/26 3:35 PM, Siwei Chen wrote:
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
> index 000000000000..5246d8588cf6
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
> +	指定是否在所有接口上启用 IPv6地址自动配置。当不希望根据路由器通告
If you prefer spaces before and after English words, add a space after 
IPv6.
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

