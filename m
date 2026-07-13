Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F403B3E5EDC
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938224; cv=none; b=exoliJahHQ7n6lgMqCphKJQBONm7s/JGbKn+JYa6/s1N23T6QjkXnW+nWzDskti1F0vjitnB6UivtJcKTa/xye+Rwo6vlbfUJS8QU+6ML+dLoF3PnoMNCTjfmGQX/+Gd6Hb09dfCIerHjs8BOXAldxZTdGcAejBWPtWn7k18T6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938224; c=relaxed/simple;
	bh=X0+XMzrxqaNIjxn3ACkXJW2HMnQm0D74IPDGscDRj0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LNFdDZbgrUwGRiYAlZi8DFxFkumYXcgUsB/niIFHjbKAIoLXtRMkkpTDACgZTkcFdjYwgkBUj7LYk/tQtpmsNho99GPz8XtN7xIWh+7D/Kv3i6fwzVeRoKCWbTDMH9B/tZWX3hygTbAc9w8MB9diR4HokwQsGhXqQbdPyYkK3sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=IDi6ruMa; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="IDi6ruMa"
Date: Mon, 13 Jul 2026 18:23:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783938220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=kBQsZiO4pXLG8+Sfl++9cXh+JCOexq5xeFR3kWiAvx4=;
	b=IDi6ruMa2Ct4sxZlDbnBwizMcedXyUsJNjXzmMKM/Jnjdth9pdiQnGkiEEWhhA6GkbS2Wr
	ot8ZlQKx4Yo5xAF2IUmNPUPkya7OXoQPMiZCNzd+qTJtQCXgU7uQOxWJdjV2ecDYVcM8Vo
	lwWWF1AXLO8I9DdxK+rLDVm//kVTVA4k/qQeBtbGcNPX2E8VMcdFRJY1i+7GC9HctgZj5H
	nIUKvqXssxXPMg3N+ZPZ7YVyZ6iys00YFEEtqvv7kGaLHUv4OG2WSzz8+NtO2agVGZsklQ
	gF7ZShba1dJMKTfmvHWMO3yommPAVHF3rq8S5J/HvAx2QBC+WMnMxbw5LCL59w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <seakeel@gmail.com>, Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
Message-ID: <alS8lLglyMqJEYZ4@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21179a3c-60d6-40b0-a5b1-594e989ef508@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Mon, Jul 13, 2026 at 02:35:22PM +0800, 葉宸佑 wrote:
> Hi Dongliang, Weijie,
> 
> Thank you both -- this is more support than I expected, and I am glad
> to do this together.
> 
> > Chen-Yu, I would like to serve as co-maintainers to help maintain zh_TW.
> > [...]
> > As discussed with Alex before, maybe zh_TW patches can first go to
> > Alex's kernel tree and then push to Jon's tree. I am not sure if you are
> > familar with the maintainer workflow. If not, this solution may be
> > better for you to learn maintainer workflow.
> 
> To be honest: no, I am not familiar with the maintainer workflow yet --
> so far I have only been on the contributor side. So routing zh_TW
> patches through Alex's tree first sounds like the right arrangement to
> me, both for reliability and so that I can learn the workflow properly
> before taking on more. Alex, if you are fine with this, thank you in
> advance.
> 
> > I suggest that we could try out the provisional plan for about one or
> > two months (depends), and then make a formal change.
> 
> Agreed. A trial period before touching MAINTAINERS is fair -- it lets
> the work speak first. I will send the MAINTAINERS patch when you both
> feel the arrangement has proven itself.

Yeah, of course, this is not questioning your abilities at all. Winning
the trust of the community step by step in a gradual manner is
definitely better. This is something I have once again realized while
going through the lore archives of how the Git localization was done. By
reading their historical exchanges (between Junio C Hamano and Jiang
Xin), we might be able to obtain some practical experience and
precautions regarding the process. But this is not something that needs
to be considered at present.

> > https://zh.wikibooks.org/wiki/%E5%A4%A7%E9%99%86%E5%8F%B0%E6%B9%BE%E8%AE%A1%E7%AE%97%E6%9C%BA%E6%9C%AF%E8%AF%AD%E5%AF%B9%E7%85%A7%E8%A1%A8
> >
> > Is it comprehensive? I don't know. Perhaps we could add some specific
> > reference tables related to the Linux Kernel on top of it.
> 
> As a native speaker: it is a reasonable general reference, but it is
> not kernel-specific, and some entries are dated or not what people
> actually write in Taiwan today. I would rather build the glossary
> bottom-up from the terms that actually appear in the kernel docs
> (軟體/軟件, 介面/接口, 記憶體, 行程, 核心, 佇列, ...), and use the
> wikibooks table only as a cross-check.

Ah got it, so this is why we need a local to guard a pass ;-)

> I will include the glossary as part of the first terminology series so
> it can be reviewed like any other patch.

Very much appreciated.

> > Perhaps I can handle most of the operation and maintenance tasks of
> > chore, giving Chen-yu more time and concentration to focus on the actual
> > translation work.
> 
> That would help a lot, thank you. It also sounds like a natural split:
> you on process and monitoring, me on the translation and the zh_TW
> terminology judgement.
> 
> One last thing about the patch that started all this: rather than
> keeping the v2 for 8.Conclusion pending, I would suggest dropping it
> and folding its changes into the terminology series, so the fixes
> land in one consistent batch. Any objection?

I definitely agree. Batching them would be easier to review and
retrospect, and it's better to track on the list.


On Mon, Jul 13, 2026 at 05:03:12PM +0800, 葉宸佑 wrote:
> Here is the inventory I promised, from checktransupdate.py on mainline:
> 
>   zh_TW:  51 translated files, all out of date
>           221 distinct English commits to catch up with
> 
>     process/      14 files
>     admin-guide/  15
>     arch/         12
>     dev-tools/     5
>     filesystems/   3
>     cpu-freq/      1
>     index.rst      1
> 
> For calibration I ran the same tool on zh_CN: 178 translated files,
> also all out of date, 639 distinct commits behind. So in terms of
> drift from the English originals, zh_TW is not in a categorically
> different state from zh_CN -- the real gap is coverage (51 vs 178
> files), not decay.

> That makes me more optimistic than the "two years of stagnation"
> framing suggests: many zh_TW files are only behind by a typo fix or
> two.

Then I'm exaggerating, oops.

> (The ~3300 documents with no Chinese translation at all are out of
> scope for both locales, so I do not think that is the problem to
> solve first.)

Yes, and I suspect that some of the documents might not actually need to
be translated? I will conduct some more investigations.

> One thing I noticed while reading the script: checktransupdate.py
> tracks the base commit accurately only when the translation commit
> message contains "update to commit HASH" (or "Update the translation
> through commit HASH"); otherwise it falls back to guessing from author
> dates. Adopting that convention for zh_TW commits from now on would
> make the tool's numbers reliable, and it costs nothing. Perhaps that
> could be part of the "more reasonable workflow" Weijie mentioned.

Yes, and that's documented in here,

https://docs.kernel.org/translations/zh_CN/how-to.html

so later zh_TW could consider making one.

> My suggestion for the first step is process/ (14 files): it is where
> new contributors land first, it is small enough to finish as one
> series, and it is where the terminology differences are most visible.
> I would fold the pending 8.Conclusion patch into that series and build
> the glossary from it.

Agreed. The significance of the initial stage for newcomers is
self-evident. Of course, the English documents have undoubtedly been
constantly revised over time. So for these two Chinese documents, this
part is of crucial importance. After all, this is where almost everyone
begins to read, including me. So when I found that there was a Chinese
translation here, I was very happy ;-)

--------------------------------------------------------------------------

On Mon, Jul 13, 2026 at 05:41:31PM +0800, Dongliang Mu wrote:
> 
> On 7/13/26 5:03 PM, 葉宸佑 wrote:
> > Here is the inventory I promised, from checktransupdate.py on mainline:
> > 
> >    zh_TW:  51 translated files, all out of date
> >            221 distinct English commits to catch up with
> > 
> >      process/      14 files
> >      admin-guide/  15
> >      arch/         12
> >      dev-tools/     5
> >      filesystems/   3
> >      cpu-freq/      1
> >      index.rst      1
> > 
> > For calibration I ran the same tool on zh_CN: 178 translated files,
> > also all out of date, 639 distinct commits behind. So in terms of
> 
> For many files, the missing commits might not be needed as they might not
> affect the translation (such as typos in English).
> 
> Because this new commit style is developed recently by Yanteng and me, many
> translated documenation does not tranform to the corresponding styles.
> 
> > drift from the English originals, zh_TW is not in a categorically
> > different state from zh_CN -- the real gap is coverage (51 vs 178
> > files), not decay. That makes me more optimistic than the "two years
> > of stagnation" framing suggests: many zh_TW files are only behind by
> > a typo fix or two.
> > 
> > (The ~3300 documents with no Chinese translation at all are out of
> > scope for both locales, so I do not think that is the problem to
> > solve first.)
>
> Yes, we need more volunteers to translate English documents. However,
> translation is not attractive in the LLM era. :(

OK, the AI thing has still inevitably come up ;-)

I can spend an entire afternoon reading the discussion emails and
articles about AI/LLM in the community ;-)

  Sidenote:
  I noticed that there seems to be renewed discussion in the English
  document section about removing the "assisted-by" trailer. It would be
  a good idea to make a note of this and see if we need to update any
  relevant sections.

However, personally speaking, I still prefer to read the official
website's documents. It was written by the developers, and of course it
is more authoritative than the content produced by AI/LLM. And sometimes
the information provided by the AI/LLM is a bit behind the information
on the official website kernel.org.

> For the todo list, you can check Jon's advice for new languages, e.g.,
> Spanish. Search it from LKML

Thanks, I'll learn about it too.
