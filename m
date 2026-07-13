Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA9BEACD
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 05:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783920810; cv=none; b=NM1lli8VwVP3qdeuDS++cSQ4vRX7O/SVS+4luaGEMQzoUJhMu3vQTTPT6DMRY7PAQWZ/S2TVQAaqhAGaB3uKt1pDD8nGppJO6laGjaGPHoYz1jxR1J/Ucvzcpaps+AIw9OGcP3kshB5X7EAXErAZwUw59l4OCrOiOoIDj0nx5pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783920810; c=relaxed/simple;
	bh=Vcb1QZKprBZLnWlD8gxNPaklfBrvhzkEN19ilO+gTXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PdbTWfPpB8ZUmUWgO8VBguFZiDZbEWiRhDkFIr8brK8pCq1hLnul7GdMqQLdw4gkKnZs2jyjzsYT80X+P6QoQI/JqZdGawActbU1s1TOz6nUuCg8+PoP5DwPZzX75A3LAbgL6QPnNppAIg1tXgnsT+e0Qix0/KXWEQEzYP5MIh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=TonmDR4I; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="TonmDR4I"
Date: Mon, 13 Jul 2026 13:33:00 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783920796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=GLSc1WD8pt4Q/CEJZXI3ARsBur6NPgwJp0kRz2azY9Y=;
	b=TonmDR4In6ncR9HzP+FteX64FQMuk/RZZmCtpnAWzKSCZZz/YXMUD4Y8kVaCEfgJZjl2y1
	g9bksL0bbmhGfa3TMr/bBGQcyGRjos53B9H2yslxDWc+tLYgE1EZYIE0ITGVTeG+D3OUQo
	jSXQc3k3kEtReMsJFyo8X5/eUTn8qFBQFbVaZlbr2tKp1yjA1r9clJ4tUGFKXsUzlq5vpr
	KUEgDPyni0CzrYMp35A9b2wSQsLtFrW/QDnFfHmbVS44QPxyssVJhidbPJvHkAd1D6Stn0
	Whi65n2iz/3WdmvDH4YUwqES47marPJVV7is/eW6ZWJA1rXWEeoLofTWghxb4g==
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
Message-ID: <alR4jP1-qlcQNma1@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhJE-6NN7XnfG0iJAxEiV9PJx6pDbUEU5jgO__+qvuU5ug@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Jul 13, 2026 at 10:44:12AM +0800, 葉宸佑 wrote:
> Hi Weijie,
> 
> > I suspect that some contributors would run the get_maintainers.pl script
> > or b4 prep --auto-to-cc, so they did not cc Alex, as they didn't know
> > the current situation. Because I noticed that for both two versions,
> > Chen-yu didn't cc Alex or Dongliang or Yanteng. Am I right, @Chen-yu? ;-)
> 
> Yes, exactly. For both v1 and v2 I ran get_maintainer.pl, which only
> lists Hu Haowen and the mailing lists for zh_TW files, so Alex and the
> zh_CN team were never on cc.

Right, let's note this situation down. We'll deal with it after we come
up with the final solution.

> 
> > Given that this document has not been maintained for ~2 years and these
> > patches to the terminology actually don't have much significance, it
> > might be more appropriate to directly declare the status of Traditional
> > Chinese as "Orphan" provisionally for now, and remove it directly in the
> > near future, until Hao Wen's return and opinion. Or maybe, waiting for a
> > new good soul to take over, which is unpredictable.
> 
> Before it comes to that: I would like to step up and help carry zh_TW
> forward. I am a native zh_TW speaker from Taiwan, and I understand
> this means staying with it, not a one-off effort.

Nice and thanks. Frankly speaking, At the very beginning, I did consider
saying that I also wanted to take over, and I wished I could. However,
considering that I was certainly not familiar with the traditional
Chinese terms used in Taiwan (although I knew some, that was all), I
finally chose to be speak more conservatively.

> Dongliang, since you kindly offered to help review zh_TW patches:
> would you be open to doing this together -- either as co-maintainers,
> or with me listed as a reviewer (R:) first if that is a more
> reasonable starting point for a newcomer?

Since I was the one who shamelessly initiated this discussion, I
definitely have the obligation to do something. See below...

> > > To avoid scattering our efforts, I suggest we minimize fragmentation
> > > as much as possible. When it comes to technical documentation
> > > translation, not literary translation, a straightforward, unadorned,
> > > and free from misunderstandings is the best translation and easy to
> > > maintain. Let's keep thing simple, unless sth is really necessary.
> 
> Alex, I think this concern is fair, and I have no intention of
> forking the translation effort. The scope I have in mind is
> deliberately narrow: keep zh_TW aligned with zh_CN in structure and
> coverage, and localize only where terminology genuinely differs
> (e.g. 軟體 vs 软件, 介面 vs 接口) -- exactly the kind of differences
> you mentioned. Plain, accurate technical translation, no literary
> rewriting.

Exactly, before sending my first email here, I had already thought about
the following approach, what do you think?

  * Considering that English documents are changing so rapidly, and even
    simplified Chinese cannot keep up with them immediately. I suggest
    we start working on catching up with simplified Chinese right now,
    which seems like a good place to begin. (ok... seems exactly what you said ;-)

> Weijie, as a first concrete step I will prepare a terminology series
> (rather than one-word-at-a-time patches, as you suggested) covering
> the existing process/ documents, and use it to build a small glossary
> that future patches and reviews can follow.

I used to read this:

https://zh.wikibooks.org/wiki/%E5%A4%A7%E9%99%86%E5%8F%B0%E6%B9%BE%E8%AE%A1%E7%AE%97%E6%9C%BA%E6%9C%AF%E8%AF%AD%E5%AF%B9%E7%85%A7%E8%A1%A8

Is it comprehensive? I don't know. Perhaps we could add some specific
reference tables related to the Linux Kernel on top of it.

On Mon, Jul 13, 2026 at 11:49:07AM +0800, Dongliang Mu wrote:
> Chen-Yu,I would like to serve as co-maintainers to help maintain zh_TW. The
> script - tools/docs/checktransupdate.py can seamlessly work on zh_TW. This
> can help track the missing changes.

I would also like to take a job ;-) while my current contributions are
not sufficient. And wish soon.

> As discussed with Alex before, maybe zh_TW patches can first go to Alex's
> kernel tree and then push to Jon's tree. I am not sure if you are familar
> with the maintainer workflow. If not, this solution may be better for you to
> learn maintainer workflow.

I suggest that we could try out the provisional plan for about one or
two months (depends), and then make a formal change.

Before we make a formal change, I will monitor the list (CN & TW), If
there is any situation like this patch which is not sent correctly, I
will handle it promptly.

OK, I consider myself quite familiar with the development process and
the maintenance process, mainly from Git (seems more complicated).
Perhaps I can handle most of the operation and maintenance tasks of
chore, giving Chen-yu more time and concentration to focus on the actual
translation work. But this can be further discussed.

Thanks,
Weijie
