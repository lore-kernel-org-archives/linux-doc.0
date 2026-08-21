Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5555B24B28;
	Fri, 21 Aug 2026 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787295353; cv=none; b=HDrAIBavUNOUkm8WzssqeqdlOFFuI3vZLqcmHJwB/8FWxF9350O9BpT3ILeYqfJrPDTHQZy/uS8ax98qiQhu6VvOBdQObIhkAyieteZV1ZdGl0E1tQvTYomwmxt2dyHzDubaK5kWJcQqcwOfPL2TddDNdeT1UHCV4VQJRBROpYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787295353; c=relaxed/simple;
	bh=KJVSLJAlQZbTSpcQ6XfAA6nrd8FORki/ZXESmQk5Hbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHzO1FSoAgeSp7a6HrVjc9V1ys85EfqnF+mvIn5vHu1mRXKhaL1FZYtZwdsWb+G0rckVDzuLFldL6pUbZrdWwSzz1BSfUUlkp/IkbAfDPVCGB6pBePOPfAVd54ryTFoCIfYeaR1B0Px/M2mTRdIVV7V+3SiOiqbCXgWlGO/mEUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrABHTipN9odqK+enAw--.9997S2;
	Fri, 21 Aug 2026 14:55:09 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCHZNFE9odq1T8BAA--.1353S2;
	Fri, 21 Aug 2026 14:55:03 +0800 (CST)
Message-ID: <5b107aad-2826-4bf6-97aa-14592131b6a8@hust.edu.cn>
Date: Fri, 21 Aug 2026 14:54:59 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Update maintainer-pgp-guide.rst Chinese translation
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABHTipN9odqK+enAw--.9997S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW3XF1ktw4rWF1kXF4rGrg_yoW5Jr4fpF
	yxKanrua1kA3WSva4xGayUZay5tFn3CrW2qF10gw1fJrn5Kw10qFWftFWrZFW8WFs5K3W3
	XwsFgr1q9w40vFJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU3ZjjDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/21/26 1:13 AM, Weijie Yuan wrote:
> The script says:
>
> $ tools/docs/checktransupdate.py Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> [1787244823.341547] Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> [1787244823.630509] commit 54857c52452a ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
> [1787244823.680849] commit 6c5c07bc8589 ("docs: process: maintainer-pgp-guide: update kernel.org docs link")
> [1787244823.730027] commit 273aa250f138 ("Documentation: Improve wording on requirements for a free Nitrokey")
> [1787244823.779408] commit f44a29784f68 ("Documentation: update maintainer-pgp-guide for latest best practices")
> [1787244823.779522] 4 commits needs resolving in total
>
> So I updated this document in chronological order, created four patches
> based on these four outdated commits to make it easier for you to
> review. Hence, you can freely squash them when applying them.
>
> Tested with make htmldocs, no warning or error made by these patches.

Hi Weijie,

Please make sure you execute "  make cleandocs & make htmldocs". Some 
warnings may be ignored by further compilation.


   >
   > WARNING: duplicate label kernel_org_trust_repository
   >
   > The same label is already defined in the English document. Please 
use a translation-specific label, for example:
   >
   > .. _zh_kernel_org_trust_repository:

   > checkpatch.pl reports:
   >
   > WARNING: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] 
[TOOL2]' format
   >
   > Please replace Assisted-by: LLM with the actual agent, model 
version, and tools used.

Dongliang Mu

>
> ps. Jon, I have a little confusion regarding the license identifier.
> Maybe you could take a look at it. Thanks. But that's not a big deal.
>
> [+To: Konstantin, as he is the original author, thanks.]
>
> ---
> Weijie Yuan (4):
>        docs/zh_CN: update maintainer-pgp-guide translation
>        docs/zh_CN: clarify free Nitrokey requirements
>        docs/zh_CN: update maintainer-pgp-guide kernel.org link
>        docs/zh_CN: add kernel.org trust repository reference
>
>   .../zh_CN/process/maintainer-pgp-guide.rst         | 140 ++++++++++-----------
>   1 file changed, 67 insertions(+), 73 deletions(-)
>
>
> ---
> base-commit: ba839bfe38d0ac2d8cbdc1272e2408dc35dafa6a
> change-id: 20260820-maintainer-pgp-guide-f1f96164cfaa

