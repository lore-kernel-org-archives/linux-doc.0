Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9CB46EC69;
	Wed,  5 Aug 2026 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935656; cv=none; b=nPLZM9URz4BEQp6+OhRLppxPEDvC6WUNf1Ra419BRe1jKQeC9vRzx2wkws+mbWr1I1zICluTotSR7naVrgQiR+Din15lCYcTi6ooViXKcRUNExMbRL5nzFub/gRF+MUhF+RuQLPtvCLCS4hnNGcPCrLZzs34No5wnKIkY9EmUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935656; c=relaxed/simple;
	bh=mBoWXybGtIUXZPs6rdpGvtBQoAYw/dCDbhEgETExaaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNYEa1VHrc1w1Fm8DbnaTRv4i2Pli2+pe9aHjU1ArNs1fj4S6B5aJ9IA+ocYO8VeQnidevuZW6tAbI2FPA3CsLW4NfbUHGTmm2tsr/dr8nBHZyXRLDQWPav3Kc8bI4xDD1vUqjjwV+qxbpbKp09LpDB0McNR+6mc2n8CRC/Kp0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrAAX7qIGN3NqcOP_Ag--.2716S2;
	Wed, 05 Aug 2026 21:13:42 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wC3v1cDN3NqV_QaAA--.38934S2;
	Wed, 05 Aug 2026 21:13:40 +0800 (CST)
Message-ID: <f5a7b052-1e99-4498-9595-423987580123@hust.edu.cn>
Date: Wed, 5 Aug 2026 21:13:39 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: sync page_table_check.rst translation
To: Ye Liu <ye.liu@linux.dev>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: Ye Liu <liuye@kylinos.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260805122224.2512983-1-ye.liu@linux.dev>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260805122224.2512983-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAX7qIGN3NqcOP_Ag--.2716S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGF48Wr1xtrW8KF48AFW5ZFb_yoW5ArWkpr
	yvg393t3WIk34rur40krZFyF18GFy8Ga13Gw1xG3yDXrs5ArW0yr4DGr1DKasrZryxA3Z3
	uF1Y9F1S9a9ay3JanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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


On 8/5/26 8:22 PM, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
>
> Update the Chinese translation of page_table_check.rst to reflect
> two changes in the English original:
>
> 1. "In case of detected corruption" → "In case of most detected
>     corruption" — clarify that not all corruption types cause a crash.
>
> 2. Add the missing paragraph about page table entry flag checks and
>     userfaultfd wr-protect verification.

Please take a look at how-to.rst [1] and rewrite the commit message.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/translations/zh_CN/how-to.rst.

Dongliang Mu

>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>   .../translations/zh_CN/mm/page_table_check.rst         | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/mm/page_table_check.rst b/Documentation/translations/zh_CN/mm/page_table_check.rst
> index dc34570dceff..7ba5a39db487 100644
> --- a/Documentation/translations/zh_CN/mm/page_table_check.rst
> +++ b/Documentation/translations/zh_CN/mm/page_table_check.rst
> @@ -21,9 +21,13 @@
>   当新的页面可以从用户空间访问时，页表检查通过将它们的页表项（PTEs PMD等）添加到页表中来执行额外
>   的验证。
>   
> -在检测到损坏的情况下，内核会被崩溃。页表检查有一个小的性能和内存开销。因此，它在默认情况下是禁用
> -的，但是在额外的加固超过性能成本的系统上，可以选择启用。另外，由于页表检查是同步的，它可以帮助调
> -试双映射内存损坏问题，在错误的映射发生时崩溃内核，而不是在内存损坏错误发生后内核崩溃。
> +在检测到大多数类型的损坏时，内核会崩溃。页表检查有一个小的性能和内存开销。因此，它在默认情况下是
> +禁用的，但是在额外的加固超过性能成本的系统上，可以选择启用。另外，由于页表检查是同步的，它可以帮
> +助调试双映射内存损坏问题，在错误的映射发生时崩溃内核，而不是在内存损坏错误发生后内核崩溃。
> +
> +页表检查还可用于对各种标志进行页表项检查，在检测到非法的标志组合时输出警告。目前，userfaultfd 是
> +唯一的使用者，用于对 wr-protect 位与任何可写标志进行一致性检查。在这种情况下，非法的标志组合不会
> +立即直接导致数据损坏，但会使只读数据变为可写，从而在后续修改页面内容时导致损坏。
>   
>   双重映射检测逻辑
>   ================

