Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD65D3911DD;
	Wed,  5 Aug 2026 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913325; cv=none; b=WLht77AxQRp9ATgFwQ0N5Vvauc6RkoVuHGLA1A6tfCweJkd+aJK0nQPEfauWrHw4XDu6cxRMdhEekpIMMYNO54IdHCTbHubv+rYFvgy/lf/n9s4GWHtLPOnzdQTA3AD6Z2jOjNfBr1C/4/IyOF9uwJimO7qIIE541U4kc+0ekHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913325; c=relaxed/simple;
	bh=UOpsT06C24d5TS5sJ5lYeroSKNNRqr7ZqwaKyMD5j5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfXgNhm92jdsxGAY0M4hVS380ZFpuPhn34wS3waP41v3bZUEjCK3JI7NPC22v44JCielUJfJiCW/qEFe6TpMZITUArhX5g8kRGf/HWNhrHMAa/icIHRwO+l+6F843B9Cht6Uyzk45tr58vWZoTtMweMajAMHV5okfoyn0MOY30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrABnSA3O33JqcuqZAA--.59699S2;
	Wed, 05 Aug 2026 15:01:34 +0800 (CST)
Received: from [192.168.1.8] (unknown [39.128.49.253])
	by gateway (Coremail) with SMTP id _____wDn71fK33Jqk2EZAA--.36489S2;
	Wed, 05 Aug 2026 15:01:33 +0800 (CST)
Message-ID: <8cfff5b7-c6a6-44e3-add9-f8eb217366c1@hust.edu.cn>
Date: Wed, 5 Aug 2026 15:01:29 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: update Traditional Chinese documentation
 maintainers
To: Chen-Yu Yeh <chenyou910331@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>, Weijie Yuan <wy@wyuan.org>,
 Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804201012.110713-1-chenyou910331@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260804201012.110713-1-chenyou910331@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HwEQrABnSA3O33JqcuqZAA--.59699S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxZw1UGry7Ww43tFW8tw17trb_yoW5Zw48pa
	n8trWayF1DtryakayIka12ya1rXryfGr47Gw1vgwn5CrZxtr1vqw1rKanIgF43urZ7KFWa
	qrnaga4Duw4jyFDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jDL05UUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/5/26 4:10 AM, Chen-Yu Yeh wrote:
> The zh_TW translation has been unmaintained for about two years: the
> listed maintainer has been unreachable, and because no active
> maintainer was listed, get_maintainer.pl did not point contributors at
> anyone who could actually pick up a patch. My own zh_TW patch sat on
> the list for five weeks for exactly that reason.
>
> Following the discussion in [1] and the plan in [2], list the people
> who have stepped up to carry zh_TW forward, with a shift in focus
> towards Taiwanese Mandarin terminology rather than a plain
> simplified-to-traditional conversion.
>
> Move Hu Haowen to CREDITS and drop his personal repository links,
> which are no longer reachable. The current translation is built on his
> work, but MAINTAINERS is a list of who to contact, and the listed
> address has not answered zh_TW mail for about two years, which is what
> made zh_TW hard to contribute to in the first place.
>
> zh_TW stays a separate entry and is maintained separately from zh_CN;
> the two may share a tree for pull requests, but the review and
> terminology work is independent.
>
> [1] https://lore.kernel.org/linux-doc/<20260603082531.263115-1-chenyou910331@gmail.com>/
> [2] https://lore.kernel.org/linux-doc/<amcZ5SI3-Hzw4HkJ@wyuan.org>/
Acked-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> Changes in v2:
>   - Drop Hu Haowen's M: entry (Jonathan Corbet); a CREDITS patch will
>     follow separately.
>   - Move the division of responsibilities below --- as suggested by
>     Weijie: it will drift over time, and a commit message is the one
>     place it cannot be updated.
>   - Collected Weijie's Acked-by.
>
> Current split of work, for the record rather than for the git history:
>
>    Chen-Yu Yeh   - translation and zh_TW terminology decisions
>    Weijie Yuan   - miscellaneous matters, list monitoring, status reports
>    Dongliang Mu  - review
>
> The address in the CREDITS entry is the one Hu Haowen asked to be
> listed under in [3].
>
> [3] https://lore.kernel.org/linux-doc/20260220160201.41149-1-srcres258@furdevs.cn/
>
>   CREDITS     | 4 ++++
>   MAINTAINERS | 6 +++---
>   2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/CREDITS b/CREDITS
> index 91c51c14e993..3866480db6aa 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -1817,6 +1817,10 @@ S: Am Strand 5
>   S: D-19063 Schwerin
>   S: Germany
>   
> +N: Haowen Hu
> +E: srcres258@furdevs.cn
> +D: Traditional Chinese (zh_TW) documentation translation and maintenance
> +
>   N: Jan Hubicka
>   E: hubicka@freesoft.cz
>   E: hubicka@suse.cz
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f9472c1a090..1f7e783023a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27460,10 +27460,10 @@ F:	kernel/trace/trace_osnoise.c
>   F:	kernel/trace/trace_sched_wakeup.c
>   
>   TRADITIONAL CHINESE DOCUMENTATION
> -M:	Hu Haowen <2023002089@link.tyut.edu.cn>
> +M:	Chen-Yu Yeh <chenyou910331@gmail.com>
> +M:	Weijie Yuan <wy@wyuan.org>
> +M:	Dongliang Mu <dzm91@hust.edu.cn>
>   S:	Maintained
> -W:	https://github.com/srcres258/linux-doc
> -T:	git https://github.com/srcres258/linux-doc.git doc-zh-tw
>   F:	Documentation/translations/zh_TW/
>   
>   TRIGGER SOURCE

