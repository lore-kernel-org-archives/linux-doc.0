Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102473C0A1B
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053076; cv=none; b=nnEgrTnD1aH9dHhT9ffNoRROI8aYr1UI9YMChgVusjuv5/1TZYmBrZ6Yl5KfxAVemyOyXU/HkBVEUNzn8aAcZaTBIv4taMIO4qyTnZSqF3+m5/JPxlS8Nt1XOhZc8WIc6SLPvXsZw24fjREmEB24lU7ijbt6Er6ndWfoH7UoFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053076; c=relaxed/simple;
	bh=8uFUMG/y2FQTaI9putOGxq/IhR2RVTiqiesqfrLcMGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5iLRkaI5Pj7mw+Hv78LKy69Tt1cQ9+kPr98a1lX5dE8x5W2a5as8BHjQ8swr1f/hN6dP7Zdf3P+WvfZQwyk9nsSmtVNeI3YIinJmSl3CIv0GCPqHoTVbDrQBfQbr2gQEzdXOjXbuKEsBT9RatSZrMKkvb5vqB1izfZalFeL0tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=ucs+gwSx; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="ucs+gwSx"
Date: Wed, 15 Jul 2026 02:17:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784053072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKFMkgqosyViKcB2x507n7iQ8e5UUkuAaHVddycnM9U=;
	b=ucs+gwSxAm2JZ7kWG81MlBd0Le0bGfXZruKsak1nxH9AOIB9kpbDaM6oaJhfeW1c3Z148v
	ob3LkWDapbaw6mEuHwHm683+K/iH31lQuJOLS8ubj5AC+dUWLg2X6/qNF4utjMCPK9e0iL
	grd95xkdgmm4YLohkMTp2HMLqSyVwASRTdlrdH7oL4Ql0JcVgkgQWZp/P7zqLhWkOsuEBp
	Y1aCv34WADxCTbGiKC9MrExyBn8EglJuI4XF0mLwH7/+e0cle7NIC+gYuMl12ruKs4oIti
	GUz1duR6eEdhbYtdtR1HRjy/YXf7SomUyxrgPCWrBGlicCZpCMqDugSSGySo8w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>,
	Yan Zhu <zhuyan2015@qq.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>,
	chengyaqiang <chengyaqiang@tsinghua.edu.cn>,
	Haoyang Liu <tttturtleruss@gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026, #02)
Message-ID: <alZ9Pnxf4GylfRo5@wyuan.org>
References: <alZK0i0HvxOvSKwj@wyuan.org>
 <alZP_6nAXNy_HfZi@wyuan.org>
 <CAN-j9UoUHQ2i4H+9G-XK_mOfKKyE9K9-mwUgPc+4yOVfiizgmA@mail.gmail.com>
 <alZ1AzLX8LrB-JFK@wyuan.org>
 <CAN-j9Uo2f4dmWo8bMkdtXg7g6uayK_XZatkGs5iKv6-dNZ_Y-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN-j9Uo2f4dmWo8bMkdtXg7g6uayK_XZatkGs5iKv6-dNZ_Y-g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 14, 2026 at 07:56:28PM +0200, Doehyun Baek wrote:
> > Btw, for example, my patch (Weijie Yuan · docs/zh_CN: add docs-next
> > checkout workaround) is actually directly discarded after we reached
> > a consensus during our communication (with Dongliang). But it's
> > obvious that we didn't say it explicitly. So your website can't
> > recognize it automaticly right now. Perhaps we can think about how
> > to deal with this situation later.
> 
> Yeah, this is a downside of an automated approach: it can miss details
> that are only implicit in the discussion. I see roughly three ways to
> handle such cases:
> 
> 1. Allow authors to mark a patch explicitly by replying with a
> recognized phrase, such as `Patch-status: withdrawn`.
> 2. Use natural-language reasoning, perhaps with an LLM, to infer the
> outcome from the discussion. I leaned against it due to cost and
> complexity.
> 3. Leave the patch pending and let it move to "Cold" automatically
> after 30 days.

Junio originally uses "Stalled", but I don't think there's a difference
though :-)

> I think either the first or the third option makes sense in this situation.

Agreed.
