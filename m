Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596FF3CB546;
	Fri, 21 Aug 2026 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787311195; cv=none; b=JGgK9salOlqJg+R/5aW2A1A1glgh7rO3+lalxc2LKnvZMrwwOUtxSYzOZbc/dna5acW2NbEZ4WL5AnYhyfNcdNQPUVCqycX1wlP0+lmLVekl32ysPOGyIicSMMhfN9GZ9o8se/QD0U1WyewiPNSJrT99/kezuOLCw+P2ya3dyxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787311195; c=relaxed/simple;
	bh=ipf7LdNJfFzYNKI2VngtwwKOHqRfCEwZhrHexM2mSdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEz9mvmaeffngmJ2tVMsPLQQIqZURvyzlZPKtrI2zkaDikqkuF+LSBRG5DAYthV3GY7fatCkVkJKN4L7wYWKp0cvspDMe72cMhhmpawkojabdrhMWgjKdgvV/Z/Td1Gg2Nbq/nOICVJRNE+M7z8ZWYhTR35Tr6B5DQk8B5FE4lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAB3naIiNIhqjRCqAw--.14788S2;
	Fri, 21 Aug 2026 19:18:58 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wC3sKMgNIhqV2gCAA--.4089S2;
	Fri, 21 Aug 2026 19:18:57 +0800 (CST)
Message-ID: <7232a999-0bb8-45fa-8d33-a11efc661012@hust.edu.cn>
Date: Fri, 21 Aug 2026 19:18:56 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Update maintainer-pgp-guide.rst Chinese translation
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
 <5b107aad-2826-4bf6-97aa-14592131b6a8@hust.edu.cn>
 <aof8rCuuwzHUNtka@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <aof8rCuuwzHUNtka@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAB3naIiNIhqjRCqAw--.14788S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxJF1ktFWUtr13Wr4DJF4kCrg_yoW5ur15pF
	y8KF92kw4qy3W3A397Ww4xZFWFyrn2yrW2qa4UWr43ta90k3Z2qr4ftFs09a4UWFs5Kw45
	Xw4jqr9Yv3yjva7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYVMNUUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/21/26 3:22 PM, Weijie Yuan wrote:
> On Fri, Aug 21, 2026 at 02:54:59PM +0800, Dongliang Mu wrote:
>> On 8/21/26 1:13 AM, Weijie Yuan wrote:
>>> The script says:
>>>
>>> $ tools/docs/checktransupdate.py Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
>>> [1787244823.341547] Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
>>> [1787244823.630509] commit 54857c52452a ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
>>> [1787244823.680849] commit 6c5c07bc8589 ("docs: process: maintainer-pgp-guide: update kernel.org docs link")
>>> [1787244823.730027] commit 273aa250f138 ("Documentation: Improve wording on requirements for a free Nitrokey")
>>> [1787244823.779408] commit f44a29784f68 ("Documentation: update maintainer-pgp-guide for latest best practices")
>>> [1787244823.779522] 4 commits needs resolving in total
>>>
>>> So I updated this document in chronological order, created four patches
>>> based on these four outdated commits to make it easier for you to
>>> review. Hence, you can freely squash them when applying them.
>>>
>>> Tested with make htmldocs, no warning or error made by these patches.
>> Hi Weijie,
>>
>> Please make sure you execute "  make cleandocs & make htmldocs". Some
>> warnings may be ignored by further compilation.
> Hi!
>
> Thanks for emphasizing this. While I do remember I used "make cleandocs
> && make htmldocs", and checked among those long lines of red warning
> output to find anything caused by my commit, I indeed didn't notice this
> warning appearing at the early stage of the compilation.
>
> It seems that I need to have my eyes checked soon. ;-)
>
> Apologize for my recklessness.
>
> Even so, do we have any way to distinguish these long-standing warnings
> from the new warnings that appear during compilation? In fact, every
> time I was worried that I might not have noticed the newly appeared
> warning. Unfortunately, this time it really happened. (For example,
> setting a new color? for new warnings?) Do you have a better idea or
> tips for this?

My suggestion is to keep the log in each file, and you can easily 
observe the diff. Otherwise, even I can ignore some warnings.

And many contributors are coming together to fix those warnings. If they 
are done, all new warnings are easily captured. Let us do more 
contribution to help this.

Dongliang Mu

>
> Btw I've been trying to know more about Sphinx and kernel-docs, hope my
> mistake won't happen again.

That change can fix problem. The underlying problem is RST syntax. Maybe 
you can have a look at this or query it in the LLM.

Dongliang Mu

>
> Thanks.
>
>>    > WARNING: duplicate label kernel_org_trust_repository
>>    >
>>    > The same label is already defined in the English document. Please use a translation-specific label, for example:
>>    >
>>    > .. _zh_kernel_org_trust_repository:
>
>>    > checkpatch.pl reports:
>>    >
>>    > WARNING: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
>>    >
>>    > Please replace Assisted-by: LLM with the actual agent, model version, and tools used.
> And this one has been updated from Jon's PR last night, so I ignored
> this output, left just a simple LLM.

