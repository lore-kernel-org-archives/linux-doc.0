Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A81132FA14
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 13:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319818; cv=none; b=E+ppUhn+93i0ni8D/qSNEU0/Y9yabAo62wrJeJH9lnozWGqX5BCLqx1K5UhPtgkdnu5XzmeaUITL7IGkwZVKm9+bpFvUHf5OKzuFRNO6E9dXQJMm51hiSV4yos5eSXFMtM+uYpFD13WRMPBMajj7dNERMx2KyFILdN5cDfJuSTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319818; c=relaxed/simple;
	bh=QtKnEcC7klDCGqTqGwgAexXX/NMx6zKYoYrislyfMtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAzIP4uuUXh3wq/pO6J0hj1NvN+LyXMNKazcQbUEkDQUfGKNNz8UH/8xN/wCB7NSW97C36o3bZrckff9kgJAAbFEwqS1/rYESjr3Xr3EBcpdVHCmomcm6ZcIFCB3XQ4mcOA2v9QK+Cd6l/8z8achPBA0AIRgXv2iceAW/8Tpths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=X5uioMYm; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="X5uioMYm"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QtKnEcC7klDCGqTqGwgAexXX/NMx6zKYoYrislyfMtM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787319813; v=1; x=1787924613;
 b=X5uioMYmI980niTX4LcfYld6QJEoAtWnwln0KLateJ5rd0oECpvIMu8iG5F/20SbwUlUXAnp
 iN5F7DSg6E1T0+E4E/Evx2IrnIbfIxAxfvUBsUJEFWF46i5LsWKlA8lg6Zt7k+SF7/dz5Fx04lQ
 g91LjSP2+z4KRwQ3nTuJzznv9WcreMEHCnY74yIeHac8NAcZVghhW50+VH+dXqhoyA5ouv+0Zff
 xco/jPHckmOdLXL6Z9dynVwEkg6xCHjQkVo5QGEDV8Bg7h/vS5LSpX/OGXdTjLIYyJIL82pKiyH
 qUWpuKyZ6CsoBt/4Twv06ZdkA8nZIt1D+QDg+uxGnzhGA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id ef6dbb15447a4a71;
	Fri, 21 Aug 2026 13:43:23 +0000
X-Mizu-Trace-ID: ef6dbb15447a4a71
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 21:43:15 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: What's cooking in Chinese docs (Aug 2026, #01)
Message-ID: <aohV85J4mBKAxDwV@wyuan.org>
References: <aoLkMBQszbzqYowy@wyuan.org>
 <aoWmQ965W4WxU4yZ@wyuan.org>
 <01451650-af87-4362-bda2-3ba17fda386a@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01451650-af87-4362-bda2-3ba17fda386a@hust.edu.cn>

On Fri, Aug 21, 2026 at 09:06:52PM +0800, Dongliang Mu wrote:
> > > Copies of the source code to Chinese documentation development tree live
> > > in here:
> > > 
> > >      git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
> > >      https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
> > >      https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs linux.git
> > > 
> > > Mirrors:
> > > 
> > >      https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
> > >      https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)
> > BTW, I just set up a mirror at github.com:
> > 
> >    https://github.com/kernel-zh/linux-zh_CN
> 
> That's a good idea. I remember Haowen maintained his tree in the Github.

Yes, and I planned to put a zh_TW tree on it later, but no decided yet.

I need a little time to think about it. By the way, I´ve also been
talking with folks from l10n-tw recently, hoping to get more people
involved. Some have mentioned that the email-based workflow is a bit
cumbersome and that the barrier to entry is somewhat high.

and they are doing this job differently:

https://github.com/localizethedocs/linux-docs-l10n

I will communicate with them later to see if we can cooperate or not.

> Maybe CDN is also worth a try.
> 
> We will setup a code hosting platform in the HUST. It's not a good idea to
> host git repository in the mirror site.

I recently came across your work - it looks great, and I'm looking
forward to seeing where it goes! And yes, the load and cost of running
mirror sites have been getting higher and higher lately, sadly.

> > It uses a relatively bare-bones GitHub Action to sync from kernel.org
> > every day (I guess it can do every 2 hours as well, but every day seems
> > fine, as I'm afraid that if the frequency is too high, there might be
> > problems.)
> > 
> > I don't know much about GitHub Actions, so if you have a better solution
> > or thoughts on this, please let me know. Or, I would be very pleased to
> > invite you to take over the org account and set it up.
> 
> LLM helps here. It does not need any sophisticated technique.

Yes. And it seems there's no problem with the synchronization these two
days.

Thanks!
