Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B0548F857;
	Fri, 21 Aug 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317930; cv=none; b=GeWgUf8tvVGipmIWLrLoUvB7H5y8u8J8Rhovez50Cj6igE4sjMxqocNsq8bczh0u46iKoBSCdKRtDosmmxeuKlZIQk7c7xOLSh965+h2Ps/8NVV2ZY7V+STT0v5sD2O1ObPSYgwggsHK7C+xZw+ZEBBKl7f5O2f8rvSYeFi1JUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317930; c=relaxed/simple;
	bh=mKwDdHWcFToRLduX/OKfIScf3vG0laxaPd/KDNTptoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ntPOS2vsgQ7dAVFh4kEpbb/fYqwP+rQ/UorJ5rDvy+2DTE4XfdFKIQ0cSwLkREiLZRe2zSB0uQmx0JBQe81U4O+Jd3yri0UaxkSgsAebqOF4I35RP0J99LacyRSlwtINmiYo95Jws2pXu4XdJCu05ULew8XhxOomX5WfQfvry1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrACHj7NfTohqIva9AA--.13671S2;
	Fri, 21 Aug 2026 21:10:55 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAn5tBcTohquPECAA--.3383S2;
	Fri, 21 Aug 2026 21:10:54 +0800 (CST)
Message-ID: <48580a29-4c47-4b3c-9f90-e5be30b5fccf@hust.edu.cn>
Date: Fri, 21 Aug 2026 21:10:52 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese
 translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-3-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260817021340.17318-3-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrACHj7NfTohqIva9AA--.13671S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW8uw4xurWDGry8uFy3Arb_yoW5Gry5pF
	WkKFyIkF4xG34Utws3GF1UGr1UGF1xuw4DWr1Sq3ZYqrs5JF4DKr47tr9xt3yxWrWFvFyr
	ZFsa9rWY9rWjk3DanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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


On 8/17/26 10:13 AM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/sriov.rst into Chinese.
>
> Update the translation through commit 4558645d139c
> ("docs: net: document guidance of implementing the SR-IOV NDOs")
>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   .../translations/zh_CN/networking/index.rst   |  2 +-
>   .../translations/zh_CN/networking/sriov.rst   | 31 +++++++++++++++++++
>   2 files changed, 32 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index fcb8dc8f2c72..ae374c4cb144 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -29,6 +29,7 @@
>      alias
>      mptcp-sysctl
>      generic-hdlc
> +   sriov
>      team
>      timestamping
>   
> @@ -128,7 +129,6 @@ Todolist:
>   *   secid
>   *   seg6-sysctl
>   *   smc-sysctl
> -*   sriov
>   *   statistics
>   *   strparser
>   *   switchdev
> diff --git a/Documentation/translations/zh_CN/networking/sriov.rst b/Documentation/translations/zh_CN/networking/sriov.rst
> new file mode 100644
> index 000000000000..bf37e68f0534
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/sriov.rst
> @@ -0,0 +1,31 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/sriov.rst
> +
> +:翻译:
> +
> +	陈思为 Siwei Chen <businiaoanka@anka1.top>
> +
> +===============
> +网卡 SR-IOV API
> +===============
> +
> +强烈建议现代网卡专注于实现 ``switchdev`` 模型（参见 :ref:`switchdev`）
> +来配置 SR-IOV 功能的转发与安全。
> +
> +传统 API
> +========
> +
> +旧的 SR-IOV API 在 ``rtnetlink`` Netlink 协议族中实现，是 ``RTM_GETLINK`` 和
> +``RTM_SETLINK`` 命令的一部分。在驱动侧，它由若干 ``ndo_set_vf_*`` 和
> +``ndo_get_vf_*`` 回调组成。
> +
> +由于传统 API 与协议栈其余部分集成不佳，该 API 被视为已冻结；不再接受任何新功能或扩展。
> +新驱动不应实现那些不常用的回调；
> +即以下回调禁止使用：
> +
> + - ``ndo_get_vf_port``
> + - ``ndo_set_vf_port``
> + - ``ndo_set_vf_rss_query_en``

