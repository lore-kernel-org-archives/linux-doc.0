Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0F042BEBA;
	Fri, 21 Aug 2026 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319953; cv=none; b=muvuUGhQiPBARKZKXuDj5admPdbsat823Kq/+iNLeHrcMNnQ6S00zSFnbXiT4EaKOuebhuUTQnTgrlJGDNTnS1z+BWsOno/n24UeEJxdvMNMooRNx5snqLIEguXk/vTZa1YeX+SX/iPWttLgcniSMrWvzKNQmRzLwWwbLUqZUv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319953; c=relaxed/simple;
	bh=hGZU6sF+H/YppPU+gvkMCxUIZ3vhekgtdVkx59xHz0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xrw07Zqw17bytv1Hrz8HSHL7pab/4AvJf3e3iTV8OIjyWK92cj/aeYxXjdPqfYQhxnJXFtdeYaRLYnNtF/Iw1J8ZTUQ4IS3K0vSCirBJX3EMSwTtf6FoKb4FOH0AmuPGt0hfTBPmTyzy9SVmT4ifhSXvAOqBl2JglhJnMVyTsG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrABnSQ55VohqpgO+AA--.53979S2;
	Fri, 21 Aug 2026 21:45:29 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXdNF2VohqLh0DAA--.3640S2;
	Fri, 21 Aug 2026 21:45:28 +0800 (CST)
Message-ID: <b7c913d1-578b-47c1-a2b7-c1420deb4d21@hust.edu.cn>
Date: Fri, 21 Aug 2026 21:45:26 +0800
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
 <7232a999-0bb8-45fa-8d33-a11efc661012@hust.edu.cn>
 <aog87UzDIz20XzU_@wyuan.org>
 <0e437b53-5a44-406f-a482-518a6c09f7e2@hust.edu.cn>
 <aohJLNK5Cqv1iMLd@wyuan.org>
 <771c1b11-f7d3-4a1b-a26a-b20187eeae59@hust.edu.cn>
 <aohOiXppk2Px7SXx@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <aohOiXppk2Px7SXx@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrABnSQ55VohqpgO+AA--.53979S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxXr18Cw1UCw13ZFW8tr15twb_yoWrtF1xpF
	WSkanxtF4ktr17Ars2k3WUZFyxt3Z8Ary5Wr95Xr1kZFn0vF1ftrsa9r4Y9a9rGr1kWa12
	vr4jqryIqay5A37anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQIb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IUYVMNUUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/21/26 9:11 PM, Weijie Yuan wrote:
> On Fri, Aug 21, 2026 at 08:57:46PM +0800, Dongliang Mu wrote:
>> On 8/21/26 8:48 PM, Weijie Yuan wrote:
>>> On Fri, Aug 21, 2026 at 08:17:06PM +0800, Dongliang Mu wrote:
>>> [...]
>>>>> (I definitely won't admit that the log file annoyed me a few times
>>>>> because I accidentally included it with 'git add .' and then had to 'git
>>>>> commit --amend' right after) ;-)
>>>> My experience is to not use 'git add .'. In Linux, hidden files are not
>>>> listed by default.
>>> Yes, I was being lazy to type the full pach/full file name, oops.
>>>
>>> While hidden files are not listed by default on Linux, thankfully the
>>> kernel source tree ignores .* via .gitignore. But 'git add .' is indeed
>>> a bad habit.
>>>
>>> Btw, git commit -v, or setting commit.verbose = true, can really save
>>> one at the last minute. (as mentioned in our how-to doc) And sadly I
>>> actually happened to use another computer to write patches last night,
>>> which I hadn't configured it. XD
>> Actually these labor-tensive works should be done by LLM. This is one of the
>> right directions of LLM usage.
>>
>> You can write a simple skill to help you complete these works.
> That makes sense. I'll give it a try. Still, given that the kernel
> community tends to be a bit conservative, I've generally tried to do
> things myself. Of course, the most important thing is that we supervise
> what the LLM is doing and make sure it follows our actual intent rather
> than hallucinating.

My experience is to always double check the result of LLM.

However, to be honest, translation is not a complicated task. Sometimes 
LLM proposes greater translation than me.

And LLM is really good at capturing some common problems in the patchset.

>
>>>>>>> Btw I've been trying to know more about Sphinx and kernel-docs, hope my
>>>>>>> mistake won't happen again.
>>>>>> That change can fix problem. The underlying problem is RST syntax. Maybe you
>>>>>> can have a look at this or query it in the LLM.
>>>>> Absolutely. I did have relatively little experience writing rst before.
>>>>> But that's definitely no excuse - I'll try to pick it up quickly.
>>>> LLM is really useful to capture some syntax and semantics issues. Therefore,
>>>> before submitting patch, use LLM to scan problem in this issue.
>>> Got it, thanks.
>>>
>>>> I am writing a draft skill for reviewing patches of kernel Chinese
>>>> documentation.
>>> Nice! I've been trying "b4 review tui" these days and I also made some
>>> modifications to its pre-configured prompt to fit our specific
>>> workflows:
>>>
>>>     https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/misc/agent-reviewer.md
>>>
>>> b4 review tui 'agents' - AI-assisted review:
>>>
>>>     https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html#ai-assisted-review
>>>
>>> Sometimes my agent makes false alarms, but at other times it does manage
>>> to identify the issues that we have overlooked. This is probably also
>>> one of the reasons why the community is gradually becoming more
>>> accepting of LLMs.
>> Ah, this is interesting.
>>
>> My skill is to use LLM to search the patch name, use b4 to apply patches and
>> finally ask LLM to refer to how-to.rst and review the patch or patchset.
> As Chen-Yu mentioned before, I´ve basically trained myself to find
> almost any email in the lore archives manually. ;-)
>
> And yes, every time before I send a patch, I have an LLM check whether
> it follows the instructions in the how-to.rst.

Please take a look at my review:

https://lore.kernel.org/all/b45c6389-a048-4a94-8649-ab0c5a80fac2@hust.edu.cn/

The first comment is from Codex + ChatGPT.

And my skill complains the following warning:

https://lore.kernel.org/all/7724c093-cb99-490d-b632-1381e16962ff@hust.edu.cn/

>
>> And I think we could try to add our subsystem to sashiko. What we need to do
>> is to write some subsystem-related prompts.
> I was thinking about this a few days ago. I'd actually planned to talk
> to the Sashiko maintainer about it first, but I haven´t gotten around
> to it yet. As far as I know, though, Sashiko can currently only be
> enabled based on mailing lists; it can't filter or match patches
> specifically for the Chinese translation subsystem.
>
> Overall, though, I´m in favor of enabling Sashiko for us. Having an
> extra pair of automated eyes certainly doesn't hurt. That said, some
> settings may be worth discussing - for example, whether the Sashiko bot
> should be allowed to send review comments directly to the original patch
> thread.
Maybe we can do some tricks in the prompt. docs/zh_CN: is an obvious 
signal for us.
>
> Thanks!

