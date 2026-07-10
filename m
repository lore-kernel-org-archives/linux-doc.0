Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABAD2BDC28;
	Fri, 10 Jul 2026 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692309; cv=none; b=i7wDMUbmy1tRD9VpwI3aMvfO2SyjVyztIXBX4SOBvfvD1eSpc2nXRn6qbKgK9WyXYqY4f7fecowNrWAQG8P1Rz1kZ9rugsRGW/nlTR8E7jmVWbYn6rzhGETEhowIH1ewDDOwtR0R1tFcUY1plIWvdi74OL14HSy1dmXkh3dhJjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692309; c=relaxed/simple;
	bh=3d0heJyLIz3x/emPVA5PtIBWq1mdlvJB2VVFSbQqcDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+hx+l6kWS/FyRI3asjJ1P0CDyj+ePZeqHNWxJA9hozmRhl8TG0ACLW+EkkwO1wbPyjTecAKVuUxAHVq9+0wb8cR2rrI3eDjRY3aLaUVXrDBsJZWTuDe9/yyk48wma5+kkUA8pE1wZlcybZO+24OAm3P2rbYJw6lhDd+wJPHqgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAC3jjXY+1BqX+phAA--.3147S2;
	Fri, 10 Jul 2026 22:04:08 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAXEMTW+1BquX5yAA--.56064S2;
	Fri, 10 Jul 2026 22:04:07 +0800 (CST)
Message-ID: <399a9ec1-76f0-4b5f-a18d-049fba813cb5@hust.edu.cn>
Date: Fri, 10 Jul 2026 22:04:06 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add docs-next checkout workaround
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
 <ce715802-1b46-4ba6-b388-39260f217ba3@hust.edu.cn>
 <alD1b7O6KaIMqWpa@wyuan.org>
 <f637a819-5596-4cd7-b2fe-be7293eedf14@hust.edu.cn>
 <alD6UJw1Y2VNK3x1@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <alD6UJw1Y2VNK3x1@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HwEQrAC3jjXY+1BqX+phAA--.3147S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4kGF45KFy7Cw4kXF1fWFg_yoW8Xryxpr
	45tFyIkFs5JrW3ta1xKw1fZF1rK345Jw4UJFn8Xayvkwn0gF1rXF4ftF4F9FyDZa18Ww10
	vw42gasrWF4YvaDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmYb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU3oqcUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/10/26 9:57 PM, Weijie Yuan wrote:
> On Fri, Jul 10, 2026 at 09:44:45PM +0800, Dongliang Mu wrote:
>>>>> --- >8 ---
>>>> Is this a special mark for LKML? If I understand correctly, the following
>>>> should be the patch content.
>>> Yes, the following is the commit message body.
>>>
>>> You can apply this patch by "git am -c" or "git am --scissors", which
>>> means: Remove everything in body before a scissors line (see git-mailinfo[1]).
>>>
>>> https://git-scm.com/docs/git-am#Documentation/git-am.txt---scissors
>>>
>>> Git community sometimes use it, for the cases if you want to swap the
>>> actual commit message and the supplementary information.
>> Understood.
> Sorry for any confusion.
>
>>>> This would make the envionment preparation more difficult. My suggestion is
>>>> to ask maintainers of some mirror sites to sync this repo like us.
>>>>
>>>> Dongliang Mu
>>> Makes sense. Could I kindly ask, for example, Tsinghua tuna team to
>>> mirror our repo, on behalf of our Chinese document team? I'm afraid they
>>> are unlikely to consider my request in my individual capacity. ;-)
>> I can help contact TUNA maintainers.
>>
>> Dongliang Mu
> That would be great! Apparently your words carry more weight than mine
> ;-) So do you mean that I just need to wait quietly for your good news?

Yes, I have explained the situation to TUNA maintainers and asked for 
repository syncing. Let's wait for their response.

Dongliang Mu

>
> Appreciate it!
>
> Thanks,
> Weijie

