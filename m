Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [40.65.178.148])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A503A382F;
	Mon, 10 Aug 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=40.65.178.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350835; cv=none; b=HhvMXY1fU2laWyaSsfoFgHyE7CB8rxUfVl1DR2LdgZt10zcDMte0xzJPkdv6O2SYGxWeNEIsr8PqAsFa4t7Mo3wPnMHvVD92ZG5/sCKLOxlueUTBgO6bD2Yvq+CzgGO5SI2yQ41ZzZu4VGF61vn9XQswASyefJ5p5YXktG3SGs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350835; c=relaxed/simple;
	bh=9YJTFp8ZjddmUUczh/flIAYwsiRLAXmkF8rVBAmKZLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPbzF5GeDk71+7BpZ7uqUjBXLO+w6Vk6678kVwgdMxtrFubqezKNahPc+bWHvUKarvwIKhu1lzyCV8raa06DePyNSU0TizGOlzRUu+8qLqd3DsdqOQm5XSjF23cLltAZ2VaVXbOp6L5MnQK2tlJII0iQHFvDCprR+XZTm57V5u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=40.65.178.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAAn_jSwjHlqX5+kAA--.13009S2;
	Mon, 10 Aug 2026 16:32:48 +0800 (CST)
Received: from [192.168.1.31] (unknown [183.94.132.66])
	by gateway (Coremail) with SMTP id _____wB3QlarjHlqc_M1AA--.43489S2;
	Mon, 10 Aug 2026 16:32:45 +0800 (CST)
Message-ID: <46708bf1-8024-4241-bc35-890e05e8df0f@hust.edu.cn>
Date: Mon, 10 Aug 2026 16:32:13 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] docs/zh_TW: process: localize terminology in
 2.Process.rst
To: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
 Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-11-chenyou910331@gmail.com>
 <anDANHRAHb3wr2o8@wyuan.org>
 <CAKspUhL-1fh8o19aEvLzxVGMqvnFtmP0XksS7ni5QCYNBWqSKw@mail.gmail.com>
 <anXddDML5sw8loCQ@wyuan.org>
 <CAKspUhJryJv0ebW2cjGzcAPHRE4AtFjGKF7aZbpdS4R7AhXdkQ@mail.gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <CAKspUhJryJv0ebW2cjGzcAPHRE4AtFjGKF7aZbpdS4R7AhXdkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAn_jSwjHlqX5+kAA--.13009S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1ruw1fXrykKr1fWF4Durg_yoWrXryDpF
	WYka1Ika1DtrWYyF4Iyw48Za4Fvws3CFy5XryrJryvgrn5Kry2vFWayFWYgFZrZr4ftr1F
	vrWjq347GFyqv3DanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUvYsjDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/10/26 2:59 PM, 葉宸佑 wrote:
> On Fri, Aug 07, 2026 at 09:28:20PM +0800, Weijie Yuan wrote:
>> I might be more inclined to remain neutral, so I would prefer to hear
>> the opinions of others. Or we could take a look at how zh_CN and
>> jp_JP handle it.
> Fair enough -- I put that entry in the v3 glossary before seeing this,
> so let me pull it back to a description rather than a rule.
>
> Here is what the other locales look like, same measurement (a CJK
> character directly adjacent to an ASCII alphanumeric):
>
> zh_CN    有空格   3624 / 無空格  11022
> ja_JP    有空格    128 / 無空格     70
> ko_KR    有空格     93 / 無空格      0


For the translation projects in our club, the requirement is to have 
spaces between. It is better for readers.

However, zh_CN translation needs more translation than the format. Thus 
I don't force this rule.

Dongliang Mu

>
>
>> Or: for new articles, we can start to require spaces between.
> I am sympathetic, since spaces are what I would write myself. My worry
> is that it makes the tree inconsistent in a way that is visible within
> a single document -- a reader opening howto.rst would see one style in
> the paragraphs we have rewritten and another in the ones we have not.
> Right now the inconsistency at least correlates with nothing in
> particular.
>
> So I would suggest either:
>
>    (a) describe current practice in the glossary without making it a
>        rule, and revisit once we have more contributors, or
>    (b) agree on spaces as the target style, and let it spread naturally
>        as files get rewritten -- accepting mixed files in the interim
>
> I lean towards (a) for now, but I do not feel strongly. If you or the
> zh_CN side prefer (b) I will follow. Either way I can adjust the
> glossary in v4 or as a follow-up.

Me too. Agree on (a) for current situation.

My further plan is to format the mature translation with your strict 
rules folder by folder.

>
> Chen-Yu
>
> Weijie Yuan <wy@wyuan.org> 於 2026年8月7日週五 下午9:28寫道：
>> On Wed, Aug 05, 2026 at 02:48:35AM +0800, 葉宸佑 wrote:
>>> On Tue, Aug 04, 2026 at 12:22:12AM +0800, Weijie Yuan wrote:
>>>> Either: add a <space> before staging
>>>> Or: remove the <space> after staging
>>>>
>>>> [A] Greg Kroah-Hartman 目前負責維護staging樹。
>>>> [B] Greg Kroah-Hartman 目前負責維護 staging 樹。
>>>>
>>>> Which one do you prefer? I think the first option is more consistent
>>>> with the usage throughout the text.
>>> Sorry, I misread that as two separate changes. You are right that it
>>> should be one or the other.
>>>
>>> I went and counted across the whole zh_TW tree, matching a CJK
>>> character directly adjacent to an ASCII alphanumeric with and without
>>> a space:
>>>
>>>    without space: 2581
>>>    with space:     721
>>>
>>> 2.Process.rst itself is 69 without / 22 with. So [A] it is, both for
>>> the file and for the tree as a whole. Fixed in v3.
>>>
>>> For what it is worth, my own preference as a Taiwanese reader would
>>> have been [B] -- a space between CJK and Latin text is easier to read
>>> and is what most Taiwanese technical writing does nowadays. But the
>>> existing translations overwhelmingly do not, and this series is about
>>> terminology, not typography. Mixing the two would make it much harder
>>> to review.
>> Yes, I think a space between CJK and Latin text is more "proper", or
>> a more "universal" way.
>>
>>> That said, it is probably worth writing the rule down rather than
>>> leaving each contributor to guess. I would suggest:
>>>
>>>    - no space between CJK and ASCII (following existing practice)
>>>    - apply it to new translations and to paragraphs that are being
>>>      rewritten anyway
>> I might be more inclined to remain neutral, so I would prefer to hear
>> the opinions of others. Or we could take a look at how zh_CN and jp_JP
>> handle it.
>>
>> Or: for new articles, we can start to require spaces between.
>>
>>>    - do not go back and normalize existing files
>> Of course.

