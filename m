Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B567426D18;
	Fri, 10 Jul 2026 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689377; cv=none; b=Ad0xUlUgAhnUEvXoiwcguoCQoogMyEPvDNBlzNQTWIFC9TVFIbIbeE8G9/Uc2gOf9M7KJcnFz1wwk3SjMBorbp9rAKFIYjMMz8+mi1GjDeyJZlqcgSlthTygojm6/k0ywv+JvtnGME8e7nTE2AcsLMvSCSL0pDUeBJu1i9zi8n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689377; c=relaxed/simple;
	bh=iYguRLx+dJrHouVhIoMyiUCvBAD3DDBK50T3tmz7lLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rSJy4zWJpcVEGAMyUwg6pXeAMzfrQQRInfUTD556uuntMOu1O0h3rzAA68s0y7Dc0VZOJ76X/Dj3eT7vhTQdpTDnH51bJEGokYeMgFn2Pydphvarx23cwJzQr9zDdwDqk5u0+6p6OcNu66cyYf8+wFEkf6hS21XDsmFD1keI4eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAB3TjVh8FBq2tNhAA--.43770S2;
	Fri, 10 Jul 2026 21:15:13 +0800 (CST)
Received: from [100.81.40.43] (unknown [222.20.126.216])
	by gateway (Coremail) with SMTP id _____wA3EOhg8FBqjxW0AA--.31407S2;
	Fri, 10 Jul 2026 21:15:12 +0800 (CST)
Message-ID: <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
Date: Fri, 10 Jul 2026 21:15:12 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
To: Weijie Yuan <wy@wyuan.org>, =?UTF-8?B?6JGJ5a645L2R?=
 <chenyou910331@gmail.com>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <alDs8bnIK8bWApIr@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAB3TjVh8FBq2tNhAA--.43770S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy5Ar43Xr13Xr1rWw17Wrg_yoW5Wrykpr
	WfK3WUKF40yayaywn7tw15ZF1rCa95K3y5JF1rWrnxAas8tF9aqFWIka1Y9a45urs3Ga12
	vr45ur9xCas8ArJanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUvYsjDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/10/26 9:00 PM, Weijie Yuan wrote:
> On Fri, Jul 10, 2026 at 04:49:30PM +0800, 葉宸佑 wrote:
>> Gentle ping.
>>
>> This v2 addressed the review comments from Alex and Dongliang.
>> Is there anything else I should improve, or is it queued somewhere
>> I might have missed?
> Hi Chenyou,
>
> I think currently having Alex apply your patch is a temporary measure,
> because the maintainer of traditional Chinese seems unlikely to be
> available in the near future.

I can help review patches in traditional Chinese. With the help of LLM, 
it is fine for me to handle local terminologies in zh_TW.

Dongliang Mu

>
> Outside the patch itself, I noticed that Traditional Chinese is actually
> in a state of stagnation, which makes me think that receiving such
> patches is a temporary solution rather than a long-term fix.
>
> As Jonathan said, "...But there does come a point where a translation
> is so obsolete that it does more harm than good and there are no
> prospects of it being updated."
>
> So, after a period of about two years of stagnation, the Traditional
> Chinese documents seem to have really reached an unreadable state. This
> is something we don't want to see, but we must accept the reality and
> then take action. Please note that I have no intention of offending
> Haowen. On the contrary, I am definitely grateful for all that he has
> done.
>
> I did some interactions with one of the L10n Taiwan team (who are
> involved with Git L10n) [1] in their telegram channel a few days before,
> but sadly they said the biggest problems are:
>
>    1. No one is willing to take over. (hey, I totally understand)
>    2. There are different opinions on translation. (I don't know the
>       deeper details)
>
> Besides, I'm also very curious about how exactly we define the position
> of traditional Chinese or zh_TW. From my rough observation, the existing
> documents merely performed a simple conversion between simplified and
> traditional Chinese, without taking into account the local expressions
> specific to Taiwan. Therefore, that's why we are receiving the patch
> here and commit aba18be23f14 ("docs/zh_TW: replace 接口 with 介面 in stable-api-nonsense.rst")
> (Please correct me if I'm wrong, as I have not got into many
> translated pages)
>
> So if we are doing zh_TW instead of a direct simplified and traditional
> Chinese conversion, I don't think we can handle this properly without
> the help of Taiwanese friends.
>
> Of course, I feel quite ashamed that I'm saying these above here without
> having made any substantial contributions to this community, sorry.
>
> Could we discuss this matter in another thread? Very sorry Chenyou, what
> I'm saying is completely unrelated to the patch itself.
>
> Finally, I would like to express my sincere gratitude to Haowen.
>
> Thanks,
> Weijie
>
> [1] https://l10n.tw/

