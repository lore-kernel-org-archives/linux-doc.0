Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845027;
	b=s4Nb8xAFDMVWWzAQPkbljNXKgtR0FfX05EkZR8k9IU0HofH+yHlOUaXQgluI0fx3w1Oz
	 LNFSvvVvC8WJD9obEOtxO3IwFv9W2r6STU8O/16jqkeqKToATfzmzlQZgz/cnsOPg/676
	 LXzRR9tpm3THQmopwQxwYWCao8jlhkFkzMTCQpy+cU0Qd6GbDx7NqN4ZbQBLyIM2RCcOi
	 2yJHko3B3x5Nkm20ufdPazjEfuUfDpob1Qn+tSwQWHy299XI7//k/u+yPFTde7rEP8Qki
	 m+0/72EW8wOJeK1k7ou9Eztggvy48XqoLSYo5ns6CR3fYy7sjLPeYfGuRBg4YDW95iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845027;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=hpS6M900ZrqbYNnwn6CCN4oJpj/TVPdsd/1y1XqUQaI=;
	b=LxUQS+kQdEFdYLYLdUQSIoTioyQC4CRr+D2aCKgfU3Heo0jGhLXBy63qZgLRkXLescnd
	 UxmA4VCulrJqaAfeuj7aBO1SZzLpwfNlfw9A13Hz9rzysbIUzcf+xPE+/u1USrqMjOL2e
	 5EE51HrUdfwwOearuRLe2ynsI6fZR+v8IgLu7RYnMrmf8JTQ6VNW/5zMf/MnZIIJm9z3a
	 5YzWYPAne04OPTCxNPNJygb1x5gzJmwNlXD6O7yhKr3RlTLzI0jpfIIu4kuG3Qzx9yjPk
	 vidbCVyZLC7TYDYgQ2OFcoXfxo9ZR04rWEA0drg7fQLZc2aWnxz2y9d+j1res2e7yag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9415606A322
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9415606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMBWfcVbKftqrIkbAA--.39274S2;
	Tue, 17 Nov 2026 00:03:40 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAH0slWKftqmMkcAA--.6011S2;
	Tue, 17 Nov 2026 00:03:36 +0800 (CST)
Message-ID: <8663b8ae-9bc7-46ab-ad12-c9ed97a8096a@hust.edu.cn>
Date: Tue, 17 Nov 2026 00:03:34 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in Chinese docs (Nov 2026, #04)
To: Weijie Yuan <wy@wyuan.org>
Cc: Weijie Yuan <kernel@wyuan.org>, linux-doc@vger.kernel.org,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Chen-Yu Yeh <chenyou910331@gmail.com>
References: <avcRFzlQQTOra-fr@wyuan.org>
 <b930b5f3-8571-42a6-a8d4-433ace854f3f@hust.edu.cn>
 <avsgnLlkyQZ2U7d7@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <avsgnLlkyQZ2U7d7@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMBWfcVbKftqrIkbAA--.39274S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1UWF1UXF4xWFyUWw17Jrb_yoW5CFW3pF
	WfKFn7GF18Xr18Ar1Iga18CF1IqF1rG343Xr15G3WfArn0yry0qF1jkrWFga4qvrykCF45
	tw17Zr9agryDZFDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmlb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE-syl42xK82IYc2Ij64
	vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMxCI
	bckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
	JbIYCTnIWIevJa73UjIFyTuYvjxUV9N3UUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/16/26 11:26 PM, Weijie Yuan wrote:
> On Mon, Nov 16, 2026 at 11:07:34PM +0800, Dongliang Mu wrote:
>> On 11/13/26 9:31 PM, Weijie Yuan wrote:
>>> Here are the topics for Chinese docs waiting to be merged.
>>>
>>> Copies of the source code to Chinese documentation development tree live
>>> in here:
>>>
>>>       git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>>>       https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>>>       https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs/linux.git
>>>
>>> Mirrors:
>>>
>>>       https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
>>>       https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)
>>>
>>> Please report any mirror instability to linux-doc@vger.kernel.org
>>>
>>> -------------------------------------------------------------------
>>> [Cooking]
>>>
>>> * Yikun Wei 2026-11-13
>>>     [PATCH] docs/zh_CN: Add deprecated translation
>>>
>>>     Needs review.
>>>     source: <20261113122844.24838-1-YikunWei@126.com>
>>>
>>>
>>> * Yikun Wei 2026-11-13
>>>     [PATCH] docs/zh_CN: Add contribution maturity model translation
>>>
>>>     Needs review.
>>>     source: <20261113112200.16790-1-YikunWei@126.com>
>>>
>>>
>>> * Xiongwei Song 2026-11-13
>>>     [PATCH 0/2] Add RCU docs Chinese translation
>>>     [PATCH 1/2] docs/zh_CN: Add RCU/index.rst translation
>>>     [PATCH 2/2] docs/zh_CN: Add RCU/whatisRCU.rst Chinese translation
>>>
>>>     Needs review.
>>>     source: <20261113013054.5662-1-xiongwei.song@linux.dev>
>>>
>>>
>>> * Weijie Yuan 2026-11-09
>>>     [PATCH v3 0/2] docs/zh_CN: update maintainer/configure-git.rst
>>>     [PATCH v3 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
>>>     [PATCH v3 2/2] docs/zh_CN: improve maintainer/pull-requests translation
>>>
>>>     Needs review.
>>>     source: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
>> The above four patch/patchset are reviewed. New contributors still need to
>> pay more attention to how-to.rst.
> Oh btw, once this patch from Konstantin is merged, we'll only have the
> linux-doc list, and no more LKML:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-nonmm-hotfixes-unstable&id=24e311b72f31fddbbb1e2f6fc3232f3ac523d929
>
> Therefore our free Sashiko review will stop soon because linux-doc is
> not registered in Sashiko.
>
> I noticed that support for triggering reviews based on specific file
> paths, without enabling them for the entire linux-doc mailing list,
> seems to have landed on Sashiko´s main branch, but isn't in the latest
> release yet. If folks would appreciate an extra pair of eyes, I'll take
> another look and kindly ask Roman to enable it for us.

Just do it. No lost, but more issues with another round of review.


>   I'll do that
> after this weekend's CLK conference. What do you think?

If you are in Hangzhou at the weekend, maybe we can have a talk there.

I will go to Hangzhou this weekend since my student will have a talk in 
the ebpf subsystem of CLK conference.

Dongliang Mu


>
> Thanks.

