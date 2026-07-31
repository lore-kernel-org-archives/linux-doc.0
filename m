Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905B53B8BB9
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521583; cv=none; b=RrS04Tiff4OSxu9kZo5M9iteKVF0qBXW1SSnJpi63WDhfD6BUy25kxsPq3sG24yghzt6T5Bf3pUvFPIdBEP7k9YEgDtg2BPw1XnGjmwQKjAUY5C8ZKrgYZ8aGjliwFwSG0mOBoqkfcYmQpRlBs9BxZheHCcwFzeNc+MPjFUeFIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521583; c=relaxed/simple;
	bh=EKp0QlZ7Z41OBDL+3m0kdCgpaZWCqX8BP82X8YTT0X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXbQX62KrCsmOyNOy0+9WDU3RbPRcvguRRPZq6mEkPgtk5rdg5SSfaQeHjE2gV1igYAA0yZuGvtV3sHCrqqWQyf+yArezDbZ+OOt8oE9gXTekF6IVaVjVPQ3MkyXsHcCoJndkgwoSnsOur7kSV6Xd+pyBoEGWU+eiKp1a1vm4AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=wz5s/8dc; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="wz5s/8dc"
Date: Sat, 1 Aug 2026 02:12:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785521578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9LvtD/qM38sY1e5Z1uBWEe24MJ7uhzriNNJTv3BZoM=;
	b=wz5s/8dcLe5CK+2ZM82QNULuuwJgEGxesKDtVhilhsDRKjeo2qOWw4zyI9rx3shE9xa0Ll
	BjfyyjCgZWsyXfrMmv3Vunmz3kZY1NhtR10CbJc+nF5X5FtibLrnSxgMhuwt4Z9ih8TamJ
	grfXOa1dZ+SARD4YH3QQUHspupgoD/ryDhtzJw8ymUBVMhWKKIsrSnyim08mbCG0TGYgxN
	bLf90dfEGBthhGXSnDInDSY5tdnxg6SM4O/l7thn/AnZp0A/N12RzlHUd3CX57zLNhte5i
	T35yc8mlcteycBq0YElmQyvF71VlPcUtlzml8vzg2jlf7Jf4gHd2SN04dOpD/w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/16] docs/zh_TW: process: localize terminology in
 7.AdvancedTopics.rst
Message-ID: <amzlmdeE0NA3Fnw4@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-2-chenyou910331@gmail.com>
 <amolg7NpObNT8Gnb@wyuan.org>
 <CAKspUh+v8cf-bndHUi8xNVQ2qMMUsRmku9vAaaAmF28AXWtnxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUh+v8cf-bndHUi8xNVQ2qMMUsRmku9vAaaAmF28AXWtnxg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 31, 2026 at 01:14:03PM +0800, 葉宸佑 wrote:
> > A small gripe: what is the best practice for reviewing a new revision
> > of a patch series after it has been rerolled?
> 
> Sorry about that -- a 16-patch Chinese series is about the worst case
> for this, and it is my problem to make easier, not yours.

That's OK, no need to say sorry. :-)

> For v3 I will use "git format-patch --range-diff=<v2-tag>", which puts
> a per-patch range-diff in the cover letter. That should at least show
> you which patches actually changed and how, without you having to
> reconstruct it.

Yes, that's how Git project is always recommending to do, while I'm not
familiar with the convention or requirements in Kernel series rerolls:

https://youtu.be/p79IjNay4mY?t=995&si=qgTDTBL9UzRH0eBx

And as I said, b4 diff could also do that, even though reading Chinese
diffs are not easy. Feels like that Git cannot recognize the inline
changes in Chinese very well. (i.e. & e.g. cannot recognize the actual
'word-diff' [1], such as: This is a [-bad-]{+good+} example.) And also,
this time many line breaks and reordering have been added.

[1] https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---word-diffmode

So I'm fine with it, such situations are not too frequent.

> Longer term this feels like something the zh_TW how-to should cover:
> how to send and review Chinese translation series specifically. I have
> been collecting notes while doing this one (line-width handling for
> CJK, why checkpatch miscounts Chinese lines, the reflow pitfalls) and
> would be happy to draft that section once this series lands.

Very much appreciated! Kind of like 'Writing docs for how to write
docs'! ;-)

Constantly summarizing and improving such documents will undoubtedly be
very useful for us and future contributors.

Thanks!
