Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632AD3B14AE;
	Fri, 21 Aug 2026 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317874; cv=none; b=lm2rknIoAqfT1W0It2NuDv8x02+ZMc6ptnG/ZwSQjkb3XmqtmUOzndaeC4N7+P1NwhS8AILhEvVGn5ucrGjYv3HdgvvYw3gXcb7KZvrZFFcUgpbJe/tu3cgqRmIiZm6Y5Sn/PKIjrRkBmFGsRHUNKioBefjRcg2YKy54hWN+aMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317874; c=relaxed/simple;
	bh=THYHlu9qBLqK3/DvApA+QKiAcD4wejFCkwofzSEp9CM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjEQSSBrrh/AXhRo2mqS2dK6QWyWsI20Vqay7VzxR16jbpEpKm2tnY9V/DbE5xRl5KZBwSbJUiAd9YGHXgFqsTxoE6X6g5Lnwb9Ats5mYvm+gZU6jB4W+KhRApTXr495yc+pROp/LjVi0UUJefAH3gYG9BHO7ZiSuomze745E9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrABnZ6BTTohqPQ2rAw--.14865S2;
	Fri, 21 Aug 2026 21:10:43 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBHBtFRTohqivECAA--.4244S2;
	Fri, 21 Aug 2026 21:10:42 +0800 (CST)
Message-ID: <9d06be71-370d-412f-8f6e-b770360cf9dc@hust.edu.cn>
Date: Fri, 21 Aug 2026 21:10:40 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] docs/zh_CN: Add networking team documentation
 Chinese translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-2-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260817021340.17318-2-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABnZ6BTTohqPQ2rAw--.14865S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF45Kw4ruFyktr1DGryUWrg_yoW8CFWDpa
	95KryxGF4xWFy7G3yxGr1UGr15GF4xCw4UGr1Iq3Zaqrn8t3Wktr17tr98Kr17KrW0yFW5
	ZF4rKrW5WrWjy3DanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/17/26 10:13 AM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/team.rst into Chinese.
>
> Update the translation through commit aa8a6ee3e3fc
> ("docs: networking: convert team.txt to ReST")
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
> ---
>   .../translations/zh_CN/networking/index.rst      |  2 +-
>   .../translations/zh_CN/networking/team.rst       | 16 ++++++++++++++++
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/team.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index 333e9f6cafff..fcb8dc8f2c72 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -29,6 +29,7 @@
>      alias
>      mptcp-sysctl
>      generic-hdlc
> +   team
>      timestamping
>   
>   Todolist:
> @@ -136,7 +137,6 @@ Todolist:
>   *   tc-queue-filters
>   *   tcp_ao
>   *   tcp-thin
> -*   team
>   *   tipc
>   *   tproxy
>   *   tuntap
> diff --git a/Documentation/translations/zh_CN/networking/team.rst b/Documentation/translations/zh_CN/networking/team.rst
> new file mode 100644
> index 000000000000..e6cf19a245a1
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/team.rst
> @@ -0,0 +1,16 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/team.rst
> +
> +:翻译:
> +
> +	陈思为 Siwei Chen <businiaoanka@anka1.top>
> +
> +====================
> +Team（网络接口聚合）
> +====================
> +
> +Team 设备由用户空间通过 libteam 库驱动，该库位于：
> +	https://github.com/jpirko/libteam

