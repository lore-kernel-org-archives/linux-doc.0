Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EF4316905
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578344; cv=none; b=QqTGoM8wzFh4vXafd3H3IL5K+/z68Q9Jr57KqXQFirBGw++ynVTAdsR4vwxcLqWEL/ALd4ixYB3s7xDuPwPe7iW3eJy91BPjc3M+cuPqy9jOUIkti+lSykphLIhfbYIadch3OXLIup+cB9g+DKXwyr9VNkm5fUeytfU5SBu7T4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578344; c=relaxed/simple;
	bh=NVfxWOT6lNtXvj7cdzSc8CbIyf0ML0V992ZmlDzOX+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLtmOPnTKloWgpcu8aAaUYNSRSNefHEb91d9KYktFLqLMjywdnwt3Hf5XBAo61/ahG4BoGRewsWN6FnOhEAp/TlSNsGCeU+zXbVn9cQQh6Hu64lcgdpXYhqyqtiozM9B2KigFSKmYbCX4FInOAveeDrIXhVHVFAdCp4jlRdPBJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=kbKCftDn; arc=none smtp.client-ip=91.218.175.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="kbKCftDn"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NVfxWOT6lNtXvj7cdzSc8CbIyf0ML0V992ZmlDzOX+Y=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787578335; v=1; x=1788183135;
 b=kbKCftDndziROw3/WTIsA3r09i50srbkOsSgzW+QJI7DKPy0y2dXzem0TWnXqnIFIkJPJLCd
 LRUaFNdU4UY3KU3qBRiFvwOZXk9fqHEHPPu+3n0DTam/zSphtRBRuv0FSt/+NjlazMmpjfGbclq
 x+ucM7Ir5Szb79tWEfu64noSEkbv7dIjetZ6z8CxPh8TXwrseyFSlWQvWNmBshyDSiIH+slEnNz
 y4ZjyXqWv8Yt7i+0ARRN5cVtmklycV69+Qn82vLRdH8nTaXADQjnHtdvBf9Wv59U/P0Q2PN7r4n
 MhdsBCNA413A9Hmmn6Vr5YtBYcNxciClr8NhTxC/UNOqg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id fa9b8b22e66c8008;
	Mon, 24 Aug 2026 13:32:15 +0000
X-Mizu-Trace-ID: fa9b8b22e66c8008
X-Migadu-Flow: FLOW_OUT
Date: Mon, 24 Aug 2026 21:32:11 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Wu XiangCheng <bobwxc@email.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: update maintainer/configure-git.rst
 translation
Message-ID: <aoxH2xGlE_GY_Uyz@wyuan.org>
References: <20260823-configure-git-v1-1-3c65eefcc585@wyuan.org>
 <87y0dv1wp3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0dv1wp3.fsf@trenco.lwn.net>

On Mon, Aug 24, 2026 at 07:20:56AM -0600, Jonathan Corbet wrote:
> Weijie Yuan <wy@wyuan.org> writes:
> 
> > Upstream documented the common 'git tag -s' workflow and cleaned up
> > unneeded RST markup. It briefly updated the automatic lore Link: hook
> > for Git 2.41 and HTTPS, then removed that guidance because Link: tags
> > should only point to useful additional information.
> >
> > Add a SPDX-License-Identifier.
> >
> > Remove a useless top-of-file label, as Jon always tries to do.
> >
> > Update the translation through commit 944df7a31452
> > ("docs: update the guidance for Link: tags").
> >
> > Signed-off-by: Weijie Yuan <wy@wyuan.org>
> > ---
> > Hi Jon, I added a SPDX-License-Identifier for this file while the
> > original English one doesn't have one yet. Should I do that? / Is it
> > "legal" to do so? , if XiangCheng would be happy with what I'm doing.
> 
> It's sort of an interesting case, actually.
> 
> We don't know what license the original contributor intended, so it is
> hard to add an SPDX line to the original file.  That contributor hasn't
> been seen in the community for a while, so it may or may not be easy to
> track him down and ask.
> 
> A translation, though, is a derived product.  Since everything in the
> kernel *can* be distributed under GPLv2, it is fair to say that your
> work is GPLv2, so the result of the translation effort must be too.

Yes, this is exactly what I'm thinking about.

> That said, I think it's better to stick with the original where
> possible.

OK, agreed. Will do that.

> Note, however, that I am *not* a lawyer, and that taking legal advice
> from me is probably a bad idea :)

Aha, yes. ;) Then I'd better be cautious.

Thanks!
