Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03BF3C73EA;
	Mon, 13 Jul 2026 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935756; cv=none; b=stsPtvsdtV7P/qn60my2umP4+bFSq/chRJSC5VTFWFM2DNF455UUu1zA0RJ62w5xqo8pYcy3a2g/I0NoGmTFUxTs+ArnThbnOGPgJ/myVXz5+ryl8Sdiag9N9ztFoNh68kTFtQJmRGZmH14GIupV3wq8X3Mrhp8n8MjUYuubwjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935756; c=relaxed/simple;
	bh=XNZWqmQlP87BiuKuG+rjKx9Yh+XSW18z3uuLN91wQ7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdxxqalpsCZTLpJzsWHHoeY6jGGlkGWC9tcfCzRcbL2xd7/ELi6NtTREgtMJspuwIEjxsM8G53vsw+WB+9rrJ+IK+DH9sSrSwSZjRtiiH0x/odT4UyeQxleKX4M0g0CEZDpYaD6KcFuH4siHQagVQNHJZN3N87E0Zad3JbjzJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAA3DjXPslRqKYtnAA--.12081S2;
	Mon, 13 Jul 2026 17:41:35 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDX3+vLslRqP4jEAA--.15345S2;
	Mon, 13 Jul 2026 17:41:32 +0800 (CST)
Message-ID: <21179a3c-60d6-40b0-a5b1-594e989ef508@hust.edu.cn>
Date: Mon, 13 Jul 2026 17:41:31 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
To: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
 Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <seakeel@gmail.com>, Hu Haowen <2023002089@link.tyut.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
References: <CAKspUhJE-6NN7XnfG0iJAxEiV9PJx6pDbUEU5jgO__+qvuU5ug@mail.gmail.com>
 <alR4jP1-qlcQNma1@wyuan.org>
 <CAKspUhLGq_Hz-EM+Jc9ga=ih_0Ui7WzHZt+uKxMvuERsYB93Bg@mail.gmail.com>
 <CAKspUhLaCuBOHy9L5DMYBUq4kk_8hgFXfGHzhGXjvS_9iqNFUg@mail.gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <CAKspUhLaCuBOHy9L5DMYBUq4kk_8hgFXfGHzhGXjvS_9iqNFUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAA3DjXPslRqKYtnAA--.12081S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWfJw1fGF45Cr47Kw18GrWfKrg_yoWkWryDpF
	WYgF1aka1DJryfAw1Ikw48ZFyrtrZ3Grs8Zr95Wwn5ArZ0y3WxKr1xK34Y9F9rCr4rW3Wj
	vF4xK3s3ZayjyaDanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/13/26 5:03 PM, 葉宸佑 wrote:
> Here is the inventory I promised, from checktransupdate.py on mainline:
>
>    zh_TW:  51 translated files, all out of date
>            221 distinct English commits to catch up with
>
>      process/      14 files
>      admin-guide/  15
>      arch/         12
>      dev-tools/     5
>      filesystems/   3
>      cpu-freq/      1
>      index.rst      1
>
> For calibration I ran the same tool on zh_CN: 178 translated files,
> also all out of date, 639 distinct commits behind. So in terms of

For many files, the missing commits might not be needed as they might 
not affect the translation (such as typos in English).

Because this new commit style is developed recently by Yanteng and me, 
many translated documenation does not tranform to the corresponding styles.

> drift from the English originals, zh_TW is not in a categorically
> different state from zh_CN -- the real gap is coverage (51 vs 178
> files), not decay. That makes me more optimistic than the "two years
> of stagnation" framing suggests: many zh_TW files are only behind by
> a typo fix or two.
>
> (The ~3300 documents with no Chinese translation at all are out of
> scope for both locales, so I do not think that is the problem to
> solve first.)
Yes, we need more volunteers to translate English documents. However, 
translation is not attractive in the LLM era. :(
>
> One thing I noticed while reading the script: checktransupdate.py
> tracks the base commit accurately only when the translation commit
> message contains "update to commit HASH" (or "Update the translation
> through commit HASH"); otherwise it falls back to guessing from author
> dates. Adopting that convention for zh_TW commits from now on would
> make the tool's numbers reliable, and it costs nothing. Perhaps that
> could be part of the "more reasonable workflow" Weijie mentioned.


Yes, if zh_TW can apply this convention the workflow would be more 
reasonable.


>
> My suggestion for the first step is process/ (14 files): it is where
> new contributors land first, it is small enough to finish as one
> series, and it is where the terminology differences are most visible.
> I would fold the pending 8.Conclusion patch into that series and build
> the glossary from it.


For the todo list, you can check Jon's advice for new languages, e.g., 
Spanish. Search it from LKML

Dongliang Mu


>
> 葉宸佑 <chenyou910331@gmail.com> 於 2026年7月13日週一 下午2:35寫道：
>> Hi Dongliang, Weijie,
>>
>> Thank you both -- this is more support than I expected, and I am glad
>> to do this together.
>>
>>> Chen-Yu, I would like to serve as co-maintainers to help maintain zh_TW.
>>> [...]
>>> As discussed with Alex before, maybe zh_TW patches can first go to
>>> Alex's kernel tree and then push to Jon's tree. I am not sure if you are
>>> familar with the maintainer workflow. If not, this solution may be
>>> better for you to learn maintainer workflow.
>> To be honest: no, I am not familiar with the maintainer workflow yet --
>> so far I have only been on the contributor side. So routing zh_TW
>> patches through Alex's tree first sounds like the right arrangement to
>> me, both for reliability and so that I can learn the workflow properly
>> before taking on more. Alex, if you are fine with this, thank you in
>> advance.
>>
>>> I suggest that we could try out the provisional plan for about one or
>>> two months (depends), and then make a formal change.
>> Agreed. A trial period before touching MAINTAINERS is fair -- it lets
>> the work speak first. I will send the MAINTAINERS patch when you both
>> feel the arrangement has proven itself.
>>
>>>    * Considering that English documents are changing so rapidly, and even
>>>      simplified Chinese cannot keep up with them immediately. I suggest
>>>      we start working on catching up with simplified Chinese right now,
>>>      which seems like a good place to begin.
>> This matches what I had in mind, and it also answers Alex's concern:
>> zh_TW should track zh_CN in structure and coverage, and differ only in
>> terminology. I will start by running checktransupdate.py over zh_TW to
>> get a concrete inventory of what is stale and how far behind we are,
>> and share the result here so we can prioritize together.
>>
>>> re-translation may be more efficient.
>> Agreed for the badly outdated files -- patching a two-year-old
>> translation line by line is likely more work than translating the
>> current text afresh. The inventory should tell us which files fall
>> into which category.
>>
>>> https://zh.wikibooks.org/wiki/%E5%A4%A7%E9%99%86%E5%8F%B0%E6%B9%BE%E8%AE%A1%E7%AE%97%E6%9C%BA%E6%9C%AF%E8%AF%AD%E5%AF%B9%E7%85%A7%E8%A1%A8
>>>
>>> Is it comprehensive? I don't know. Perhaps we could add some specific
>>> reference tables related to the Linux Kernel on top of it.
>> As a native speaker: it is a reasonable general reference, but it is
>> not kernel-specific, and some entries are dated or not what people
>> actually write in Taiwan today. I would rather build the glossary
>> bottom-up from the terms that actually appear in the kernel docs
>> (軟體/軟件, 介面/接口, 記憶體, 行程, 核心, 佇列, ...), and use the
>> wikibooks table only as a cross-check. I will include the glossary as
>> part of the first terminology series so it can be reviewed like any
>> other patch.
>>
>>> Perhaps I can handle most of the operation and maintenance tasks of
>>> chore, giving Chen-yu more time and concentration to focus on the actual
>>> translation work.
>> That would help a lot, thank you. It also sounds like a natural split:
>> you on process and monitoring, me on the translation and the zh_TW
>> terminology judgement.
>>
>> One last thing about the patch that started all this: rather than
>> keeping the v2 for 8.Conclusion pending, I would suggest dropping it
>> and folding its changes into the terminology series, so the fixes
>> land in one consistent batch. Any objection?
>>
>> Thanks,
>> Chen-Yu
>>
>> Weijie Yuan <wy@wyuan.org> 於 2026年7月13日週一 下午1:33寫道：
>>> On Mon, Jul 13, 2026 at 10:44:12AM +0800, 葉宸佑 wrote:
>>>> Hi Weijie,
>>>>
>>>>> I suspect that some contributors would run the get_maintainers.pl script
>>>>> or b4 prep --auto-to-cc, so they did not cc Alex, as they didn't know
>>>>> the current situation. Because I noticed that for both two versions,
>>>>> Chen-yu didn't cc Alex or Dongliang or Yanteng. Am I right, @Chen-yu? ;-)
>>>> Yes, exactly. For both v1 and v2 I ran get_maintainer.pl, which only
>>>> lists Hu Haowen and the mailing lists for zh_TW files, so Alex and the
>>>> zh_CN team were never on cc.
>>> Right, let's note this situation down. We'll deal with it after we come
>>> up with the final solution.
>>>
>>>>> Given that this document has not been maintained for ~2 years and these
>>>>> patches to the terminology actually don't have much significance, it
>>>>> might be more appropriate to directly declare the status of Traditional
>>>>> Chinese as "Orphan" provisionally for now, and remove it directly in the
>>>>> near future, until Hao Wen's return and opinion. Or maybe, waiting for a
>>>>> new good soul to take over, which is unpredictable.
>>>> Before it comes to that: I would like to step up and help carry zh_TW
>>>> forward. I am a native zh_TW speaker from Taiwan, and I understand
>>>> this means staying with it, not a one-off effort.
>>> Nice and thanks. Frankly speaking, At the very beginning, I did consider
>>> saying that I also wanted to take over, and I wished I could. However,
>>> considering that I was certainly not familiar with the traditional
>>> Chinese terms used in Taiwan (although I knew some, that was all), I
>>> finally chose to be speak more conservatively.
>>>
>>>> Dongliang, since you kindly offered to help review zh_TW patches:
>>>> would you be open to doing this together -- either as co-maintainers,
>>>> or with me listed as a reviewer (R:) first if that is a more
>>>> reasonable starting point for a newcomer?
>>> Since I was the one who shamelessly initiated this discussion, I
>>> definitely have the obligation to do something. See below...
>>>
>>>>>> To avoid scattering our efforts, I suggest we minimize fragmentation
>>>>>> as much as possible. When it comes to technical documentation
>>>>>> translation, not literary translation, a straightforward, unadorned,
>>>>>> and free from misunderstandings is the best translation and easy to
>>>>>> maintain. Let's keep thing simple, unless sth is really necessary.
>>>> Alex, I think this concern is fair, and I have no intention of
>>>> forking the translation effort. The scope I have in mind is
>>>> deliberately narrow: keep zh_TW aligned with zh_CN in structure and
>>>> coverage, and localize only where terminology genuinely differs
>>>> (e.g. 軟體 vs 软件, 介面 vs 接口) -- exactly the kind of differences
>>>> you mentioned. Plain, accurate technical translation, no literary
>>>> rewriting.
>>> Exactly, before sending my first email here, I had already thought about
>>> the following approach, what do you think?
>>>
>>>    * Considering that English documents are changing so rapidly, and even
>>>      simplified Chinese cannot keep up with them immediately. I suggest
>>>      we start working on catching up with simplified Chinese right now,
>>>      which seems like a good place to begin. (ok... seems exactly what you said ;-)
>>>
>>>> Weijie, as a first concrete step I will prepare a terminology series
>>>> (rather than one-word-at-a-time patches, as you suggested) covering
>>>> the existing process/ documents, and use it to build a small glossary
>>>> that future patches and reviews can follow.
>>> I used to read this:
>>>
>>> https://zh.wikibooks.org/wiki/%E5%A4%A7%E9%99%86%E5%8F%B0%E6%B9%BE%E8%AE%A1%E7%AE%97%E6%9C%BA%E6%9C%AF%E8%AF%AD%E5%AF%B9%E7%85%A7%E8%A1%A8
>>>
>>> Is it comprehensive? I don't know. Perhaps we could add some specific
>>> reference tables related to the Linux Kernel on top of it.
>>>
>>> On Mon, Jul 13, 2026 at 11:49:07AM +0800, Dongliang Mu wrote:
>>>> Chen-Yu,I would like to serve as co-maintainers to help maintain zh_TW. The
>>>> script - tools/docs/checktransupdate.py can seamlessly work on zh_TW. This
>>>> can help track the missing changes.
>>> I would also like to take a job ;-) while my current contributions are
>>> not sufficient. And wish soon.
>>>
>>>> As discussed with Alex before, maybe zh_TW patches can first go to Alex's
>>>> kernel tree and then push to Jon's tree. I am not sure if you are familar
>>>> with the maintainer workflow. If not, this solution may be better for you to
>>>> learn maintainer workflow.
>>> I suggest that we could try out the provisional plan for about one or
>>> two months (depends), and then make a formal change.
>>>
>>> Before we make a formal change, I will monitor the list (CN & TW), If
>>> there is any situation like this patch which is not sent correctly, I
>>> will handle it promptly.
>>>
>>> OK, I consider myself quite familiar with the development process and
>>> the maintenance process, mainly from Git (seems more complicated).
>>> Perhaps I can handle most of the operation and maintenance tasks of
>>> chore, giving Chen-yu more time and concentration to focus on the actual
>>> translation work. But this can be further discussed.
>>>
>>> Thanks,
>>> Weijie

