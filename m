Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E5B43FD16
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022723; cv=none; b=IlqWIM9e+ft+63Vlyl7vPE+E+OMjw6Ua4MgZLa+CxWai9nbBv6CwGrtEgKwaB0l7a4LY1DY91dmEkyOiWGnDQb1eY33EgpBL1vX7xJ0WiAX4cAM5Wpjq/WUdaxhUo+rn9cgaZxmI7JpSRJdRxnvkiEY3+C06fD4OwT18WQ4pxow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022723; c=relaxed/simple;
	bh=8zPxJvJyYu1lmEKTd2Dq6YXSeXICytyrcAa8pcW7rI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgdTTczPsyWLx78zOuO0NZbSmsZHwrOYB10SxQ0YUznKMMgWLvaGfhl2QgtlJyOe12GcGUIp3EAYPdRtdixNexJdaTDamaoNLJ01Acc1KAn2hLOWUknfen2lw75MI9s9EKyQC6oydt2LXFJojYkGN3qHJda/jLSc1kOlwydnDko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=lqzrtaxZ; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="lqzrtaxZ"
Date: Tue, 14 Jul 2026 17:51:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784022717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2a7cYUDZuvrtkKdj1u4JXAC0Mtc2K9S7k2f9Rj7lKOU=;
	b=lqzrtaxZcTbUQBVIoTCBt0kFf77CznMDJ5MR5wvFmrM3PECPZKh8oUm9AGcIZp3ACYS+ia
	50BeDZ7xN09Q5KBXlo8flyJQ1cdoIs/m5Gxf6+HiP5ZlHns9S2EG8V7ltQr3htB2cqfwi/
	b/ZZn4EJlgG72GHUfnCwiKJfjcWsjkBYr/4aX0ehUEzoAldxzVZdPld7zI2tiZimKQEF/v
	PphXVQBw8fh19aDe57Z2C84Rd4y+Mb1OgQK8HIJKaUj+/5zBE4FcJ4XPwklM8BmvqdriZ2
	xdTrm9tSTDgxZlvSfDTIoJVR3mMMEAIprhRVmVSqdcR4nZxVpRnBIgN69zPI8Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>,
	Yan Zhu <zhuyan2015@qq.com>, Doehyun Baek <doehyunbaek@gmail.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026)
Message-ID: <alYGtkVxW_0N-VqE@wyuan.org>
References: <alUXH8qRRjno2eZG@wyuan.org>
 <CAD-N9QVXqYxtsn7YuUtCDWrwwk5+iFAkT2jcs26zbDUfwhAwsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-N9QVXqYxtsn7YuUtCDWrwwk5+iFAkT2jcs26zbDUfwhAwsQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 14, 2026 at 05:32:12PM +0800, Dongliang Mu wrote:
> On Tue, Jul 14, 2026 at 12:51 AM Weijie Yuan <wy@wyuan.org> wrote:
> >
> > Hi all,
> >
> > Since I made many noise these days on the list, which took up a lot of
> > maintainers' time. This email summarizes the patches for zh_CN that are
> > currently pending on the mailing list.
> 
> This is awesome. Maybe we can establish a dashboard for the activities
> in zh_CN/TW related patches of linux-doc.
> 
> I personally kept a knowledge base in the IMA (an app for storing
> knowledge base in the cloud) in our club to monitor these activities.

I remember kernel.org itself already provides this:

  https://patchwork.kernel.org/

Is this similar to your idea? But I haven't look deep into patchwork
before.

Of source, having our own thing is definitely okay.

> > * Doehyun Baek (2026-07-08) 7 commits
> >   [PATCH v6 0/7] docs/zh_CN: update DAMON translations
> >   [PATCH v6 1/7] docs/zh_CN: update DAMON design translation
> >   [PATCH v6 2/7] docs/zh_CN: add DAMON_STAT usage translation
> >   [PATCH v6 3/7] docs/zh_CN: update DAMON index translation
> >   [PATCH v6 4/7] docs/zh_CN: update DAMON start translation
> >   [PATCH v6 5/7] docs/zh_CN: update DAMON usage translation
> >   [PATCH v6 6/7] docs/zh_CN: update DAMON reclaim translation
> >   [PATCH v6 7/7] docs/zh_CN: update DAMON LRU sort translation
> 
> Maybe I can take a review tomorrow.

No rush of course ;-)

> > Okay, I have checked the 200 most recent messages on the mailing list,
> > going back to 15:09 UTC on February 25, 2026. If I have missed anything,
> > or I made a mistake somewhere, please let me know.
> >
> > As you may have noticed, I borrowed (stole) this idea from Junio C
> > Hamano. Sending this kind of message, somewhat like a weekly status
> > report, not only helps maintainers keep track of outstanding work, but
> > also lets contributors know the current status of their patches.
> 
> As mentioned before, can we have a dashboard to see the status of
> patches in zh_CN/TW? This is more useful in my mind.
> 
> >
> > More importantly, it gives newcomers an overview of the current state of
> > the project. New contributors can begin not only by submitting patches,
> > but also by reviewing patches already posted to the mailing list,
> > thereby learning how our workflow operates. This may also help reduce
> > the review burden on our friendly maintainers.
> >
> > I would like to try this kind of periodic report as an experimental
> > effort, with its frequency adjusted according to the size of the patch
> > backlog and the level of activity on the mailing list. What do you
> > think? Please feel free to make comments.
> 
> I think this is fine since linux-doc or narrowly zh_CN/TW do not have
> many volumes of patches per day.

Exactly. I think Junio C Hamano has a script to do this automaticly, but
I did this manually because our volumes is not that high as Git.

> > By the way, I borrowed the subject line directly from Git's "What's
> > cooking in git.git". Does anyone have a better suggestion for the name? ;-)
> 
> fine with this title

OK, let's keep it now.
