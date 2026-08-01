Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED630E0EE
	for <linux-doc@vger.kernel.org>; Sat,  1 Aug 2026 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785601594; cv=none; b=nbND+5y1/DspB4RN/L6kFCbPU2YZccxRYtrt/UtZgRsPEo0Jx9cFNoK7ocIsFmtSZdnjSzV1hpGHOhZePLVfevax1aWlDPU/tQdXIckYWfT1TxtFGOmh7Q+BdBWaUSMT1g3L9OY+UcCiuIMODy/94IS9nt02sFKg3MUMO/Bt7i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785601594; c=relaxed/simple;
	bh=A+5PxE2iM2FV+MATdZ+dLGNprVDby/PmbTEozVSCeRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaESMB9FAlqU0M6b6xzqhH7nkfE9pDXnv750PW4+XYzoy51Y+UCtvsOa54KxK5u6+jygtX1M2gdFpG7GlFqAI5EQ/Mn7AuBgRARCQJeAcAfVOvG6wDMkyY8DRHNXg0ibYMbavgmQd0Rv4DZi2Xabl8O1NlwJ4Icr4RgKifO8YaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=ZAymfnuc; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="ZAymfnuc"
Date: Sun, 2 Aug 2026 00:26:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785601589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p4gW9+hKioOTTiRLvl6Dh8Bzq/fMTk8rVpXQUdVj9Sk=;
	b=ZAymfnucHDV2/6h8Nw1a9PX/c65S/TBwy4ZZ6E3Zq1ewLCgBnAEFLpL40iwi4bAhY8zXHZ
	b1F4nnpRK5yh0jZkmsuZr3RGwbMLTLBd7Mn3xP0delVRkqAaVQ0VjwunmqZLmAU2Cs8KcD
	af4KDmiZfMM/X3CMNxgLUjot9ZOdtT3enZFkRixeUhBOcIMjSc1ji5fwWXphWo1oZyu7Lc
	FzvCuWOVtGKvuumYOZJLksLTXGl6t2uTwWCLONZjfp7gLKXPlewPJi8TXr918Bv5ZqjbM/
	afXW9bjA5G7TNik6PqJgJPPxHFPVB9CR2fxSdgTuEFRGkYZDlu+hnq2tlqBhfQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/16] docs/zh_TW: process: localize terminology in
 code-of-conduct-interpretation.rst
Message-ID: <am4eJ9ER0QPz-i1C@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-4-chenyou910331@gmail.com>
 <amouJSTjAMh-pK6S@wyuan.org>
 <CAKspUhKS64JTa8V=3K_v0fnGBn4CKRnmrReQD21WmA8srKw3cg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhKS64JTa8V=3K_v0fnGBn4CKRnmrReQD21WmA8srKw3cg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 31, 2026 at 01:19:58PM +0800, 葉宸佑 wrote:
> On Thu, Jul 30, 2026 at 12:45:25AM +0800, Weijie Yuan wrote:
> > If the following comments are due to my overthinking, then
> >
> > Acked-by: Weijie Yuan <wy@wyuan.org>
> 
> Not overthinking at all -- two of the three are real improvements.
> Thanks for the Acked-by, I will carry it over.
> 
> > > +當個人在違規發生的場合承認自己的行為並作出彌補時
> >
> > In zh_CN, I think we prefer '纠正' (纠正行为). Just a reference.
> 
> You are right, and this is not a cross-strait difference. 彌補 in
> Taiwanese usage takes a loss or a shortfall as its object (彌補損失,
> 彌補不足), so 彌補行為 reads oddly. The English is "makes amends",
> i.e. corrects the behaviour, so 糾正 is the right word here and is
> equally natural in Taiwan. Will change to:
> 
>   當個人在違規發生的場合承認自己的行為並加以糾正時

Nice. Thanks.

> > > +行為準則委員會有責任與所有相關方合作，調查並解決這些報告。
> >
> > 处理报告 or 解决报告？I don't know Taiwan's preference.
> > I would do this in zh_CN:
> > 行为准则委员会有责任与所有相关方合作，对这类报告进行调查并予以处理。
> 
> Also right, and again not a regional difference -- 解決 takes a
> problem as its object, not a report, so 解決報告 is simply wrong in
> both variants. Taiwan says 處理報告 / 處理申訴. I will follow your
> sentence structure:
> 
>   行為準則委員會有責任與所有相關方合作，對這類報告進行調查並予以處理。
> 
> > > +行為準則委員會衷心希望，需要要求公開道歉的不可接受行為，在未來仍然極為罕見。
> >
> > 行为准则委员会衷心希望，那些需要公开道歉的不可接受行为在未来能继续成为极为
> > 罕见的现象。
> >
> > .. seems more clear and coherent?
> 
> This one I would rather keep as is, if you do not mind. Both are
> understandable, so this is a style call rather than a
> correctness one.

Agreed that this is just style call, so doesn't make much sense. I'm
definitely fine with your decision.

Thanks!
