Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01DE440636;
	Fri, 21 Aug 2026 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314685; cv=none; b=ewT0APvrTGFzCNGa7jNevvZssygFy0PWkY76iMak6gt28O8lhMn2Ss0ZjhwRy8I4ueySv8rDC287aZWaOE8kOloQ26QM+bvE/R/K01W45Zf5Uh89xMQE1EihuM2/ElPgwl2ZG5lMCYQw8zlUX4buzty+omyVmy3D79qhBdhh2k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314685; c=relaxed/simple;
	bh=j91qUGXSoVoVK5oTg4J+tPd8tWH7B5Ly7ci/7Il6c1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VFlAoU4Z2McxmyiwGCjouVr+iVAepe8s4Bv61e+euZNNgL6jlRsfXKFCwlq7rT9ISH3fFLWmLxp60Ukvewr1RFFgDMmiXp40MbsgWxVvPgdOaaS16M0PudIV8faqgcIBMF5sLz/hM3LQs0M6ax7isUWexztpKD/4aohVwFvQDZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrABXfaLFQYhqCI2qAw--.15510S2;
	Fri, 21 Aug 2026 20:17:09 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wC3sKPCQYhqnLECAA--.4439S2;
	Fri, 21 Aug 2026 20:17:08 +0800 (CST)
Message-ID: <0e437b53-5a44-406f-a482-518a6c09f7e2@hust.edu.cn>
Date: Fri, 21 Aug 2026 20:17:06 +0800
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
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <aog87UzDIz20XzU_@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABXfaLFQYhqCI2qAw--.15510S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4UGw4kZr4kKryfCFy5XFb_yoW5XFyxpa
	93Ka4DtFsYyasIya97Za1fAryjyw1fG3y7WF98Xr1rZan8u3Z3KF1ftF4Y9Fy3Wws5Kw4U
	Xr4UtFyFkwn8Za7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bIiiDUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/21/26 7:56 PM, Weijie Yuan wrote:
> On Fri, Aug 21, 2026 at 07:18:56PM +0800, Dongliang Mu wrote:
>>> [...]
>>> Thanks for emphasizing this. While I do remember I used "make cleandocs
>>> && make htmldocs", and checked among those long lines of red warning
>>> output to find anything caused by my commit, I indeed didn't notice this
>>> warning appearing at the early stage of the compilation.
>>>
>>> It seems that I need to have my eyes checked soon. ;-)
>>>
>>> Apologize for my recklessness.
>>>
>>> Even so, do we have any way to distinguish these long-standing warnings
>>> from the new warnings that appear during compilation? In fact, every
>>> time I was worried that I might not have noticed the newly appeared
>>> warning. Unfortunately, this time it really happened. (For example,
>>> setting a new color? for new warnings?) Do you have a better idea or
>>> tips for this?
>> My suggestion is to keep the log in each file, and you can easily observe
>> the diff. Otherwise, even I can ignore some warnings.
> Ah, makes sense! I was actually wondering earlier why we need to put
> this log in the directory instead of just keeping it in the CLI.
>
> (I definitely won´t admit that the log file annoyed me a few times
> because I accidentally included it with 'git add .' and then had to 'git
> commit --amend' right after) ;-)
My experience is to not use 'git add .'. In Linux, hidden files are not 
listed by default.
> Very useful, thanks!
>
>> And many contributors are coming together to fix those warnings. If they are
>> done, all new warnings are easily captured. Let us do more contribution to
>> help this.
> Yeah, eliminating these warnings at their root is the straightforward
> solution.
>
> And that's exactly what Jon expects:
>
> Kernel Recipes 2019 - Kernel documentation: past, present, and future
> #Build warnings
>
> https://youtu.be/1LuAIUKqKDk?t=876&si=XgHhHtukyjyDdtzF
>
> It'd certainly be worth spending some time with folks from those
> subsystems to get these warnings fixed once and for all.
Yes, you are right. Eliminating these warnings need collaboration from 
other subsystems.
>
>>> Btw I've been trying to know more about Sphinx and kernel-docs, hope my
>>> mistake won't happen again.
>> That change can fix problem. The underlying problem is RST syntax. Maybe you
>> can have a look at this or query it in the LLM.
> Absolutely. I did have relatively little experience writing rst before.
> But that's definitely no excuse - I'll try to pick it up quickly.

LLM is really useful to capture some syntax and semantics issues. 
Therefore, before submitting patch, use LLM to scan problem in this 
issue. I am writing a draft skill for reviewing patches of kernel 
Chinese documentation.

Dongliang Mu

>
> Thanks!

