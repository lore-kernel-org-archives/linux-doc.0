Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EF627F19F
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783232720; cv=none; b=N2iBFwJYOxJrHtkvJ2Rpg6ltyrcNPWzSn+tuUQvWjti3c8gQjX68ytZWEPtXG0ZgcwkkNedY0Mil/Pssum8IYThHqFnkonqwH4zPGJP6ST6vSGDiP/yq+ab5pWSNA4gqOlVN5MiGdQFvVXtxtXHOky0rqqWG6xtnG5bh5Xbl0Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783232720; c=relaxed/simple;
	bh=RErPmyILpqzEFhXrBTk4OkQQoGjCx117Bkx7rHMpnAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5rNR7H3GRIpE9iswgcSJeK9NBcSnIpDdtJ5Op4PIgk7QUYjGSpXNd4FU2/mLUslBkj7NpvOhzMy4Y2KLiyCd3RUUpZKThKgAQ/mLbBRuAC15okmXEhhd/NNPXX7A3PVttbvTu76SWxsiKxq3E40GHPRbqF9yixRKpupPLs6LAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Au2bn3I2; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Au2bn3I2"
Date: Sun, 5 Jul 2026 14:24:33 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783232707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFclTKUif0qFysD9TKrpqihFsPbogEYKcCeDpEflqag=;
	b=Au2bn3I2fjXw9V76SCrCgzjgrbLMsS664h3n9nuoSjRwyvKnN/x5VzZSqZNUUYSLilD7Ee
	VNsvak4Kw6IyogudY8+gBBbqGeEdlombsDDC/6VSkZ4MLzIBVy84aO37uHnwMqNG/t4thY
	eToSkQfeAm4NWczgmYT1tNZ3TvRZGRdRSbXKt/MMozD7bVnErs+zod4GJlayU19+DyCbxi
	KesrQgvEBl+/EA0oHEZCgCw/LOz+9Bk/+uqeQ07NYzDaWtNwjHbWi+fGj4beUIs38FRd0t
	5l4ib45y2A6i3e5ReloVfQvff71J1hswgo261cAsVG2+5xkoRZzraC4ILxhsgg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jiandong Qiu <qiujiandong1998@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] docs/zh_CN: update translations for
 process/changes.rst and sphinx.rst
Message-ID: <akn4oYmihmNHFOY7@wyuan.org>
References: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sun, Jun 21, 2026 at 09:12:10PM +0800, Jiandong Qiu wrote:
> Hi all,
> 
> This series refreshes the translation of doc-guide/sphinx.rst, I noticed
> that it refers to process/changes.rst, which did not yet have a zh_CN
> translation, so I added one as well.

Thanks for working on this series.

One minor readability concern I noticed in both patches is that some
simple tables mix CJK text with ASCII table markup. (correct me if I'm
wrong) Which are, patch 1/2 adds the "当前最低需求" table in
process/changes.rst, and patch 2/2 adds the tables under
"数学渲染器的选择" and "设置 SPHINX_IMGMATH 的效果" in
doc-guide/sphinx.rst.

These tables may look aligned with an East-Asian-width-aware
font/editor, but the column boundaries can look misaligned in some other
fonts, mail readers, or editors when reading the plain .rst source. For
example, the lore archive itself.

Also, I noticed that there are already some examples existing in Linus's
tree:

  https://docs.kernel.org/translations/zh_CN/security/SCTP.html#id2

Does this page below make it clear? I don't know :-)

  https://docs.kernel.org/translations/zh_CN/doc-guide/sphinx.html#id13

But I'm not familiar with rst and have never delved into fonts, it may
be better to ask maintainers to reach an agreement.

What do you think?

Thanks,
Weijie Yuan
