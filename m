Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB0D26B755
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902336; cv=none; b=OR9tT+/uBozcd5AAm5ON92Rv8yXrvgHZlVAKT989bvCxQWh3KlDMqL1RPNtTAZGQfROsiX7go6Q1tLRSlnp/JFJV02UY2k25vxi7dbKgH8HbePxFjjq1Nf2bixVWIhMZJI3fvJkhV2Hn5Y9ipSXTxGW7Bp6aers+Z6MqkE/Ksf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902336; c=relaxed/simple;
	bh=4TcdLwhp2JvOROmDdnBJT+W2ac+MemSO81FQxQd5YJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1EH2ITQfC/G/qqRN5VhyJDTWaTW0gVoTBV0A5oun9ciIRsYbrc+vnY5hk/5mULUr46iCIGllbur82rCqazZtKINAvkHMOJXhjg2w+MexhaiSt4cIRL943sbm8z0u5dv58H2T2VdhlkfRQcdcVZowByZiUdOlPUiClxtyNrFbkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Date: Fri, 24 Jul 2026 22:11:47 +0800
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/16] docs/zh_TW: process: localize terminology in
 5.Posting.rst
Message-ID: <amNyo0S01mX_TPGS@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-10-chenyou910331@gmail.com>
 <amG8fvBhiB4qb7bV@wyuan.org>
 <CAKspUhLpAn=WEHW7rZZGeWKzNZ0waaO7c4hEUDHcF=2vrqCakA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhLpAn=WEHW7rZZGeWKzNZ0waaO7c4hEUDHcF=2vrqCakA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 24, 2026 at 02:40:24PM +0800, 葉宸佑 wrote:
> On Thu, Jul 23, 2026 at 03:02:22PM +0800, Weijie Yuan wrote:
> > In process/stable-kernel.rules.rst, you keep "-stable" as-is, so here,
> > shall we change to "-stable"/"stable" instead of "稳定版"?
> > I don't know what's the preferred one in Taiwan, though.
> 
> Good point, the two files are inconsistent. As a native speaker: in
> Taiwan we normally say "stable" in English when referring to the
> kernel's stable tree or the -stable releases, so keeping -stable
> untranslated reads more natural there. Where the text means "a
> released stable version" as a common noun, the Chinese wording is
> fine.
> 
> So the rule I would like to follow is:
> 
>   - -stable / stable tree / stable branch  -> keep as-is
>   - "a stable release" in the general sense -> 穩定版本

OK, I'm fine with both. I feel like I both use stable and 稳定版 in my
daily life, sometimes depends the context. But both understandable.
Personally, I tend to avoid intermixing English in my Chinese writing as
much as possible. However, sometimes it is inevitable to do so. And one
can easily provide counterexamples as well.

On the other hand, there are too many instances of the words "stable"
and "稳定版" throughout the existing document, so there is no need to
change them. Just apply the current regulations to the new articles.

So there's no need to worry about this. Cheers!
