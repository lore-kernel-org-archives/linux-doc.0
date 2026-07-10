Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C722B4218A1;
	Fri, 10 Jul 2026 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689734; cv=none; b=EirCdRqO3pxuT2IImg759c7IhwawjbRpE8ph9LjvsQH8T0tRnh4bESrFuE6CGZc76vAq61ov/CEjRgjVPVKvlaS744wnQUBatR4NAyWGnGp/2vEYjoUMPrT+OChcF6JNnS2AJpsstkeJMiRDGdKB3aLQ6znBTADIPbE6yCXoui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689734; c=relaxed/simple;
	bh=YcQ0yyQyFQ9f0NmchnkpELPEPxgSB4Hy02pfav27Rq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngxFidV9TXCW/gqgIoRvPn4JS4WX14JGV868fN77BiNNnUZShdvjcLcR+BErltO5qcrOPCCzYLu9NSH780ZIFkgWoIzPYje37TrZ6SAJUrJRWTWT1dPerAHE3+fqTQcq7mBd7FwB0El74MKM8CECd9q6d2w7yQEvwY+wZMykUt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAAn_jTQ8VBq0tZhAA--.60120S2;
	Fri, 10 Jul 2026 21:21:20 +0800 (CST)
Received: from [100.81.40.43] (unknown [222.20.126.216])
	by gateway (Coremail) with SMTP id _____wDnYc7M8VBqGkxyAA--.41149S2;
	Fri, 10 Jul 2026 21:21:17 +0800 (CST)
Message-ID: <ce715802-1b46-4ba6-b388-39260f217ba3@hust.edu.cn>
Date: Fri, 10 Jul 2026 21:21:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add docs-next checkout workaround
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAn_jTQ8VBq0tZhAA--.60120S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy3Aw4fAr18ZF47GFyfJFb_yoW5Jr17pF
	48Krn7K3Z8Gr18Ga4DKa1jkF17WFyfGayxGFnrGws5tr9xJ3s5tr1ayrZ8KF9Ivryj9FWY
	vF42qay0ka45CaDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmYb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxUV9N3UUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/9/26 11:25 PM, Weijie Yuan wrote:
> Hi all,
>
> Since cloning Alex Shi's tree from the HUST mirror may be unstable, as
> reported in [1]. I think adding one more option for beginners to get
> started might be a good idea.
>
> Thanks,
> Weijie
>
> [1] https://lore.kernel.org/linux-doc/4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1/
>
> --- >8 ---
Is this a special mark for LKML? If I understand correctly, the 
following should be the patch content.
>
> The Chinese documentation guide asks contributors to base their work on
> the docs-next branch of Alex Shi's tree. However, cloning that tree from
> git.kernel.org or mirrors.hust.edu.cn may fail in some network
> environments.
>
> Document an alternative workflow: clone Linus Torvalds' tree from a
> local mirror, add Alex Shi's tree as another remote, fetch docs-next
> from it, and then create a local branch that tracks alexs/docs-next.
>
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> ---
>   Documentation/translations/zh_CN/how-to.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> index 9ec2384e1e76..fcfe0a4a8be2 100644
> --- a/Documentation/translations/zh_CN/how-to.rst
> +++ b/Documentation/translations/zh_CN/how-to.rst
> @@ -53,6 +53,16 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
>   这是 Alex 开发树的镜像库，每两个小时同步一次上游。如果您了解到更快的 mirror，
>   请随时 **添加** 。
>   
> +或者::
> +
> +	git clone https://mirrors.tuna.tsinghua.edu.cn/git/linux.git
> +	cd linux
> +	git remote add alexs https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/
> +	git fetch alexs docs-next:refs/remotes/alexs/docs-next
> +	git switch -c docs-next --track alexs/docs-next
> +
> +这将先用清华源拉取 Linus Torvalds 的开发树，再增量下载中文开发分支中的内容。

This would make the envionment preparation more difficult. My suggestion 
is to ask maintainers of some mirror sites to sync this repo like us.

Dongliang Mu

> +
>   命令执行完毕后，您会在当前目录下得到一个 linux 目录，该目录就是您之后的工作
>   仓库，请把它放在一个稳妥的位置。
>   

