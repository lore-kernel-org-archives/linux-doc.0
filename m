Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5061B6D1A;
	Fri, 21 Aug 2026 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317142; cv=none; b=a5thpYQX0L+eyEiHfRah9m/T7QIFwzrubUYhGCF6/lEYsa/KypCkjKCRf5BuXvChQzmCwFihlEK7Sgj1YqhgKZfVPmF6/y23sIly3pfYXsq1O/xCF2r1xTqx8W4oAXgCWTNEfGhJh02UsbogiiewoYo1nCqUGprN1eXSvQ0tOjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317142; c=relaxed/simple;
	bh=SWjhDJZRYkGCczAxHecWmwKtunyCE/Hi+dbuhKYKeiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcLrjiTkUOEIPXQzDaK7U8YHIIbgU5FJ+n5WzId6aU20jkEArzxrVfMClY2N6gMZmrrA5xmgRxA0YD8pSV9m4UmxxgUg06jL9vElKImUVeAP96alOUti1TSVFylWLA1OgwvrHcjHwzyBODsXTMigGuhz4pJ5QjUfMOT6niFPJLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAC3v7NOS4hqxvC9AA--.12802S2;
	Fri, 21 Aug 2026 20:57:50 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXdNFLS4hqT+ICAA--.3346S2;
	Fri, 21 Aug 2026 20:57:49 +0800 (CST)
Message-ID: <771c1b11-f7d3-4a1b-a26a-b20187eeae59@hust.edu.cn>
Date: Fri, 21 Aug 2026 20:57:46 +0800
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
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <aohJLNK5Cqv1iMLd@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HwEQrAC3v7NOS4hqxvC9AA--.12802S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxXr18CFWDKFyUGw47AFWxCrg_yoW5GFy7pa
	ySk3ZxKrs5try7AwsruF1kAFyxta1DAr9xWr95Wr1kZFn8XF97tF4Svw4Y9ay7WrykuF4j
	vr429ryIgayDZ37anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bIiiDUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/21/26 8:48 PM, Weijie Yuan wrote:
> On Fri, Aug 21, 2026 at 08:17:06PM +0800, Dongliang Mu wrote:
> [...]
>>> (I definitely won't admit that the log file annoyed me a few times
>>> because I accidentally included it with 'git add .' and then had to 'git
>>> commit --amend' right after) ;-)
>> My experience is to not use 'git add .'. In Linux, hidden files are not
>> listed by default.
> Yes, I was being lazy to type the full pach/full file name, oops.
>
> While hidden files are not listed by default on Linux, thankfully the
> kernel source tree ignores .* via .gitignore. But 'git add .' is indeed
> a bad habit.
>
> Btw, git commit -v, or setting commit.verbose = true, can really save
> one at the last minute. (as mentioned in our how-to doc) And sadly I
> actually happened to use another computer to write patches last night,
> which I hadn't configured it. XD

Actually these labor-tensive works should be done by LLM. This is one of 
the right directions of LLM usage.

You can write a simple skill to help you complete these works.

>
> [...]
>>>>> Btw I've been trying to know more about Sphinx and kernel-docs, hope my
>>>>> mistake won't happen again.
>>>> That change can fix problem. The underlying problem is RST syntax. Maybe you
>>>> can have a look at this or query it in the LLM.
>>> Absolutely. I did have relatively little experience writing rst before.
>>> But that's definitely no excuse - I'll try to pick it up quickly.
>> LLM is really useful to capture some syntax and semantics issues. Therefore,
>> before submitting patch, use LLM to scan problem in this issue.
> Got it, thanks.
>
>> I am writing a draft skill for reviewing patches of kernel Chinese
>> documentation.
> Nice! I've been trying "b4 review tui" these days and I also made some
> modifications to its pre-configured prompt to fit our specific
> workflows:
>
>    https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/misc/agent-reviewer.md
>
> b4 review tui 'agents' - AI-assisted review:
>
>    https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html#ai-assisted-review
>
> Sometimes my agent makes false alarms, but at other times it does manage
> to identify the issues that we have overlooked. This is probably also
> one of the reasons why the community is gradually becoming more
> accepting of LLMs.

Ah, this is interesting.

My skill is to use LLM to search the patch name, use b4 to apply patches 
and finally ask LLM to refer to how-to.rst and review the patch or patchset.

And I think we could try to add our subsystem to sashiko. What we need 
to do is to write some subsystem-related prompts.

Dongliang Mu

>
> Thanks!

