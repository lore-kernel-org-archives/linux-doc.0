Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0272737E0
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103748; cv=none; b=oNuwabzf6ywWHjA3ebHeGtRWSgZNqnANcqBSIPXPK+0LgnQmBwVdTgTXJMbhy50Ppj7d9o21Adu9oBFtVPeOv3PwyCn1uikK0ODES0BATxL6dJhaMNUWwh7ouq4gCBu4ogSbXQaafv2+dLsmx7KZBpFzzDYc8KxPL47fCxaXSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103748; c=relaxed/simple;
	bh=i65LtWBMr2s2HwkeyYiUKhdgh3vjscF1oTYwe/om1Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=GaTLIbtgWdZeECN1NUnYnOQHq+M+hF5m13uT8HI5y/i3TV2UY/jULkeXmad3zX5D4mUv4hKbwxNPB/2edMAtXsq+u1Lnmjbko+gyymArvm4lV3nXdJv3v0ScbD+OhS+ha2G7Bk2LiuIbrCICxSUIZ42YdLew5PLTjGzgwJFZ9Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=HutVduh9; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="HutVduh9"
Date: Wed, 15 Jul 2026 16:22:17 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784103744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=V0eWX5FBzONESbrfHB0LNZUgIsiwVae3zAjRbylmRkw=;
	b=HutVduh9a98W96zqCqt50O7kj4Zt62YjQoSBKre8q5j1hMamUi8se/X6X3YSydiqccpqtJ
	gxe+KDohZcm7k8AGJEEtAiqfUPB/cG1pZ2z/Ql409QyFeyWHbqEsjp9cF1S/vNtMqTjd/V
	rNPd3MdJZRw0xV+1etoGYZqJh/uW8OBRWNa5OB/22ZQHOHSqhAAHyPvPjm5vf6vVEkHoXA
	8g0nkxJdy4JXURDXmpdlpntBvAyrTe01GgQmCFEmoeD6ZbFe/YnsJD7Qg2hTSVZ//wAMVD
	J3XyepgiPad8Ob15IvQBRbpRW0MA4TF1EnZQjGAF2Y+l9D2nQdBzmz3gaimoQQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <seakeel@gmail.com>,
	Doehyun Baek <doehyunbaek@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Ben Guo <ben.guo@openatom.club>,
	Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>,
	chengyaqiang <chengyaqiang@tsinghua.edu.cn>,
	Haoyang Liu <tttturtleruss@gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026, #02)
Message-ID: <aldDOZUrpvcF8dpv@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <143bc26b-5496-4770-a0a2-5ea1d1fed9da@gmail.com>
 <52d302fc-ed86-4d5e-8b68-b8a99226bf98@hust.edu.cn>
 <d9e57996-f71a-4cda-b1c4-ac375429c180@hust.edu.cn>
 <ecae49cd-4861-44e0-b873-6ca98e205855@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 15, 2026 at 09:55:35AM +0800, Dongliang Mu wrote:
> On 7/15/26 1:56 AM, Doehyun Baek wrote:
> > > Btw, for example, my patch (Weijie Yuan � docs/zh_CN: add docs-next
> > checkout workaround) is actually directly discarded after we reached
> > a consensus during our communication (with Dongliang). But it's
> > obvious that we didn't say it explicitly. So your website can't
> > recognize it automaticly right now. Perhaps we can think about how
> > to deal with this situation later.
> > 
> > Yeah, this is a downside of an automated approach: it can miss details
> > that are only implicit in the discussion. I see roughly three ways to
> > handle such cases:
> > 
> > 1. Allow authors to mark a patch explicitly by replying with a
> > recognized phrase, such as `Patch-status: withdrawn`.
> 
> This is better.
> 
> Or similar to syzbot, we can provide an option in the webpage to directly
> mark patchset as invalid.

Do we need to consider the bidirectional synchronization of the state?
If the marking is only done on the dashboard and not synchronized with
the lore list, it seems likely to cause confusion. Imagine having to
switch between two pages repeatedly to check the status of a series.


On Wed, Jul 15, 2026 at 09:46:26AM +0800, Dongliang Mu wrote:
> On 7/15/26 1:42 AM, Weijie Yuan wrote:
> > On Tue, Jul 14, 2026 at 07:05:28PM +0200, Doehyun Baek wrote:
> > > I "cooked" up a small website this evening that attempts to automate them:
> > > 
> > > https://doehyunbaek.github.io/cook-linux-zhcn/
> > > 
> > > Every hour, a GitHub Actions workflow scans recent `docs/zh_CN` patches on
> > > the linux-doc mailing list, groups rerolls, and compares their subjects
> > > with Alex큦 `docs-next` tree to determine whether they have been applied.
> > > Pending series with no update for more than 30 days are classified as
> > > "Cold."
> > > 
> > > This is still an experimental prototype, and its heuristics may have bugs,
> > > particularly when threads or patch subjects change. The source is available
> > > here:
> > > 
> > > https://github.com/doehyunbaek/cook-linux-zhcn
> > > 
> > > Issues, suggestions, and pull requests are welcome!
> > Btw, for example, my patch (Weijie Yuan � docs/zh_CN: add docs-next
> > checkout workaround) is actually directly discarded after we reached
> > a consensus during our communication (with Dongliang). But it's
> > obvious that we didn't say it explicitly. So your website can't
> > recognize it automaticly right now. Perhaps we can think about how
> > to deal with this situation later.
> 
> We can set a terminal instruction like "Applied, thanks" to automate
> the end of patches.

LKML provides a bot [1] that can automatically send a email when a git pull
is done by Linus Torvalds. But it is for mainline only now. :-(

I originally planned to integrate it with our status board and avoid
having Alex manually reply "Applied" each time.

Then I realize b4 provides a feature [2] that can automatically seed
feedback to the original series when a series is merged or so. It may
save maintainer's time and trigger some automation, but I don't see our
maintainers using b4, so there's a learning cost. At the same time,
automation may bring complexity, which is a trade-off.

[1] https://korg.docs.kernel.org/prtracker.html
[2] https://b4.docs.kernel.org/en/latest/maintainer/ty.html


On Wed, Jul 15, 2026 at 09:52:20AM +0800, Alex Shi wrote:
> On 2026/7/15 01:05, Doehyun Baek wrote:
> > Hi Weijie,
> > 
> > Thanks for putting together the "What큦 cooking" reports!
> > I "cooked" up a small website this evening that attempts to automate them:
> > 
> > https://doehyunbaek.github.io/cook-linux-zhcn/
> > <https://doehyunbaek.github.io/cook-linux-zhcn/>
> 
> Nice work!
> Maybe add a build testing result for each of patches, like 'make htmldocs
> -s', although build should pass before send out patches, but it often be
> omitted.

Sounds like we are going to build our own CI platform. ;-)
