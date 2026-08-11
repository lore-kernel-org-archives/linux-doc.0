Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B52931D3
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 04:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421088; cv=none; b=cBoeUJO8pvohKtzIwYpCMfMwnUJAeKIZBaPYc9WUpJZsiYfohBOvDhT1H80KFyuCoIBkjg/BD0kkOMWd12PhKhdZnRoGpNhQ6Saaa+LuQ1Bi3njS2cxGCINxB2YYWQH8E4bTM2ZJ8IcyCxJnYiJ6/Y6wrsNjFwJju6ZEPzH/wNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421088; c=relaxed/simple;
	bh=8qHcHKTf37z84C1TpcBIna+Z8IPgcdcdnQQrEpH5TE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXa1pLdhXSvHXNm9f9ZDvvc75pzOGgLaRmcdGzwm7JPnRXzveyim0JWRyV2FnLrOOD9ym+mTqxokCJGS9EKNsOQrLE4uoBdC4XteDNoy7NAUh6IyH/SlHIiLSicrBTPJcyJY1IBhjtCqenV9sbl9fbUFu958N2osWpsPGtJl1eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=OIMoBF/e; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="OIMoBF/e"
Date: Tue, 11 Aug 2026 12:04:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1786421083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bnct8wpSSJVBq9Uev1slKvcml2+2qDgXSxoB9jioqm8=;
	b=OIMoBF/eMJqC8ugYidMg4ihV/od47X9JQubS/F7o0LIKHv/Lt4ywHyBeoaOL4TUnwpHBZB
	ZVn/YuI7lVwzKJS2JjYStOeWSn26Gm+leBt4lzMI7kcwGwvxEqmisO9r9GI2Wnl3zkpQoC
	BmNffgYWCXSNovC7ljAU+Z3wlPZ2ZmCjrHoon22XRN3omaNyobJv2oYqw/DOOKagM4HlpX
	blmFLMtj5c45lYDKXaDO/AbiQ9WSi9+GN3bSA928DDzEUyCU9tyg2pmM5qc4+I84PfjGc9
	OQRCDZ7RpyQY4JD+CIo4qUkebODQ2wlA31KF9LMSiHBQUga1sGCeOBLbA7I0BQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/16] docs/zh_TW: process: localize terminology in
 2.Process.rst
Message-ID: <anqfRvYGG5-mvKt4@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-11-chenyou910331@gmail.com>
 <anDANHRAHb3wr2o8@wyuan.org>
 <CAKspUhL-1fh8o19aEvLzxVGMqvnFtmP0XksS7ni5QCYNBWqSKw@mail.gmail.com>
 <anXddDML5sw8loCQ@wyuan.org>
 <CAKspUhJryJv0ebW2cjGzcAPHRE4AtFjGKF7aZbpdS4R7AhXdkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhJryJv0ebW2cjGzcAPHRE4AtFjGKF7aZbpdS4R7AhXdkQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Aug 10, 2026 at 02:59:55PM +0800, 葉宸佑 wrote:
> On Fri, Aug 07, 2026 at 09:28:20PM +0800, Weijie Yuan wrote:
> > I might be more inclined to remain neutral, so I would prefer to hear
> > the opinions of others. Or we could take a look at how zh_CN and
> > jp_JP handle it.
> 
> Fair enough -- I put that entry in the v3 glossary before seeing this,
> so let me pull it back to a description rather than a rule.

Agreed.

Just like what Dongliang said, a clearly and explicitly stated rule for
this is not necessary now, because we need more contributors, obviously
;-)

> Here is what the other locales look like, same measurement (a CJK
> character directly adjacent to an ASCII alphanumeric):
> 
> zh_CN    有空格   3624 / 無空格  11022
> ja_JP    有空格    128 / 無空格     70
> ko_KR    有空格     93 / 無空格      0

wow, thanks for the statistics.

> > Or: for new articles, we can start to require spaces between.
> 
> I am sympathetic, since spaces are what I would write myself. My worry
> is that it makes the tree inconsistent in a way that is visible within
> a single document -- a reader opening howto.rst would see one style in
> the paragraphs we have rewritten and another in the ones we have not.
> Right now the inconsistency at least correlates with nothing in
> particular.

So apparently I guess this is without doubt: we keep the same style in
current _existing_ articles. And then we are discussing what would be
the preferred style in new translations.

> So I would suggest either:
> 
>   (a) describe current practice in the glossary without making it a
>       rule, and revisit once we have more contributors, or
>   (b) agree on spaces as the target style, and let it spread naturally
>       as files get rewritten -- accepting mixed files in the interim
> 
> I lean towards (a) for now, but I do not feel strongly. If you or the
> zh_CN side prefer (b) I will follow. Either way I can adjust the
> glossary in v4 or as a follow-up.

Both fine I guess, since it's not a big deal.

Correct me if I'm wrong: having spaces or not *does not* affect
rendering as HTML. So, (kind of out of topic, sorry) I'm quite curious,
Do people prefer to view the HTML version of the webpages or the plain
text version? (For the whole documentation, not only translations)

I happened to be reminded that I missed some interesting and useful docs
just because I preferred to read docs on docs.kernel.org, while that
file is not listed in the index.rst file, so I didn't notice it before.
But this seems to be an issue more for English Documentation though. [1]

[1] https://lore.kernel.org/linux-doc/amjsCufED-hm3ixe@wyuan.org/
